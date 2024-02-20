import { useState } from "react";
import Cart from "../Cart/Cart";
import Products from "../Products/Products";

function Home(){
    var cartItems = [];
var products = [
    {'id':1,
    name:'Pencil',
    'price':20,
    'quantity':5
    },
    {'id':2,
    'name':'Eraser',
    'price':5,
    'quantity':7

    },
    {'id':3,
    name:'Scale',
    'price':30,
    'quantity':3
    }
]
var addItemsToCart =(e)=>{
    var product = {
        name:e.name,
        id:e.id,
        price:e.price
    }
    cartItems.push(product);
    setCart(cartItems);
    console.log(cart)

}

var [cart,setCart] = useState([])
return(
    <div>
        <h2 className="alert alert-primary">Welcome to the shopping page!!!</h2>
        <div className="container">
        <div className="row">
            <div className="col-10">
               <Products products={products}/>
            </div>
            <div className="col">
            <Cart cart={cart}/>
            </div>
        </div>
        
        </div>
    </div>
);
}

export default Home;