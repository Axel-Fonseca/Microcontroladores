#include <SPI.h>
#include <LoRa.h>
#include "OneWire.h"
#include "DallasTemperature.h"


OneWire oneWire(5);     //Se establece el pin 5  como bus OneWire
DallasTemperature sensors (&oneWire);

#define ss 10
#define rst 9
#define dio0 2


void setup() {
  
  Serial.begin(9600);
  sensors.begin();
  Serial.println("LoRa Telecontrol sender");
  delay(500);
  
  LoRa.setPins(ss, rst, dio0);
  
  if (!LoRa.begin(433E6)){        //frecuencia, se puede cammbiar hasta 915E6
    Serial.println("Starting LoRa failed!");
    while (1);
  }
}
   
void loop() {
  
  sensors.requestTemperatures();
  float temperatureC = sensors.getTempCByIndex(0);
  int temp = temperatureC;

  Serial.print("Temperatura sensor: ");
  Serial.println(temp);

  LoRa.beginPacket();
  LoRa.print(temp);
  LoRa.endPacket();
  
  delay(1000);
}
