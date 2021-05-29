// This is Same as above two Line
// Access the method directly
const {readFile,writeFile} = require('fs')

console.log('Start Of Reading File');

//Reading First File
readFile('./Content/subFolder/File-1.txt',(err,result)=>{
    console.log('Reading File');

    if (err){
        console.log(err);
        return;
    }
    const firstFile = result
// In the callback of  Reading First File we start reading Second File
    readFile('',()=>{
        if (err){
            console.log(err);
            return;
        }
        const secondFile = result
        // In the callback of  Reading Second File we start Writing File
        writeFile('./Content/subFolder/AsyncResultFile.txt',`File Content : ${firstFile}, ${secondFile}`,
        (err,result) => {
            if (err){
                console.log(err);
                return;
            }
             
        })
    })

})
console.log('After Reading Next Task');
