#include <SPI.h>
#include <SD.h>
#include <Wire.h>             // I2C Library

#include <SI7021.h>           // Humidity Library
#include <Adafruit_BMP280.h>  // Pressure Library

double totTime;               // Time variable
File myFile;                  // File variable
int incomingByte = 0;         // Input variable

// Humidity sensor declaration
SI7021 sensor;

// Pressure sensor declaration
Adafruit_BMP280 bmp;

void setup()
{
  // Initialize Serial communication
  Serial.begin(9600);

  // Initialize I2C communication
  Wire.begin();

  // SD Card setup
  if (!SD.begin(10))
    return;

  // Humidity Setup
  if (!sensor.begin())
    return;

  // Pressure setup
  if (!bmp.begin())
    return;

  delay(1000);

  printMenu();
}

void loop()
{

  // Declare variables for collecting and storing data
  float temperatureP = 0;
  float pressure = 0;
  float altitudem = 0;
  int celcius = 0;
  int relativeHumidity = 0;
  double time_print = 0;
  String pressure_data = "";
  String humidity_data = "";

  // Declare variables for Serial input
  char com = 0;
  char str1[2];

  // Check to see if there is any Serial input from user
  if (Serial.available() > 0)
  {
    incomingByte = Serial.read();

    /***************************** PRESSURE TINYSHIELD CODE ******************************/
    if (incomingByte == '1')
    {
      // Print menu option selected
      Serial.println(" 1\n");
      delay(100);
      Serial.println("PRESSURE_");

      for (int i = 0; i < 60; i++)
      {
        // Collect pressure shield values
        temperatureP = bmp.readTemperature();
        pressure = bmp.readPressure();
        altitudem = bmp.readAltitude(1013.25);

        // Print pressure shield values
        Serial.print("| Temperature (C):\t");          Serial.print(temperatureP);
        Serial.print("\t| Pressure (Pa):\t");          Serial.print(pressure);
        Serial.print("\t| Altitude (m):\t");           Serial.println(altitudem);
        delay(250);
      }
    }

    /***************************** HUMIDITY TINYSHIELD CODE ******************************/
    else if (incomingByte == '2')
    {
      // Print menu option selected
      Serial.println(" 2\n");
      delay(100);
      Serial.println("HUMIDITY_");

      for (int i = 0; i < 60; i++)
      {
        // Collect humidity shield values
        celcius = sensor.getCelsiusHundredths();
        float celflo = float(celcius);
        celflo = celflo / 100;

        relativeHumidity = sensor.getHumidityPercent();

        // Print humidity shield values
        Serial.print("| Temperature (C):\t");            Serial.print(celflo);
        Serial.print("\t| Relative Humidity (%):\t");  Serial.println(relativeHumidity);
        delay(250);
      }
    }

    /****************************** MICROSD TINYSHIELD CODE - TEXT FILE ******************/
    else if (incomingByte == '3')
    {
      // Print menu option selected
      Serial.println(" 3\n");
      delay(100);

      // Collect values from both sensors
      temperatureP = bmp.readTemperature();
      pressure = bmp.readPressure();
      altitudem = bmp.readAltitude(1013.25);
      celcius = sensor.getCelsiusHundredths() / 100;
      relativeHumidity = sensor.getHumidityPercent();

      // Save values to string variables
      pressure_data = "PRESSURE_\t" + String(temperatureP) + " degC\t" + String(pressure) + " Pa\t" + String(altitudem) + " m\n";
      humidity_data = "HUMIDITY_\t" + String(celcius) + " degC\t" + String(relativeHumidity) + " %\n";

      // Store to .txt file
      myFile = SD.open("PS_.txt", FILE_WRITE);
      if (myFile)
      {
        myFile.println(pressure_data);
        myFile.println(humidity_data);
        myFile.close();
      }
      else
      {
        Serial.println("error opening");
      }

      // Menu choice complete
      Serial.println("WRITE .TXT_");
    }

    /****************************** MICROSD TINYSHIELD CODE - CSV FILE *******************/
    else if (incomingByte == '4')
    {
      // Print menu option selected
      Serial.println(" 4\n");
      delay(100);

      // Collect values from both sensors
      temperatureP = bmp.readTemperature();
      pressure = bmp.readPressure();
      altitudem = bmp.readAltitude(1013.25);
      celcius = sensor.getCelsiusHundredths() / 100;
      relativeHumidity = sensor.getHumidityPercent();

      // Save values to strings variables
      pressure_data = "PRESSURE_," + String(temperatureP) + " degC," + String(pressure) + " Pa," + String(altitudem) + " m\n";
      humidity_data = "HUMIDITY_," + String(celcius) + " degC," + String(relativeHumidity) + " %\n";

      // Store to .csv file
      myFile = SD.open("PS_.csv", FILE_WRITE);
      if (myFile)
      {
        myFile.print(pressure_data);
        myFile.print(humidity_data);
        myFile.close();
      }
      else
      {
        Serial.println("error opening");
      }

      // Menu choice complete
      Serial.println("WRITE .CSV_");
    }

    // Reprint menu and clear choice
    Serial.println("\n\n");
    delay(750);
    printMenu();
    incomingByte = 0;
  }

  delay(100);
}

void printMenu()
{
  Serial.println("_________________________________________");
  Serial.println("PONGSAT essentials kit \\ demo program_");
  Serial.println("1_\tReport Pressure sensor data");
  Serial.println("2_\tReport Humidity sensor data");
  Serial.println("3_\tWrite sensor data in .txt format");
  Serial.println("4_\tWrite sensor data in .csv format");
  Serial.print("\n>>");

}
