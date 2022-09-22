
int Reset = 4;
int STOP;
// the setup routine runs once when you press reset:
void setup() {
  // initialize serial communication at 9600 bits per second:
  Serial.begin(9600);
  digitalWrite(Reset,HIGH);
  pinMode(Reset,OUTPUT);
}

// the loop routine runs over and over again forever:
void loop() {
  // read the input on analog pin 0:
  int A0 = analogRead(A1);
  int A1 = analogRead(A2);
  int D0 = digitalRead(52);
  int D1 = digitalRead(53);
  // print out the value you read:

  String ihoraf, hora;
  char cmd;
  if (Serial.available()){
    cmd = Serial.read();
    switch(cmd){
      case '1': Serial.print("Enviar Datos: ");
                if (STOP==1){
                Serial.println("Transmisión Interrumpida...");
                break;
                }
                Serial.print("A1: ");
                Serial.print(A0);
                Serial.print("  A2: ");
                Serial.print(A1);
                Serial.print("  A3: ");
                Serial.print(A0);
                Serial.print("  A4: ");   
                Serial.print(A1);             
                Serial.print("  D1: ");
                Serial.print(D0);
                Serial.print("  D2: ");
                Serial.print(D1);
                Serial.print("  D3: ");
                Serial.print(D0);
                Serial.print("  D4: ");
                Serial.print(D1);
                Serial.println();
                break;
                
      case '2': Serial.println("Actualizar hora: Cmd 2");
                   if (STOP==1){
                Serial.println("Transmisión Interrumpida...");
                break;
                }
                ihoraf = Serial.readString();
                hora = ihoraf.substring(0,23);
                Serial.println("Cadena de hora y fecha completa: "+hora);
                hora = ihoraf.substring(1,ihoraf.indexOf("f"));
                Serial.println("Cadena de hora y fecha estandar: "+hora);
                Serial.println("Hora actualizada...");
                while(Serial.available()==0){
                }
                Serial.println();
                break;
                
      case '3': Serial.println("Recibir Parametros: Cmd 3");
                if (STOP==1){
                Serial.println("Transmisión Interrumpida...");
                break;
                }
                ihoraf=Serial.readString();
                if(Serial.find("i")){
                  Serial.println("Caracter de inicio encontrado: i");
                }
                if(Serial.find("f")){
                  Serial.println("Caracter de fin encontrado: f");
                }
                hora = ihoraf.substring(0,23);
                Serial.print("Longitud del vetor hora: ");
                Serial.println(hora.length());
                Serial.println();
                break;
                
      case '4': Serial.println("Reset: Cmd 4");
                 if (STOP==1){
                Serial.println("Transmisión Interrumpida...");
                break;
                }
                digitalWrite(Reset,LOW);
                Serial.println("Reset Completado...");
                Serial.println();
                break;
                
      case '5': Serial.println("STOP Transmision: Cmd 5");
                if(STOP==1){
                  STOP=0;
                }else{
                STOP=1;
                }
                Serial.println();
                break;
               }
                    }
  delay(1);        // delay in between reads for stability
}
