//-------------------------------------------------------------------------------
//  TinyCircuits Si7020 Temperature and Humidity Sensor TinyShield Example Sketch
//  Last Updated 20 March 2016
//  
//  This demo shows the bare minimum to read temperature and humidity data from 
//  the Si7020 sensor using the Si7020 library written by Marcus Sorensen.
//
//  Written by Ben Rose for TinyCircuits, https://tinycircuits.com
//
//  This example is free software; you can redistribute it and/or
//  modify it under the terms of the GNU Lesser General Public
//  License as published by the Free Software Foundation; either
//  version 2.1 of the License, or (at your option) any later version.
//-------------------------------------------------------------------------------

#include <Wire.h>
#include <SI7021.h>

SI7021 sensor;

void setup()
{
  Serial.begin(115200);
  Wire.begin();

  if(!sensor.begin())
    Serial.println("Sensor is not connected.");
}

void loop()
{ 
  Serial.println("HUMIDITY_");
  delay(1000);
  
  int celcius = sensor.getCelsiusHundredths()/100;
  int relativeHumidity = sensor.getHumidityPercent();

  // Print humidity shield values      
  Serial.print("| Temperature (C):\t");            Serial.print(celcius);
  Serial.print("\t| Relative Humidity (%):\t");    Serial.println(relativeHumidity);
  
  delay(500);
}
