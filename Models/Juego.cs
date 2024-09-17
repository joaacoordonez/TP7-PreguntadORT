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
        ListaPreguntas = new List<Pregunta>();
        ListaRespuestas = new List<Respuesta>();
    }
    public static List<Categoria> ObtenerCategorias()
    {
        return BD.ObtenerCategorias();
    }
    public static List<Dificultad> ObtenerDificultades()
    {
        return BD.ObtenerDificultades();
    }
    public static void CargarPartida(string username, int dificultad, int categoria)
    {
        InicializarJuego();
        Juego.username = username;
        ListaPreguntas = BD.ObtenerPreguntas(dificultad, categoria);
    }
    public static Pregunta ObtenerProximaPregunta()
    {
        if (ContadorNroPreguntaActual < ListaPreguntas.Count)
        {
            PreguntaActual = ListaPreguntas[ContadorNroPreguntaActual];
            return PreguntaActual;
        }
        return null;
    }
    public static List<Respuesta> ObtenerProximasRespuestas(int idPregunta)
    {
        return BD.ObtenerRespuestas(idPregunta);
    }
    public static bool VerificarRespuesta(int idRespuesta)
    {
        bool esCorrecta = BD.esCorrecta(idRespuesta);
        if (esCorrecta == true)
        {
            PuntajeActual += 10;
            CantidadPreguntasCorrectas++;
            esCorrecta = true;
        }
        ContadorNroPreguntaActual++;
        if (ContadorNroPreguntaActual < ListaPreguntas.Count)
        {
            PreguntaActual = ListaPreguntas[ContadorNroPreguntaActual];
        }
        return esCorrecta;
    }
} 