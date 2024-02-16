import logo from './logo.svg';
import './App.css';
import Register from './Components/RegisterUser/Register';
import Login from './Components/Login/Login';

function App() {
  return (
    <div className="App">
      <h1 className='alert alert-primary'>Employee Request Management</h1>
      <Login/>
    </div>
  );
}

export default App;
