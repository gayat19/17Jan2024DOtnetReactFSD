function First(){
    // var name = "Ramu";
    // var age = 23;
    // var phone = "987654321";
    var user = {
        name: "Ramu",
        age :23,
        phone :"987654321"
    }
    return(
        <div>
           {/* interpollation */}
            Name :  {user.name}
            <br/>
            Age : {user.age}
            <br/>
            Phone : {user.phone}
        </div>
        
    );
}

export default First;