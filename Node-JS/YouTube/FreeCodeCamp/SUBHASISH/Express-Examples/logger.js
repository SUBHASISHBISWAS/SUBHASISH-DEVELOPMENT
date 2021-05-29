
// Createing Logger method as middleware wich take request,response, and next method
const logger = (req,res,next)=>{
    const methodName= req.method
    const url= req.url
    const dateTime = new Date().getFullYear();
    console.log(methodName, url, dateTime);
    next()
}

module.exports = logger