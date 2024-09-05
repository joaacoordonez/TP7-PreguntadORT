using System.Data.SqlClient;
using Dapper;

namespace TP7_PreguntadORT.Models;

public static class Juego
{
    private static string username;
    private static int PuntajeActual;
    private static int CantidadPreguntasCorrectas;
    private static int ContadorNroPreguntaActual;
    private static Pregunta PreguntaActual;
    public static List<Pregunta> ListaPreguntas;
    private static List<Respuesta> ListaRespuestas;
    
    private static void InicializarJuego()
    {
        username = string.Empty;
        PuntajeActual = 0;
        CantidadPreguntasCorrectas = 0;
        ContadorNroPreguntaActual = 0;
        PreguntaActual = null;
        ListaPreguntas = null;
        ListaRespuestas = null;
    }
    public static List<Categoria> ObtenerCategorias()
    {
        return BD.ObtenerCategorias();
    }
    public static List<Dificultad> ObtenerDificultades()
    {
        return BD.ObtenerDificultades();
    }
    public static void CargarPartida(string Username, int dificultad, int categoria)
    {
        InicializarJuego();
        username = Username;
        List<Pregunta> ListaPreguntas = BD.ObtenerPreguntas(dificultad, categoria);
    }
} 