const express = require('express')
const app = express()
//or 
//const app = require('express')()

// All Http Verb are Map to Method
app.get('/',(req,res)=>{
    console.log('User in Get Page');
    res.status(200).send('Home Page')
})

app.get('/about',(req,res)=>{
    res.status(200).send('About Page')
    })

app.get('*',(req,res)=>{
    res.status(404).send('<h1> Page Not Found </h1>')
})


app.listen(5000, ()=>{
console.log('Server is listening on port 5000....');
})