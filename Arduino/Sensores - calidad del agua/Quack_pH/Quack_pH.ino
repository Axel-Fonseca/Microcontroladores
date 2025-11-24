void setup() {
  Serial.begin(115200); //Begin Serial Monitor
}

void loop() {
  float measure = analogRead(1);  //Read pin A0
  float temp = analogRead(5);
  double voltage = measure*3.3/4095.0; //Analog-to-Digital Conversion
 
  // PH_step (Voltage/pH Unit) = (Voltage@PH7-Voltage@PH4)/(PH7 - PH4)
  float pH = 7+((2.5 - voltage)/0.1841); // PH_probe = PH7-((Voltage@PH7-Voltage@probe)/PH_step)
  Serial.print("PH: "); //Print word pH in Serial Monitor
  Serial.println(pH); //Print pH value in Serial Monitor
  Serial.print("Temp: "); //Print word pH in Serial Monitor
  Serial.println(temp); //Print pH value in Serial Monitor

  delay(1000);  //Gives delay 1 second
}  