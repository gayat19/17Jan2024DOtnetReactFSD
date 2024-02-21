import { useContext } from "react";
import { ProductContext } from "./Product";


function Cart(){
   const uname = useContext(ProductContext)
    return (
    
        <h1>Cart welcomes {uname}</h1>
   
);
}

export default Cart;