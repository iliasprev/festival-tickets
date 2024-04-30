// Import express.js
const express = require("express");

// Create express app
var app = express();

// Add static files location
app.use(express.static("static"));

// Get the functions in the db.js file to use
const db = require('./services/db');
app.set('view engine', 'pug');
app.set('views', './app/views');
app.use(express.static("static"))


// Create a route for root - /
app.get("/", function(req, res) {
    res.send("Hello world from app.js");
});

app.get("/header",(req,res)=>{
    res.render("header")


})
app.get("/footer",(req,res)=>{
    res.render("footer")


})


// Create a route for testing the db
app.get("/db_test", function(req, res) {
    // Assumes a table called test_table exists in your database
    sql = 'select * from festivals';
    imageUrls = ["https://images-prod.dazeddigital.com/900/azure/dazed-prod/1290/4/1294079.jpg",
"https://images.prismic.io/indiecampers-demo/c9d6718c-72c8-4f1f-8847-f53396ae3c20_pexels-wendy-wei-1190297.jpg?auto=compress,format&rect=0,0,3298,2200&w=960&q=20&ar=4:3&fit=crop"]
    db.query(sql).then(results => {
        // console.log(results);
        results.forEach(festival => {
            console.log("--->", festival);
          });
        res.render("index",{"title":"my page","heading":"myheadIng","data":results})
    });
});

// Create a route for /goodbye
// Responds to a 'GET' request
app.get("/goodbye", function(req, res) {
    res.send("Goodbye world!");
});

// Create a dynamic route for /hello/<name>, where name is any value provided by user
// At the end of the URL
// Responds to a 'GET' request
app.get("/hello/:name", function(req, res) {
    // req.params contains any parameters in the request
    // We can examine it in the console for debugging purposes
    console.log(req.params);
    //  Retrieve the 'name' parameter and use it in a dynamically generated page
    res.send("Hello " + req.params.name);
});

// Start server on port 3000
app.listen(3000,function(){
    console.log(`Server running at http://127.0.0.1:3000/`);
});
