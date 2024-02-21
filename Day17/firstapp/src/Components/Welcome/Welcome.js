import { useParams } from "react-router-dom";
import styles from '../../employee.module.css';
function Welcome(){
    var {un} = useParams()
    var divStyle={
        backgroundColor:"yellow",
        width:"30%",
        height:"400px"
    }
    return(
        <div className={styles.sample}>
            Hello
            <h1 className="alert alert-success">Hello - {un}</h1>
        </div>
    );

}

export default Welcome;