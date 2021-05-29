const http = require('http');
const {readFileSync} = require('fs')
// Read Html File 
const   homePage = readFileSync('./index.html')

const server = http.createServer((req,res)=>{

    const url = req.url

    if(url === "/"){
        res.writeHead(200,{'content-type':'text/html'})
        res.write(homePage)
        res.end()
    }
    else if(url === "/about"){
        res.writeHead(200,{'content-type':'text/html'})
        res.write('<h1> Hello About</h1>')
        res.end()
    }
    else{
        res.writeHead(404,{'content-type':'text/html'})
        res.write('<h1> Page Not Found</h1>')
        res.end()
    }
   
})

server.listen(50000,()=>{
    console.log("Server Started Lisning on POrt 50000");
})

