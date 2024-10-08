const express = require("express") // import in es6 
const server = express()
server.use(express.static("yakilamtu"))
// middleware  --- what  is a middleware function

const mysql      = require('mysql');
const connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : '',
  database : 'carserviceclass'
});


// callback hell

server.get("/", (req,res)=>{
    console.log("Home/Root/Index/Landing Route");
    res.render("home.ejs")
})

server.get("/about", (req,res)=>{
    console.log("About page/route/path/URI");
    res.send("About Page")
})
server.get("/vehicles", (req,res)=>{
    connection.query("SELECT * FROM vehicles", (err,vehicles)=>{
        if(!err){
            console.log(vehicles);
            res.render("vehicles.ejs",{vehicles})
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