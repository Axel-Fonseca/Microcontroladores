/***************************************************************************
  This is a library for the BMP280 humidity, temperature & pressure sensor

  Designed specifically to work with the Adafruit BMEP280 Breakout 
  ----> http://www.adafruit.com/products/2651

  These sensors use I2C or SPI to communicate, 2 or 4 pins are required 
  to interface.

  Adafruit invests time and resources providing this open source code,
  please support Adafruit andopen-source hardware by purchasing products
  from Adafruit!

  Written by Limor Fried & Kevin Townsend for Adafruit Industries.  
  BSD license, all text above must be included in any redistribution
 ***************************************************************************/

#include <Wire.h>
#include <Adafruit_BMP280.h>

Adafruit_BMP280 bmp; // I2C

void setup() 
{
  Serial.begin(115200);
  
  if(!bmp.begin())
    Serial.println("Error");
  
}

void loop() 
{
    Serial.println("PRESSURE_");
    delay(1000);
    
    float temperature = bmp.readTemperature();
    float pressure = bmp.readPressure();
    float altitudem = bmp.readAltitude(1013.25);

    // Print pressure shield values
    Serial.print("| Temperature (C):\t");          Serial.print(temperature);
    Serial.print("\t| Pressure (Pa):\t");          Serial.print(pressure);
    Serial.print("\t| Altitude (m):\t");           Serial.println(altitudem); 
    
    delay(500);
}
