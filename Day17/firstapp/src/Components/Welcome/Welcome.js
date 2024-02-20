import { useParams } from "react-router-dom";

function Welcome(){
    var {un} = useParams()
    return(
        <div>
            <h1 className="alert alert-success">Hello - {un}</h1>
        </div>
    );

}

export default Welcome;