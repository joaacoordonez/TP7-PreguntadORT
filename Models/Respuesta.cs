namespace TP7_PreguntadORT.Models;

public class Respuesta
{
    public int IdRespuesta {get; set;}
    public int IdPregunta {get; set;}
    public int Opcion {get; set;}
    public string Contenido {get; set;}
    public bool Correcta {get; set;}
    public string Foto {get; set;}

    public Respuesta(){}
    public Respuesta(int idPregunta, int idRespuesta, int opcion, string contenido, string foto, bool correcta)
    {
        IdPregunta = idPregunta;
        IdRespuesta = idRespuesta;
        Opcion = opcion;
        Contenido = contenido;
        Correcta = correcta;
        Foto = foto;

    }
}