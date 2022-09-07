// Flight Software
#define ENVIAR_DATOS    '1'
#define ACTUALIZA_FH    '2'
#define RECIBE_PARAM    '3'
#define RESET_SISTEM    '4'
#define DETENER_TRAN    '5'

int Reset=4;
int STOP;
int L;

void setup() {
  Serial.begin(9600);
  while(!Serial);
  Establece_Comm();
  digitalWrite(Reset,HIGH);
  pinMode(Reset,OUTPUT);
  Serial.flush();
}

void loop() {
  if(Serial.available()){  // Hay datos en el Buffer "cadena_de_bytes_o_caracteres", "12345" LabVIEW -> "2idd/mm/an,hh:min:segf"
    char comando = Serial.read(); // Lee un caracter del Buffer
    
    switch(comando){
      case ENVIAR_DATOS: enviar_datos();       // Envia en una cadena todas las variables (An, Dig)
                         break;
      case ACTUALIZA_FH: actualiza_fecha();     // Recibe la cadena para actualizar la Fecha = "2idd/mm/an,hh:min:segf"
                         break;
      case RECIBE_PARAM: recibe_parametros();   // Recibe 25 caracteres agrupados en diferentes parámetros = "3i0123003403450123 .. 0343f"
                         break;
      case RESET_SISTEM: reset_sistema();
                         break;
      case DETENER_TRAN: detener_transmision();
                         break;
    }
  }
  delay(100);
  Establece_Comm();
}

void Establece_Comm()
{ 
  if(Serial.available() <= 0){ // NO hay datos en el Buffer de Entrada
    Serial.println("LISTO");
    delay(100);
  }
}

void enviar_datos()
{
  if(STOP==1){
    Serial.println("¿Transmision Interrumpida...?"); 
  }else{
  int A0 = analogRead(A1);
  int A1 = analogRead(A2);
  int D0 = digitalRead(52);
  int D1 = digitalRead(53);
  char HouseKeeping[70]="0";
  sprintf(HouseKeeping,"¿%d,%d,%d,%d,%d,%d,%d,%d?",A0,A1,A0,A1,D0,D1,D0,D1);
  Serial.println(HouseKeeping);
  delay(10);
  }
}

void actualiza_fecha()
{
  if(STOP==1){
    Serial.println("¿Transmision Interrumpida...?"); 
  }else{
  char fecha;
  char Data[26];
  int i=0;
  Serial.print("¿Actualizar fecha: ");
  while(Serial.available()>0)  // Mientras existan datos en el buffer
  {
    fecha=Serial.read();
    Data[i++] = fecha;
    Serial.print(fecha);
    delay(10);
    if(Data[0]=!'¿') break;
    if(fecha == '?') break;
  }// Aplicar la Actualizacion de la Fecha = Data
  Serial.println();
  }
}

void recibe_parametros()
{
  if(STOP==1){
    Serial.println("¿Transmision Interrumpida...?"); 
  }else{
  char parametro;
  char Data[27];
  int i=0;
  Serial.print("¿Parametros: ");
  while(Serial.available()>0)
  {
    parametro=Serial.read();
    Data[i++]=parametro;
    Serial.print(parametro);
    delay(10);
    if(Data[0] =! '¿') break;
    if(parametro == '?') break;
   } // Parametros actualizados
    Serial.println();
  }
}

void reset_sistema()
{
  if(STOP==1){
    Serial.println("¿Transmision Interrumpida...?"); 
  }else{
  Serial.print("¿Reiniciando..... ");
  digitalWrite(Reset,LOW);
  Serial.println("Completado?");
  }
}

void detener_transmision()
{
  if(STOP==1){
    Serial.println("¿Transmision reanudada?");
    STOP=0;
  }else{
    Serial.println("¿Transmision detenida?");
    STOP=1;
    }
}
  
