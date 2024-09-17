using System.Data.SqlClient;
using Dapper;

namespace TP7_PreguntadORT.Models;

public static class BD 
{
    private static string _connectionString = @"server=localhost;DataBase=PreguntadORT;Trusted_Connection=True;";
    public static List<Categoria> ObtenerCategorias()
    {
        List<Categoria> ListaCategorias = new List<Categoria>();
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "SELECT * FROM Categorias";
            ListaCategorias = db.Query<Categoria>(sql).ToList();
        }
        return ListaCategorias;
    }
    public static List<Dificultad> ObtenerDificultades()
    {
        List<Dificultad> ListaDificultades = new List<Dificultad>();
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "SELECT * FROM Dificultades";
            ListaDificultades = db.Query<Dificultad>(sql).ToList();
        }
        return ListaDificultades;
    }
    public static List<Pregunta> ObtenerPreguntas(int idDificultad, int idCategoria)
{
    List<Pregunta> ListaPreguntas = new List<Pregunta>();

    using (SqlConnection db = new SqlConnection(_connectionString))
    {
        string sql = "SELECT * FROM Preguntas WHERE 1=1";
        
        if (idDificultad != -1 && idCategoria != -1)
        {
            sql += " AND IdCategoria = @pIdCategoria AND IdDificultad = @pIdDificultad";
            ListaPreguntas = db.Query<Pregunta>(sql, new { pIdCategoria = idCategoria, pIdDificultad = idDificultad }).ToList();
        }
        else if (idDificultad == -1 && idCategoria != -1)
        {
            sql += " AND IdCategoria = @pIdCategoria";
            ListaPreguntas = db.Query<Pregunta>(sql, new { pIdCategoria = idCategoria }).ToList();
        }
        else if (idDificultad != -1 && idCategoria == -1)
        {
            sql += " AND IdDificultad = @pIdDificultad";
            ListaPreguntas = db.Query<Pregunta>(sql, new { pIdDificultad = idDificultad }).ToList();
        }
        else
        {
            ListaPreguntas = db.Query<Pregunta>(sql).ToList();
        }
    }
    
    return ListaPreguntas;
}

    public static List<Respuesta> ObtenerRespuestas(int idPregunta)
    {
        List<Respuesta> ListaRespuestas = new List<Respuesta>();
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "SELECT * FROM Respuestas WHERE IdPregunta = @idPregunta";
            ListaRespuestas = db.Query<Respuesta>(sql, new { IdPregunta = idPregunta }).ToList();
        }  
        return ListaRespuestas;
    }
    public static bool esCorrecta(int idRespuesta)
    {
        bool esCorrecta = false;
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "SELECT Correcta FROM Respuestas WHERE IdRespuestas = @idRespuesta";
            esCorrecta = db.QueryFirstOrDefault<bool>(sql, new { IdRespuesta = idRespuesta });
        }
        return esCorrecta;
    }
}