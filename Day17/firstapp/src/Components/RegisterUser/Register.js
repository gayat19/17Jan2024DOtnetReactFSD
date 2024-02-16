import { useState } from "react";
import './Register.css';

function Register(){
    var [username,setUsername]=useState("")
    var [password,setPassword] = useState("");
    var [role,setRole] = useState("");
    var [dateOfBirth,setDateOfBirth] = useState(new Date());
    var [name,setName] = useState("");
    var [email,setEmail] = useState("");
    var [phone,setPhone] = useState("");
    var [departments,setDepartments] = useState([]);
    var [departmentId,setDepartmentId]= useState("");

    var employee = {};

    var register =()=>{
        employee.username = username;
        employee.password = password;
        employee.role = role;
        employee.dateOfBirth = dateOfBirth;
        employee.name = name;
        employee.email = email;
        employee.phone = phone;
        employee.departmentId = departmentId;
        console.log(employee);
    };

    var getDepartments =  ()=>{
        fetch("http://localhost:5090/api/Department")
        .then(res=>res.json())
        .then(res=>{
             setDepartments(res);
            console.log(departments);
        });
    }
    
    var changename =(eventargs)=>{
        setUsername(eventargs.target.value)
    }
    return(
       
        <div className="alert alert-success divregister">
            <label className="form-control">Username</label>
            <input className="form-control" type="text" value={username} 
            onChange={changename}/>
            <label className="form-control">Password</label>
            <input className="form-control" type="password" value={password} 
            onChange={(e)=>setPassword(e.target.value)}/>
            <label className="form-control">Role</label>
            <select className="form-control" onChange={(e)=>setRole(e.target.value)}>
                <option value="">--select role--</option>
                <option value="user">User</option>
                <option value="admin">Admin</option>
            </select>

            <label className="form-control">Name</label>
            <input className="form-control" type="text" value={name} 
            onChange={(e)=>setName(e.target.value)}/>
            <label className="form-control">Phone</label>
            <input className="form-control" type="phone" value={phone} 
            onChange={(e)=>setPhone(e.target.value)}/>
            <label className="form-control">Email</label>
            <input className="form-control" type="email" value={email} 
            onChange={(e)=>setEmail(e.target.value)}/>

            <button onClick={getDepartments} className="btn btn-primary">Get Departments</button>
            <label className="form-control">Department</label>
            <select className="form-control" onChange={(e)=>setDepartmentId(e.target.value)}>
                {departments.map((department)=>
                <option key={department.deparmentNumber} value={department.deparmentNumber}>{department.name}</option>)}
            </select>

            <label className="form-control">Date of Birth</label>
            <input className="form-control" type="datetime-local" value={dateOfBirth} 
            onChange={(e)=>setDateOfBirth(e.target.value)}/>


            <button onClick={register} className="btn btn-success">Register</button>
            <button className="btn btn-danger">Cancel</button>
        </div>
    );

}

export default Register;