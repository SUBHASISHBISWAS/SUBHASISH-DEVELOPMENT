const express = require('express')
const path = require('path');

const app = express()

const {products} = require('./data')

app.get('/',(req,res)=>{
res.send('<h1>Home Page </h1><a href="/api/products">Products</a>')
})

app.get('/api/products',(req,res)=>{
    const newProducts = products.map((product)=>{
        const {id,name,image}=product
        return {id,name,image}
    })
    res.json(newProducts)
    })
// URL paramater   
//  Get Product from Id passed as requestParamater
    app.get('/api/products/:productId',(req,res)=>{

        //http://localhost:5000/api/products/1
        // accessing url paramater
        const {productId} = req.params
        console.log(productId);
    
        // used find method to find product using id passed as paratmeter in url
        const foundProduct = products.find (
            (product)=>product.id === Number(productId))

        if(!foundProduct){
            return res.status(404).send('Product Not Exist')
        }
        return res.json(foundProduct)
        })

        // passing Multiple Params
        //http://localhost:5000/api/products/1/reviews/10
      app.get('/api/products/:productId/reviews/:reviewId',(req,res)=>{

        const {productId, reviewId} = req.params
        console.log(productId,reviewId);
        res.send('Review')
      })  





app.listen(5000, ()=>{
console.log('Server is listening on port 5000....');
})