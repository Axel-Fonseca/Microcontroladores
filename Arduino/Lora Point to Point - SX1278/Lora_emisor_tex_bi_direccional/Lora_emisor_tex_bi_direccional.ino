// Lora Ra-02 Bidirectional Communication With Esp8266

#include <LoRa.h>
#define SS 5
#define RST 14
#define DIO0 2

String data = "";
bool stringComplete = false;      // Whether the string is complete

void setup()
{
  Serial.begin(115200);
  //Serial.begin(9600);
  while (!Serial);
  Serial.println("Dispositivo Activo");
  LoRa.setPins(SS, RST, DIO0);
  if (!LoRa.begin(433E6)) {
    Serial.println("Error LoRa");
    delay(100);
    while (1);
  }
  data.reserve(200);        // Max Number of character Sended through a Single mssage
}

/* Created By Eccircuit
 * Made By Ankit jat
 * Date 06/08/2021
 * Code For Lora Ra-02 bidirectional Communication With Esp8266
 * Website -> https://www.eccircuit.com
 * E-mail -> Eccicuit@gmail.com
 */
 
void loop()
{
  serialEvent();
  stringComplete = false;
  int packetSize = LoRa.parsePacket();
  if (packetSize) {
    while (LoRa.available()) {
      Serial.print("Mensaje Recibido: ");
      Serial.println(LoRa.readString());
    }
  }
}


void serialEvent() {
  while (Serial.available()) {
    char inChar = (char)Serial.read();
    data += inChar;
    if (inChar == '\n') {
      stringComplete = true;
      Serial.print("Enviando Mensaje: ");
      Serial.println(data);
      LoRa.beginPacket();
      LoRa.print(data);
      LoRa.endPacket();
      data="";
      delay(2000);
    }
  }
}