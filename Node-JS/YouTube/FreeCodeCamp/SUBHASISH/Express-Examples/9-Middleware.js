const express = require('express')
const app = express()


// req -> middleware -> res

// Createing Logger method as middleware wich take request,response, and next method
const logger = require('./logger')

// instead of adding to each route this will add logger middleware to every route
app.use(logger)

// Adding logger middleware into get route
app.get('/',(req,res)=>{
res.send('<h1>Home Page </h1><a href="/api/products">Products</a>')

})

// Adding logger middleware into get route
app.get('/about',(req,res)=>{
    res.send('<h1>Home Page </h1><a href="/api/products">Products</a>')
    
    })



app.listen(5000, ()=>{
console.log('Server is listening on port 5000....');
})