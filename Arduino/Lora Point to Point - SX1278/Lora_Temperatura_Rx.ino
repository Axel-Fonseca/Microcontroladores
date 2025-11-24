#include <SPI.h>
#include <LoRa.h>

#define ss 10
#define rst 9
#define dio0 2

void setup() {
  Serial.begin(9600);
  delay(500);
  
  LoRa.setPins(ss, rst, dio0);
  
  if (!LoRa.begin(433E6)){        //frecuencia, se puede cammbiar hasta 915E6
    Serial.print(' ');
    while (1);
  }
}

void loop() {
  int packetSize = LoRa.parsePacket();
  if (packetSize) {
    while (LoRa.available()) {
      String LoRaData = LoRa.readString();
      int temperatura= LoRaData.toInt();
      Serial.println(temperatura);       
    }
  }
}
