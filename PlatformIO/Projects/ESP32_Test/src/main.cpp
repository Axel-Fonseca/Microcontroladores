#include <Arduino.h>
#define BLYNK_TEMPLATE_ID "TMPL21kOmo66K"
#define BLYNK_TEMPLATE_NAME "ESP32 Test"
#define BLYNK_AUTH_TOKEN "EcFy4o5Xf3cSmjBEL48w1HIYiCCwqIM5"
#define BLYNK_PRINT Serial
#include <WiFi.h>
#include <WiFiClient.h>
#include <BlynkSimpleEsp32.h>

BlynkTimer timer;


char network[] = "Totalplay-0BA8";
char password[] = "0BA8FA4BaM2MWRZE";

 
float temp_simulation() {
  return (random(0,60)*1.12);
}

float hum_simulation(){
  return random (0,100);
}

void send_temp(){
  float temp = temp_simulation();
  Blynk.virtualWrite(V0,temp);
  Serial.print("Temperatura simulada enviada: ");
  Serial.print(temp);
  Serial.println("C");
}

void send_hum(){
  float hum = hum_simulation();
  Blynk.virtualWrite(V1,hum);
  Serial.print("Humedad simulada enviada: ");
  Serial.print(hum);
  Serial.println("%");
}

void setup(){
  Serial.begin(9600);
  Blynk.begin(BLYNK_AUTH_TOKEN,network,password);

  randomSeed(0);

  timer.setInterval(10000L,send_temp);
  timer.setInterval(10000L,send_hum);
}



void loop(){
  if(Serial.available()){
    String command = Serial.readString();
      if(command = "start"){
        bool button = digitalRead(0);
        Serial.println(button);
        delay(1000);
      }
  }

  Blynk.run();
  timer.run();
}