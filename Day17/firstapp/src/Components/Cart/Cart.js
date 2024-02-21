import { useState } from "react"
import { useSelector } from "react-redux"

export default function Cart(props){
    //var cart = props.cart;
   // var [cart,setCart] = useState(props.cart);
   var cart = useSelector((state)=>state.cart);
    
    
    return (
        <div>
            <h2>Cart</h2>
            {cart.length}
            {(cart.length ==0)?<div style={{backgroundColor:"aqua"}}>Cart is empty</div>:<div>
                {
                    cart.map(c=><div key={c.id}>
                        {c.name}
                    </div>)
                }
                </div>}
        </div>
    )
}