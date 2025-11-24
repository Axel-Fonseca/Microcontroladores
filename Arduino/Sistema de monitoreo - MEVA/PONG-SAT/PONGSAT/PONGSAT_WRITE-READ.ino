// Include necessary libraries
#include <SPI.h>                          //SPI communication Library
#include <SD.h>                           //SD memory card Library
#include <Wire.h>                         //I2C communication Library
#include <SI7021.h>                       // Humidity Library
#include <Adafruit_BMP280.h>              // Pressure Library

// --- Declare global variables ---
float currentMillis;                      // Time variable
float previousMillis = 0;                 // New Millis variable
const int interval = 1000;                // Set interval to 1 sec
int celcius, relativeHumidity;            // Humidity sensor variables
float temperatureP, pressure, altitudem;  // BMP sensor variables
String humidity_buffer, pressure_buffer;  // Humidity string buffer & Pressure string buffer
File csvFile;                             // File variable   
SI7021 sensor;                            // Humidity sensor variable
Adafruit_BMP280 bmp;                      // Pressure sensor variable

void setup() 
{
  Serial.begin(9600);                     // Initialize serial communication
  Wire.begin();                           // Initialize I2C communication

  // ---SD Card setup ---
  if (!SD.begin(10)){
    Serial.println("SD init failed...");                        // Print error message if SD card initialization fails
    return; }                                                   // Return if any setup fails
  else Serial.println("SD init successfully...");               // Print success message if SD card initialization is successful

  // --- Humidity Sensor Setup (SI7021) ---
  if(!sensor.begin()){
    Serial.println("SI7021 sensor init failed...");             // Print error message if humidity sensor initialization fails
    return; }
  else Serial.println("SI7021 sensor init successfully...");    // Print success message if humidity sensor initialization is successful

  // --- Pressure Sensor setup (BMP280) ---
  if(!bmp.begin()){
    Serial.println("BMP280 sensor init failed...");             // Print error message if pressure sensor initialization fails
    return;}
  else Serial.println("BMP280 sensor init successfully...");    // Print success message if pressure sensor initialization is successful

  csvFile = SD.open("PONGSAT.csv", FILE_WRITE);            // Open a new CSV file for writing data
  if (!csvFile) {
    Serial.println("Error creating CSV file...");
    return;}
  else Serial.println("CSV file created succesfully....");

  if (csvFile) {                                                        // If the file is open, run the next code
    csvFile.print("Time(s),Temperature(C),Relative Humidity(%),");      // Write the header for humidity data in the CSV file
    csvFile.println("Temperature(C),Pressure(Pa),Altitude(m)");         // Write the header for pressure data in the CSV file
  }
  else return;                                                          // Return if opening the CSV file fails
}

void loop() 
{
    // --- Sensors reading every 1 sec ---
    currentMillis = millis();                                           // Get the current data acquisition time in milliseconds
    if (currentMillis - previousMillis >= interval) {                   // If the interval has elapsed
        previousMillis = currentMillis;                                 // Reset the previous time to the current time

    // ---Read temperature and humidity sensor values into variables (SI7021) ---
      celcius = sensor.getCelsiusHundredths()/100;
      relativeHumidity = sensor.getHumidityPercent();

    // ---Read temperature, pressure and altitude sensor values inro variables (BMP280) ---
      temperatureP = bmp.readTemperature();
      pressure = bmp.readPressure();
      altitudem = bmp.readAltitude(1013.25);

    // ---Construct data strings for humidity and pressure data ---
      String humidity_buffer = String(currentMillis/1000)+","+String(celcius)+","+String(relativeHumidity);
      String pressure_buffer = ","+String(temperatureP)+","+String(pressure)+","+String(altitudem);    
    
    // --- Write humidity and pressure data to the CSV file --- 
      if (csvFile) {                                                         // If the file is open, run the next code
        csvFile.print(humidity_buffer);                                      // Write the strings into the CSV file
        csvFile.println(pressure_buffer);
        Serial.println("New line has been written...");
        }
    }

    // ---Read and print the CSV file data to the serial monitor ---
    if (Serial.read()=='r') {                                               // Press 'r' in the Serial Monitor to start reading the csv file
      csvFile.close();                                                     // Close the CSV file and preparing for reading
      csvFile = SD.open("PONGSAT.csv",FILE_READ);                          // Open the CSV file for reading the data

      if (csvFile){
        int buff = csvFile.available();                                    // Check number of bytes available to read 
        Serial.print("Bytes to  read: "), Serial.println(buff);            // Print buff
        while (csvFile.available()) {                                      // While there are bytes available to read, read the CSV file and print in the Moitor Serial
          Serial.write(csvFile.read());
          }
        csvFile.close();                                                   // Finish the reading time and re-open for Writing
        csvFile = SD.open("PONGSAT.csv", FILE_WRITE);
      }
    }        

    if (Serial.read()=='f') {                                             // Press 'f' in the Serial Monitor to finish the program
      csvFile.close();
      return;
    }
}