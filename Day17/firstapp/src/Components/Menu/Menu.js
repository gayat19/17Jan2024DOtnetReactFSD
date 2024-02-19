import { Link, Outlet } from "react-router-dom";

function Menu(){

    return(
       <div>
         <ul className="nav">
            <li className="nav-item">
               <Link className="nav-link" to='/login'>Login</Link>
            </li>
            <li className="nav-item">
                <Link className="nav-link" to='/todo'>Todo</Link>
            </li>
            <li className="nav-item">
            <Link className="nav-link" to='/weather'>Weather</Link>
            </li>
            <li className="nav-item">
                <a className="nav-link" href="http://localhost:3000/todo">Anchor ad TOdo link</a>
            </li>
        </ul>
        <Outlet/>
       </div>
    );
}

export default Menu;