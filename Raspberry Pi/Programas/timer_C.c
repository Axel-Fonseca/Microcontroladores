#include <gtk/gtk.h>
#include <glib/gi18n.h>

static int nSeg=0;
static gint timer=0;
static int bTimerCorriendo= FALSE;

void ActualizarSegundos(int valor);
void ActualizarSegundos(int valor){
printf("valor: %i",valor);
}
gint TimerCallback(gpointer data)
{
	nSeg++;
	ActualizarSegundos(nSeg);
	return 1;
}
	void IniciarTimer()
	{	
		if (!bTimerCorriendo)
		{
			nSeg=0;
			timer=g_timeout_add(1000,TimerCallback,NULL);
			bTimerCorriendo=TRUE;
		}
	}
void DetenerTimer(){
if(bTimerCorriendo){
g_source_remove(timer);
bTimerCorriendo=FALSE;}
}
int main (int argc,char *argv[])
{ GtkBuilder 	*builder;
GtkWidget	*window;
gtk_init(&argc,&argv);
builder=gtk_builder_new();
gtk_builder_add_from_file(builder,"window.glade",NULL);
window=GTK_WIDGET(gtk_builder_get_object(builder,"window"));
gtk_builder_connect_signals(builder,NULL);


g_object_unref(builder);
gtk_widget_show(window);
gtk_main();
return 0;
}
void on_window_destroy () {
gtk_main_quit();
}
void on_bInicio_clicked(){
printf("Iniciando...");
IniciarTimer();}

		