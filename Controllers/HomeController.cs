using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using TP7_PreguntadORT.Models;

namespace TP7_PreguntadORT.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }

    public IActionResult Index()
    {
        return View();
    }
    public IActionResult ConfigurarJuego()
    {
        List<Categoria> categorias = Juego.ObtenerCategorias();
        List<Dificultad> dificultades = Juego.ObtenerDificultades();
        ViewBag.Categorias = categorias;
        ViewBag.Dificultades = dificultades;
        return View();
    }
    public IActionResult Comenzar(string username, int dificultad, int categoria)
    {
        Juego.CargarPartida(username, dificultad, categoria);
        return RedirectToAction("Jugar");
    }
    public IActionResult Jugar()
    {
        Pregunta pregunta = Juego.ObtenerProximaPregunta();
        if (pregunta == null) 
        {
            return View("Fin");
        }
        ViewBag.Pregunta = pregunta;
        ViewBag.Respuestas = Juego.ObtenerProximasRespuestas(pregunta.IdPregunta);
        return View();
    }
    [HttpPost] public IActionResult VerificarRespuesta(int idPregunta, int idRespuesta)
    {
        bool esCorrecta = Juego.VerificarRespuesta(idRespuesta);
        ViewBag.EsCorrecta = esCorrecta;
        return View("Respuesta");
    }
}
