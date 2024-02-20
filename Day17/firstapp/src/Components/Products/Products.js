import Product from "../Product/Product";

function Products(props){
    var products = props.products;
    var productsCart=(e)=>{
        console.log(e)
        //props.onSendToCart(e);
    }
    return(
        <div>
            <h2 className="alert alert-primary">Products</h2>
            {
                products.map((p)=><Product  key={p.id}  product={p}/>)
            }
        </div>
    );
}

export default Products;