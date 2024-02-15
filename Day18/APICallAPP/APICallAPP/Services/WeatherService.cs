using APICallAPP.Interfaces;
using APICallAPP.Models;
using System.Net;
using System.Net.Http;
using System.Text.Json.Serialization;


namespace APICallAPP.Services
{
    public class WeatherService : IWeatherService
    {
        HttpClient client;
        public WeatherService()
        {
            client = new HttpClient();
        }
        public async Task<IList<WeatherForecast>> GetWeather()
        {
            var response = await client.GetAsync("http://localhost:5090/WeatherForecast");
            if(response.IsSuccessStatusCode)
            {
                var weatherList = await response.Content.ReadFromJsonAsync<List<WeatherForecast>>();
                return weatherList;
            }
            return null;
        }
    }
}
