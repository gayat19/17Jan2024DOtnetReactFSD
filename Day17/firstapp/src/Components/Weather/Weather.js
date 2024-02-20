import { useState } from "react";
import SingleWeather from "../SingleWeather/SingleWeather";

function Weather(){
   var [weathers,setWeathers] = useState([{
        "date":"",
        "temperatureC":0,
        "temperatureF":0,
        "summary":""
    }]);

    var callAPI = ()=>{
        const token = sessionStorage.getItem('token');
        const httpHeader = {
            headers:{'Authorization': 'Bearer '+token}
        }
        console.log(httpHeader)
        fetch("http://localhost:5090/WeatherForecast",httpHeader)
        .then(res=>res.json())
        .then(res=>{
            //console.log(res);
            setWeathers(res);
        });
    }
    
    return(
        
        <div>
            <button onClick={callAPI}>Call API</button>
            {weathers.map((w)=>
               <SingleWeather key={w.temperatureC} weather={w}/>
            )}
        </div>
    );
}

export default Weather;