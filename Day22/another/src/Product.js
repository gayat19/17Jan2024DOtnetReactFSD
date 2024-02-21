import { createContext, useState } from "react";
import Cart from "./Cart";

const ProductContext = createContext();

function Product(){
    var [name,setName] = useState("Ramu")
return (
    <ProductContext.Provider value={name}>
        <input type="text" value={name} onChange={(e)=>setName(e.target.value)}/>
        <h1>Shopping Home</h1>
        <Cart/>
    </ProductContext.Provider>
);
}


export {ProductContext};
export default Product;