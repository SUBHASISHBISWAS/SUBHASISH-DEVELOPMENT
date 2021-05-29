const {readFile,writeFile} = require('fs')
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

// 4. async wait with Promise
// creating a async Method
const readFileAsync = async()=>{

    // wating for promoise reject or resolve method to complte i.e callback of readFile to complete
    var firstContent= await getFileContent('./Content/subFolder/File-1.txt')
    console.log(firstContent);
}

// Executing asyncMethod
readFileAsync()