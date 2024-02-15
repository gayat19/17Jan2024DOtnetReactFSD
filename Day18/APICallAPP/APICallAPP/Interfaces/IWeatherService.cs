using APICallAPP.Models;

namespace APICallAPP.Interfaces
{
    public interface IWeatherService
    {
        public Task<IList<WeatherForecast>> GetWeather();
    }
}
