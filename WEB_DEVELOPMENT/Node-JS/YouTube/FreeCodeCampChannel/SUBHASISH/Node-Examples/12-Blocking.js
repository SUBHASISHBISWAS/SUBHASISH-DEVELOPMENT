const  http = require('http')

// Create  HTTP Server
// Callback requst and respose
const server = http.createServer((req,res)=>{
  //console.log(req)  
  //res.write('Welcome Subhasish')
  if(req.url === '/')
  {
      res.end('Hello Subhasish')
  }
  if(req.url === '/about')
  {
      res.end('Hello About')
  }

})
// Listen to Server
server.listen(50000, ()=>{
    console.log('Server Listenning on port 50000...');
})