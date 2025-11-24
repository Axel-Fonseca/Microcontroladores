// Sensor pins
const int sensorPin_Turb = 2;

void setup() {
  Serial.begin(115200);
}

void loop() {
  //get the reading from the function below and print it
  Serial.print("Turbidez: ");
  Serial.println(readSensor_Turb());
  delay(1000);
}

//  This function returns the analog soil moisture measurement
int readSensor_Turb() {
  int ADC_Turb = analogRead(sensorPin_Turb);  // Read the analog value form sensor
  float volt_Turb = ADC_Turb*(5.0/4095.0);
  return volt_Turb;                       // Return analog moisture value
}