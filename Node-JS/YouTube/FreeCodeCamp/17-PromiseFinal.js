

// insted of this we can use belo
const util = require('util')
// This will convert readFile and WriteFile to Promise
const readFilePromise = util.promisify(readFile)
const writeFilePromise = util.promisify(writeFile)

const {readFile,writeFile} = require('fs').promises

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
