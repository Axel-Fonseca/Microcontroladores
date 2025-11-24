// Sensor pins
const int sensorPin_Conduct = 1;

void setup() {
  Serial.begin(115200);
}

void loop() {
  //get the reading from the function below and print it
  Serial.print("Conductividad: ");
  Serial.println(readSensor_Conduct());
  delay(1000);
}

//  This function returns the analog soil moisture measurement
int readSensor_Conduct() {
  int ADC_Conduct = analogRead(sensorPin_Conduct);  // Read the analog value form sensor
  return ADC_Conduct;                       // Return analog moisture value
}