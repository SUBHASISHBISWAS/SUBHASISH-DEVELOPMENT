const express = require('express')
const path = require('path');

const app = express()

const {products} = require('./data')

    app.get('/',(req,res)=>{
    res.send('<h1>Home Page </h1><a href="/api/products">Products</a>')
    })


      // passing Query Paramater 
      //http://localhost:5000/api/v1/query?search=1&limit=2
      app.get('/api/v1/query',(req,res)=>{

        const {search,limit} = req.query
        console.log(req.query);
        let sortedProduct = [...products]

         // Use Filter method to filter product passed as query string : query?search
      app.get('/api/v1/query',(req,res)=>{
        if(search){
            sortedProduct = sortedProduct.filter((product)=>{
                return product.name.startsWith(search)
            })
        }
        

        // Use slice method to filter product passed as query string : query?search
        if(limit){
            sortedProduct = sortedProduct.slice(0,Number(limit))
        }

        return res.status(200).json(sortedProduct)

      })



app.listen(5000, ()=>{
console.log('Server is listening on port 5000....');
})