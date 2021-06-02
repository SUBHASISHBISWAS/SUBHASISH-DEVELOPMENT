const express = require('express')
const app = express()


// req -> middleware -> res

// Createing Logger method as middleware wich take request,response, and next method
const logger = require('./logger')

// importing Authorize as middleware wich take request,response, and next method
const authorize = require('./authorise')

// instead of adding to each route this will add logger middleware to every route
// we are adding two middleware to this
app.use([logger,authorize])

// Adding logger middleware into get route
app.get('/api',(req,res)=>{
res.send('<h1>Home Page </h1><a href="/api/products">Products</a>')

})

// Adding logger middleware into get route
app.get('/api/about',(req,res)=>{
    res.send('<h1>Home Page </h1><a href="/api/products">Products</a>')
    
    })

    // Adding logger and authorize middleware  explicitly into get route
app.get('/api/products',[logger,authorize],(req,res)=>{
    res.send('<h1>Home Page </h1><a href="/api/products">Products</a>')
    
    })



app.listen(5000, ()=>{
console.log('Server is listening on port 5000....');
})