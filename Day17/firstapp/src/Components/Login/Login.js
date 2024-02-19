import { useState } from 'react';
import './Login.css';
import { Outlet } from 'react-router-dom';

function Login(){
    var [username,setUsername]=useState("");
    var [password,setPassword] = useState("");
    var [loggedin,setLoggedin] = useState(false);
    var user={};
    var login =(e)=>{
        e.preventDefault();
        user.username = username;
        user.password=password;
        user.role = "";
        user.token ="";
        var requestOptions = {
            method :'POST',
            headers: {'Content-Type':'application/json'},
            body : JSON.stringify(user)
        }
       
        console.log(requestOptions);
        fetch("http://localhost:5090/api/User/Login",requestOptions)
        .then(res=>res.json())
        .then(res=>{
            sessionStorage.setItem("token",res.token);
            sessionStorage.setItem("username",res.username);
            alert("Login success - "+res.username);
            setLoggedin(true);
        })
        .catch(err=>{
            console.log(err);
            setLoggedin(false);
        });
    };
    return(<div>
        {loggedin==true? <h2 className='alert alert-success'>Welcome you have successfully logged in - {username}</h2>:null}
        
       
        <div className='alert alert-primary divlogin'>
        
        <form>
            <label className="form-control">Username</label>
            <input placeholder='username' className="form-control" type="text" value={username} 
            onChange={(e)=>setUsername(e.target.value)}/>
            <br/>
            <label className="form-control">Password</label>
            <input className="form-control" type="password" value={password} 
            onChange={(e)=>setPassword(e.target.value)}/>
            <button onClick={login} className="btn btn-success">Login</button>
            <button className="btn btn-danger">Cancel</button>
        </form>
    </div>
    <Outlet/>
    </div>);
}

export default Login;