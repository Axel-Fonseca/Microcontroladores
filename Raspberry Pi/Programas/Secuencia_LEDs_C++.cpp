#include <stdio.h>
#include <wiringPi.h>

int main (void)
{
	printf ("Led working\n");
	if(wiringPiSetup() == -1)
	return 1;
	pinMode(8, INPUT);
	pinMode(9, INPUT);
	pinMode(7, INPUT);
	pinMode(0, OUTPUT);
	pinMode(2, OUTPUT);
	pinMode(3, OUTPUT);
	pinMode(12, OUTPUT);
	
	for(;;)
	{
		if(digitalRead(8) == LOW)
		{
			if(digitalRead(9) == LOW)
			{
				if(digitalRead(7) == LOW)
				{
					printf("Resultado: 0\n\r");
				}
if(digitalRead(7) == HIGH)
				{
					printf("Resultado: 4\n");
				}
			} 
			
			if(digitalRead(9) == HIGH)
			{
				if(digitalRead(7) == LOW)
				{
					printf("Resultado: 2\n\r");
				}
				if(digitalRead(7) == HIGH)
				{
					printf("Resultado: 6\n");
				}
			}
			
		}
		
		if(digitalRead(8) == HIGH)
		{
			if(digitalRead(9) == LOW)
			{
				if(digitalRead(7) == LOW)
				{
					printf("Resultado: 1\n\r");
				}
				if(digitalRead(7) == HIGH)
				{
					printf("Resultado: 5\n");
				}
			} 
			
			if(digitalRead(8) == HIGH)
			{
				if(digitalRead(7) == LOW)
				{
					printf("Resultado: 3\n\r");
				}
				if(digitalRead(7) == HIGH)
				{
					printf("Resultado: 7\n");
				}
	
			}
		}
	}
}
			
