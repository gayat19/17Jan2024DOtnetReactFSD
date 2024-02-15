import { useState } from 'react';
import './Todo.css';
function Todo(){
    //hook
    var [todos,setTodos]= useState([{
        "userId": 0,
        "id": 0,
        "title": "0",
        "completed": false
    }]);

    var fetchClick =() => fetch("https://jsonplaceholder.typicode.com/todos")
                .then(res=>res.json())
                .then(res=>{
                    //setTodos(res);
                  alert("done");
                })
                .catch(err=>console.log(err));
    return(
        <div>
            <h1 className='todotitle'>Todo for the day</h1>
            <button onClick={fetchClick} className='btn btn-primary'>Get Data</button>
            {
            todos.map((todo)=>{
                
                <div  className='alert alert-success tododiv'>
                    <h2>Hello</h2>
                    Id : {todo.id}
                    <br/>
                    Title :{todo.title}
                    <br/>
                    Status : <button className='btn btn-success' disabled={!todo.completed} >Buy</button>
                </div>
            })
        }
        </div>
    );
}

export default Todo;