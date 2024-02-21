import React from 'react';
import Second from './Second';
import Product from './Product';

class App extends React.Component{

  render(){
    return <div>
      {/* Hello from class Component!!! */}
      <Product/>
      {/* <Second message="Hello from property"/> */}
      </div>
  }
}

export default App;