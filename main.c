#include <gtk/gtk.h>
//#include "calculadora.asm"

unsigned int* year = 0;
extern void calculate_leap_year(unsigned int* year){}

static void activate(GtkApplication* application, gpointer user_data) {
    GtkWidget* window;
    GtkWidget* grid;
    GtkWidget* button;
    GtkWidget* label;

    window = gtk_application_window_new(application);
    gtk_window_set_title(GTK_WINDOW(window), "Calculadora");
    gtk_window_set_default_size(GTK_WINDOW(window), 300, 300);

    grid = gtk_grid_new();
    gtk_window_set_child(GTK_WINDOW(window), grid);

    label = gtk_label_new("Resultado: ");
    gtk_grid_attach(GTK_GRID(grid), label, 0, 0, 4, 1);

    button = gtk_button_new_with_label("Calcular");
    g_signal_connect(button, "clicked", G_CALLBACK(calculate_leap_year), year);
    gtk_grid_attach(GTK_GRID(grid), button, 4, 2, 1, 1);


    gtk_window_present(GTK_WINDOW(window));

}

int main(int argc, char *argv[]) {
    GtkApplication *app;
    int status;

    app =  gtk_application_new ("org.gtk.example", G_APPLICATION_DEFAULT_FLAGS);
    g_signal_connect (app, "activate", G_CALLBACK (activate), NULL);

    status = g_application_run (G_APPLICATION (app), argc, argv);
    g_object_unref (app);

    return status;
}