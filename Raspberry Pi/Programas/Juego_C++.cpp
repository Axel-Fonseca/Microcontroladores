#include <stdio.h>
#include <stdlib.h>
#include <gtk/gtk.h>
#include <wiringPi.h>

GtkWidget *g_menos_a;
GtkWidget *g_menos_b;
GtkWidget *g_vida_a;
GtkWidget *g_vida_b;
GtkWidget *g_inicio;

int main (int argc, char *argv[])
{
	GtkBuilder		*builder;
	GtkWidget		*window;
	
	gtk_init(&argc, &argv);
	
	builder = gtk_builder_new();
	gtk_builder_add_from_file(builder, "Karate_game_B.glade", NULL);
	
	window = GTK_WIDGET (gtk_builder_get_object(builder, "Ventana"));
	gtk_builder_connect_signals(builder, NULL);
	g_menos_a = GTK_WIDGET(gtk_builder_get_object(builder, "menos_a"));
	g_menos_b = GTK_WIDGET(gtk_builder_get_object(builder, "menos_b"));
	g_vida_a = GTK_WIDGET(gtk_builder_get_object(builder, "vida_a"));
	g_vida_b = GTK_WIDGET(gtk_builder_get_object(builder, "vida_a"));
	g_inicio = GTK_WIDGET(gtk_builder_get_object(builder, "inicio"));
	
	g_object_unref(builder);
	
	gtk_widget_show(window);
	gtk_main();
	
	return 0;
}

int contador_a = 100;
int contador_b = 100;

void on_menos_a_button_press_event()
{
		contador_b = contador_b - 1;
		printf("\t\n");
		printf("Vida Jugador A: %i\n", contador_a);
		printf("Vida Jugador B: %i\n", contador_b);
}
void on_menos_b_button_press_event()
{
		contador_a = contador_a - 1;
		printf("\t\n");
		printf("Vida Jugador A: %i\n", contador_a);
printf("Vida Jugador B: %i\n", contador_b);
}
void on_vida_a_button_press_event()
{
		contador_a = contador_a + 1;
		printf("\t\n");
		printf("Vida Jugador A: %i\n", contador_a);
		printf("Vida Jugador B: %i\n", contador_b);
}
void on_vida_b_button_press_event()
{
		contador_b = contador_b + 1;
		printf("\t\n");
		printf("Vida Jugador A: %i\n", contador_a);
		printf("Vida Jugador B: %i\n", contador_b);
}
int a;

int on_inicio_button_press_event()
{
		if(wiringPiSetup() == -1)
		return 1;
		pinMode(0, OUTPUT);
		pinMode(2, OUTPUT);
		
		digitalWrite(0,0);
		digitalWrite(2,0);
		
		for(;;)
		{
			digitalWrite(0,1);
			
			for(a=0; a<=60000; a++)
			{
				digitalWrite(0,0);
				delay(500);
				digitalWrite(2,1);
				delay(1000);
				digitalWrite(2,0);
				delay(1000);
				
				printf("Resultados:\n");	
				printf("Vida Jugador A: %i\n", contador_a);
				printf("Vida Jugador B: %i\n", contador_b);
				
				if(contador_a>contador_b)
				{
					printf("El ganador es el jugador A\n");
				}
				if(contador_b>contador_a)
				{
					printf("el ganador es el jugador B\n");
				}
				if(contador_a==contador_b)
				{
					printf("Empate\n");
				}
				return 0;
			}
	}
}
void on_Ventana_destroy()
{
	gtk_main_quit();
}
		