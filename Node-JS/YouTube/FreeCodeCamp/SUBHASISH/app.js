const express = require('express')
const path = require('path');


const app = express()
//or 
//const app = require('express')()

// Server static resouce requested by user while access ths page
// i.e if index.html is served  and if index.html use some more resource 
// it will server that resource
// Setup static and middleware
app.use(express.static('./public'))

// All Http Verb are Map to Method
// This only Serve index.html but not the resource used inside index.html
app.get('/',(req,res)=>{
    res.sendFile(path.resolve(__dirname,'navbar-app/index.html'))
})


app.get('*',(req,res)=>{
    res.status(404).send('<h1> Page Not Found </h1>')
})


app.listen(5000, ()=>{
console.log('Server is listening on port 5000....');
})