void(* reset_sistema) (void) = 0;

#define ENVIAR_DATOS    '1'
#define ACTUALIZA_FH    '2'
#define RECIBE_PARAM    '3'
#define RESET_SISTEM    '4'
#define DETENER_TRAN    '5'

void setup() {
  // put your setup code here, to run once:
  // Configurar los Puertos An o Dig (In, Out)
 
  // Puertos analogicos
  int sva1 = analogRead(A0);
  int sva2 = analogRead(A1);
  int sva3 = analogRead(A2);
  int sva4 = analogRead(A3);
  // Puertos digitales
  int svd1 = digitalRead(2);
  int svd2 = digitalRead(3);
  int svd3 = digitalRead(4);
  int svd4 = digitalRead(5);
  
  Serial.begin(9600);
  while(!Serial);
  Establece_Comm();

}

void loop() {
  // put your main code here, to run repeatedly:
  char comando;

  if(Serial.available()){  // Hay datos en el Buffer "cadena_de_bytes_o_caracteres", "12345" LabVIEW -> "2idd/mm/an,hh:min:segf"
    comando = Serial.read(); // Lee un caracter del Buffer
    
    switch(comando){
      case ENVIAR_DATOS: enviar_datos();        // Envia en una cadena todas las variables (An, Dig)
                         break;
      case ACTUALIZA_FH: actualiza_fecha();     // Recibe la cadena para actualizar la Fecha = "2idd/mm/an,hh:min:segf"
                         break;                      
      case RECIBE_PARAM: recibe_parametros();   // Recibe 25 caracteres agrupados en diferentes parámetros = "3i0123003403450123 .. 0343f"
                         break;
      case RESET_SISTEM: reset_sistema();       //Reinicia el sistema
                         break;
      case DETENER_TRAN: detener_transmision(); //Detiene la transmision de informacion
                         break;
    }
  }
  delay(100);
  Establece_Comm();
}

void Establece_Comm()
{
  while(Serial.available() <= 0){ // NO hay datos en el Buffer de Entrada
    Serial.println("LISTO");
    delay(300);
  }
}

void enviar_datos()   //Recibe la informacion a traves de señales analogicas y digitales
{

  int sva1 = analogRead(A0);
  int sva2 = analogRead(A1);
  int sva3 = analogRead(A2);
  int sva4 = analogRead(A3);
  // Puertos digitales
  int svd1 = digitalRead(52);
  int svd2 = digitalRead(53);
  int svd3 = digitalRead(4);
  int svd4 = digitalRead(5);
  
  char HouseKeeping[100]="iEnviar Datos Hasta 253f";
  // Llamar a función que genera la cadena para el HouseKeeping
  //genera_cad_HK(&HouseKeeping);

  sprintf(HouseKeeping, "VA1:%d  VA2:%d  VA3:%d  VA4:%d  VD1:%d  VD2:%d  VD3:%d  VD4:%d", sva1,sva2,sva3,sva4,svd1,svd2,svd3,svd4);
  
  Serial.print(HouseKeeping);
  delay(10);  
}

void actualiza_fecha()
{
  char fecha;
  char Data[26];
  int i=0;
  
  while(Serial.available()>0){  // Mientras existan datos en el buffer
    fecha=Serial.read();
    Data[i++] = fecha;
    Serial.print(fecha);
    delay(10);
    if(fecha == 'f') break;
  }
  // Aplicar la Actualizacion de la Fecha = Data
}

void recibe_parametros()
{

  char parametro;
  char Data[27];
  int i=0;
  
  while(Serial.available()>0)
  {  // Mientras existan datos en el buffer
    parametro=Serial.read();
    Data[i++] = parametro;
    Serial.print(parametro);
    delay(10);
    if(parametro == 'f') break;
  }
  // Parametros guardados
}


void detener_transmision()
{

  int cmd5_status = 1;
  char cmd_status5;
  
  
  Serial.println("Offline...");

  if (cmd5_status == 1)
  {
    while (cmd5_status == 1)
    {
                    
      delay(10);
      cmd_status5 = Serial.read();

      if (cmd_status5 == '5')
      {
        Serial.println("Online...");
        cmd5_status = 0;
        break;
      }
    }
  }
  
}
