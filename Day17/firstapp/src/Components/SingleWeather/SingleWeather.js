function SingleWeather(props){
return(<div>
    <h1>Weather </h1>
    <div>
        <h2>Date : {props.weather.date}</h2>
        <br/>
        Temperature in Celcius : {props.weather.temperatureC}
        <br/>
        Summary : {props.weather.summary}
        <hr/>   
        </div>
</div>)
}

export default SingleWeather;