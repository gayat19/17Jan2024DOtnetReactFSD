import { useDispatch } from "react-redux";
import { addToCart } from "../../cartSlice";

function Product(props){
    var dispatch = useDispatch();
    var addItemToCart=()=>{
        console.log("Button Clicked "+props.product.id);
        dispatch(addToCart(
            {id:props.product.id,name:props.product.name}
            ))
        //props.onAddItemToCart(props.product);///Raising an event in the parent
    }
    return(
        <div className="alert alert-success">
            <h3 className="alert alert-primary">{props.product.name}</h3>
            <button onClick={addItemToCart} className="btn btn-primary">Buy for {props.product.price}</button>
        </div>
    );
}

export default Product;