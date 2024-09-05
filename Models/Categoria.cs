namespace TP7_PreguntadORT.Models;

public class Categoria
{
    public int IdCategoria {get; set;}
    public string Nombre {get; set;}
    public string Foto {get; set;}

    public Categoria(){}
    public Categoria(int idCategoria, string nombre, string foto)
    {
        Nombre = nombre;
        IdCategoria = idCategoria;
        Foto = foto;
    }
}