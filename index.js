const express = require("express") // import in es6 
const server = express() /// server/app
server.use(express.static("yakilamtu"))
// middleware  ---  sits betweet any request and specific path/route requested
server.use((req,res,next)=>{
    console.log(req.path);
    // protected routes 
    
    console.log("Middlew funxtion code running!!!!");
    next()
})
const mysql      = require('mysql');
const connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : '',
  database : 'carserviceclass'
});


// callback hell

server.get("/",(req,res)=>{
    console.log("Home/Root/Index/Landing Route");
    res.render("home.ejs")
})

server.get("/about",function authenticateUSer(req,res,next){
    console.log("Authenitcating user -- makaing sure person is logged innnn");
    next()
}, (req,res)=>{
    console.log("About page/route/path/URI");
    res.send("About Page")
})
server.get("/vehicles",(req,res,next)=>{
    if(10<12){
        res.send("Not authorized!!")
    }else{
        next()
    }
}, (req,res)=>{
    connection.query("SELECT * FROM vehicles", (err,vehicles)=>{
        if(!err){
            console.log(vehicles);
            res.json(vehicles)
        }else{
            console.log(err);
            res.status(500).send("Server Error")
        }
    })
})
// send mechanics data to the client through /mechanics get route

// other routes/paths/URIs
server.get("*", (req,res)=>{
    console.log("Unidentified route");
    res.status(404).send("Page/Resource Not Found")    
})

server.listen(3000, ()=>console.log("Starting Server on PORT 3000") )

// HTTP 
// Authention and Authorization --- 



// web app -- web site 
// get - home route , /about route, /gallery route, /contact route
//post route -- contact -- save message, email, phone in a database 
// -- create a db with one table-messages-- message , phone, email