const {readFile,writeFile} = require('fs')

// 1. Execute This First
console.log('Start Of Reading File');

//2. Execute This readfile Second but callback will not execute 
readFile('./Content/subFolder/File-1.txt','utf-8',(err,result)=>{
    

    if (err){
        console.log(err);
        return;
    }
    // 3. Once REsult avaiable the Execute this callback
    console.log(result);

})

//3. Execute This Third 
console.log("Next Task");