const http = require('http');
const {readFileSync} = require('fs')

// Read Content of Index.html File 
// All the static resource used in page served need to read and provide by Server
const homePage = readFileSync('./navbar-app/index.html')
const homeStyle = readFileSync('./navbar-app/styles.css')
const homeLogo = readFileSync('./navbar-app/logo.svg')
const browserApp = readFileSync('./navbar-app/browser-app.js')

const server = http.createServer((req,res)=>{

    const url = req.url

    if(url === "/"){
        res.writeHead(200,{'content-type':'text/html'})
        res.write(homePage)
        res.end()
    }
    // Index.html uses static css file which need to provided by server on request
    // Content type should be 'text/css'
    else if(url === "/styles.css"){
        res.writeHead(200,{'content-type':'text/css'})
        res.write(homeStyle)
        res.end()
    }

// Index.html uses static logo file which need to provided by server on request
// Content type should be 'image/svg+xml'
    else if(url === "/logo.svg"){
        res.writeHead(200,{'content-type':'image/svg+xml'})
        res.write(homeLogo)
        res.end()
    }

    // Index.html uses javascript file which need to provided by server on request
    // Content Type should be 'text/javascript'
    else if(url === "/browser-app.js"){
        res.writeHead(200,{'content-type':'text/javascript'})
        res.write(browserApp)
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

