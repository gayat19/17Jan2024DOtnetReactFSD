import { useState } from 'react';
import './Todo.css';
function Todo(){
    //hook
    var [todo,setTodo]= useState({
        "userId": 0,
        "id": 0,
        "title": "0",
        "completed": false
    });

    //var todo;
    var fetchClick =() => fetch("https://jsonplaceholder.typicode.com/todos/1")
                .then(res=>res.json())
                .then(res=>{
                    setTodo(res);
                })
                .catch(err=>console.log(err));
    return(
        <div>
            <h1 className='todotitle'>Todo for the day</h1>
            <button onClick={fetchClick} className='btn btn-primary'>Get Data</button>
            <div className='alert alert-success tododiv'>
                Id : {todo.id}
                <br/>
                Title :{todo.title}
                <br/>
                Status : <button className='btn btn-success' disabled={!todo.completed} >Buy</button>
            </div>
        </div>
    );
}

export default Todo;