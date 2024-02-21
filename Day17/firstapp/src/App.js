  import logo from './logo.svg';
  import './App.css';
  import Register from './Components/RegisterUser/Register';
  import Login from './Components/Login/Login';
  import Menu from './Components/Menu/Menu';
  import Todo from './Components/Todos/Todo';
  import Weather from './Components/Weather/Weather';
  import First from './First';
  import Error from './Components/Error/Error';
  import { BrowserRouter, Route, Routes } from 'react-router-dom';
  import PrivateRoute from './Components/PrivateRoutes/PrivateRoute';
  import Welcome from './Components/Welcome/Welcome';
  import Home from './Components/Home/Home';
  



  function App() {
    return (
      <BrowserRouter>
      <Routes>
        
          <Route path="/" element={<Home/>}>
              <Route index element={<Home/>}/>
              <Route path='login' element={<Login/>}/>
              <Route path='todo' element={<Todo/>}/>
              <Route element={<PrivateRoute/>}>
                  <Route path='weather' element={<Weather/>}/>
                    <Route path='welcome/:un' element={<Welcome/>}/>
              </Route>
              <Route path='*' element={<Error/>}/>
          </Route>
      </Routes>
      </BrowserRouter>
    );
  }

  export default App;
