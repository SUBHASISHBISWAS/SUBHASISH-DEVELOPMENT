const {readFile,writeFile} = require('fs')


// 1. Version 1 with Callback
// readFile willExecute and return with wating for callback to Complte
// On reading file callback will Execute at later point of time
readFile('./Content/subFolder/File-1.txt','utf-8',(err,result)=>{
    if(err){
        console.log(err)
        return
    }
    else{
        console.log(result);
    }
})

