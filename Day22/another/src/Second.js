import React from 'react';

class Second extends React.Component{
    usermessage="";
    constructor(props){
        super(props);
        this.usermessage=props.message
    }
  render(){
    return <h1>Hello from Second  {this.usermessage} </h1>
  }
}

export default Second;