//inbuilt Function
//setInterval(()=>{console.log(__dirname)},1000)

//Custom Function
const helloThere =(name)=>{
    console.log(`Hello :${name}`)
}
// Exporting function
module.exports = helloThere

//On call require to this module this function will autometicall gets called
//helloThere('subhasish')


