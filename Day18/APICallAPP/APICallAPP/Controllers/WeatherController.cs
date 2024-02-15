using APICallAPP.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace APICallAPP.Controllers
{
    public class WeatherController : Controller
    {
        private readonly IWeatherService _service;

        public WeatherController(IWeatherService service) 
        {
            _service = service;
        }
        public async Task<IActionResult> Index()
        {
            ViewBag.Username = "Ramu";
            ViewData["UserAge"] = 30;
            var result = await _service.GetWeather();
            ViewBag.Weather = result[0];
            return View(result);
        }
    }
}
