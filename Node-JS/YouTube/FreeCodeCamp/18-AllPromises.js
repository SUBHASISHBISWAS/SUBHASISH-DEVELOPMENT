const {readFile,writeFile} = require('fs').promises

/*
const util = require('util')
// This will convert readFile and WriteFile to Promise
const readFilePromise = util.promisify(readFile)
const writeFilePromise = util.promisify(writeFile)
*/

/*
// 1. Version 1 with Callback
readFile('./Content/subFolder/File-1.txt','utf-8',(err,result)=>{
    if(err){
        console.log(err)
        return
    }
    else{
        console.log(result);
    }
})

*/

/*
// 2. Wrapping callback function inside Promise
// Promise takes resolve and reject funtion as paramter
// Once readFile reads the file and Execute callback the resolve promise method will execute
// if any error occurs during reading file callback return err and the Promise reject method will Execute
const getFileContent =(path)=>{
    return new Promise((resolve,reject)=>{
        readFile(path,'UTF-8',(err,result)=>{
            if(err){
                reject(err)    
            }
            else{
                resolve(result)
            }
        })

    })
}


//3. Calling function get Promise 
// then -> will execulte function when callback function completes and execute resolve or reject method
getFileContent('./Content/subFolder/File-1.txt')
.then((result)=>console.log(result))
.catch((err)=>console.log(err))
*/

/*
// 4. async wait with Promise
// creating a async Method
const readFileAsync = async()=>{

    // wating for promoise reject or resolve method to complte i.e callback of readFile to complete
    var firstContent= await getFileContent('./Content/subFolder/File-1.txt')
    console.log(firstContent);
}
*/

/*
// 4. async wait with Promise
// creating a async Method
const readFileAsync = async()=>{

    // wating for promoise reject or resolve method to complte i.e callback of readFile to complete
    var firstContent= await getFileContent('./Content/subFolder/File-1.txt')
    var secondContent= await getFileContent('./Content/subFolder/File-2.txt')
    await writeFile('./Content/subFolder/PromiseAsyncWait.txt', `CONTENT : ${firstContent}${secondContent}`)
}
*/

/*
// 4. async wait with Promise
// creating a async Method
const readFileAsync = async()=>{

    // wating for promoise reject or resolve method to complte i.e callback of readFile to complete
    var firstContent= await readFilePromise('./Content/subFolder/File-1.txt','UTF-8')
    var secondContent= await readFilePromise('./Content/subFolder/File-2.txt','UTF-8')
    console.log(`${firstContent} ${secondContent}`);
    
    await writeFilePromise(
        './Content/subFolder/PromiseAsyncWait.txt', 
        `CONTENT : ${firstContent} ${secondContent}`,
        {flag : 'a'})
        
}
*/

// 4. async wait with Promise
// creating a async Method
const readFileAsync = async()=>{

    // wating for promoise reject or resolve method to complte i.e callback of readFile to complete
    var firstContent= await readFile('./Content/subFolder/File-1.txt','UTF-8')
    var secondContent= await readFile('./Content/subFolder/File-2.txt','UTF-8')
    console.log(`${firstContent} ${secondContent}`);
    
    await writeFile(
        './Content/subFolder/PromiseAsyncWait.txt', 
        `CONTENT : ${firstContent} ${secondContent}`,
        {flag : 'a'})
        
}



// Executing asyncMethod
readFileAsync()


