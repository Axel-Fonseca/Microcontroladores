#include <SPI.h>
#include <SD.h>
#include <Wire.h>

#include <SI7021.h>           // Humidity Library
#include <Adafruit_BMP280.h>  // Pressure Library

double totTime;      //Time variable
File csvFile;             

// Humidity globals
SI7021 sensor;

// Pressure globals
Adafruit_BMP280 bmp; // I2C

void setup() 
{
  // Initialize I2C communication
  Wire.begin();
  Serial.begin(9600);

  // SD Card setup
  if (!SD.begin(10)) 
    return;

  // Humidity Setup
  if(!sensor.begin())
    return;

  // Pressure setup
  if(!bmp.begin())
    return;

  csvFile = SD.open("ps.csv", FILE_WRITE);

  if (csvFile)
  {
    csvFile.print("Time(s),Temperature(C),Relative Humidity(%),");
    csvFile.println("Temperature(C),Pressure(Pa),Altitude(m),");
    csvFile.close();
  }
  else
  {
    return; 
  }

  // Setup delay
  delay(4000);
}

void loop() 
{
    // Humidity Shield values
    int celcius = sensor.getCelsiusHundredths()/100;
    int relativeHumidity = sensor.getHumidityPercent();

    // Pressure Shield values
    float temperatureP = bmp.readTemperature();
    float pressure = bmp.readPressure();
    float altitudem = bmp.readAltitude(1013.25);

    totTime = millis();

    // Data packet
    //String data_packet=String(celcius)+","+String(relativeHumidity)+","+String(temperatureP)+","+String(pressure)+","+String(altitudem)+","+String(accelX)+","+String(accelY)+","+String(accelZ)+","+String(temperatureA)+","+String(compassX)+","+String(compassY)+","+String(compassZ); 
    String humidity_data = String(totTime/1000)+","+String(celcius)+","+String(relativeHumidity);
    String pressure_data = ","+String(temperatureP)+","+String(pressure)+","+String(altitudem);

    csvFile = SD.open("ps.csv", FILE_WRITE);

    if (csvFile)
    {
      csvFile.print(humidity_data);
      csvFile.println(pressure_data);
      csvFile.close();
    }
    csvFile = SD.open("ps.csv",FILE_READ);                              // Open the ps.CSV file for reading the data

    if(csvFile){
      int buff = csvFile.available();                                   // Check number of bytes available to read 
      Serial.print("Bytes to  read: "), Serial.println(buff);           // Print buff
      while (csvFile.available()) {                                   // While there are bytes available to read, read the CSV file and print in the Moitor Serial
        Serial.write(csvFile.read());
          }
      csvFile.close();
    }
    
    delay(10000);
}
