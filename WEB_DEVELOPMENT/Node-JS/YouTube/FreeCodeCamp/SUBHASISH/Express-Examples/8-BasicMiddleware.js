
const express = require('express')
const path = require('path');

const app = express()

const {products} = require('./data')



// req -> middleware -> res

// Createing Logger method as middleware wich take request,response, and next method
const logger = (req,res,next)=>{
    const methodName= req.method
    const url= req.url
    const dateTime = new Date().getFullYear();
    console.log(methodName, url, dateTime);
    next()
}

// Adding logger middleware into get route
// evertime this request comes for this url logger middleware will execute
app.get('/',logger,(req,res)=>{
res.send('<h1>Home Page </h1><a href="/api/products">Products</a>')
// Wanted log this information everytime request Comes
//const methodName= req.method
//const url= req.url
//const dateTime = new Date().getFullYear();
//console.log(methodName, url, dateTime);

})

// Adding logger middleware into get route
app.get('/about',logger,(req,res)=>{
    res.send('<h1>Home Page </h1><a href="/api/products">Products</a>')
    // Wanted log this information everytime request Comes
    //const methodName= req.method
    //const url= req.url
    //const dateTime = new Date().getFullYear();
    
    })



app.listen(5000, ()=>{
console.log('Server is listening on port 5000....');
})