const {readFile,writeFile} = require('fs')

const util = require('util')
// This will convert readFile to Promise
const readFilePromise = util.promisify(readFile)
const writeFilePromise = util.promisify(writeFile)


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

*/

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

// Executing asyncMethod
readFileAsync()
