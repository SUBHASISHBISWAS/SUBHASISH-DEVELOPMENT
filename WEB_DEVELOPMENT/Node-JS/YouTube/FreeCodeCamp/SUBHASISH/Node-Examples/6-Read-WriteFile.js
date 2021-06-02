//const fs = require('fs')
//const readFileSync = fs.readFileSync

// This is Same as above two Line
// Access the method directly
const {readFileSync,writeFileSync} =require('fs')

// Synchronously Reading File
const firstFile = readFileSync('./Content/subFolder/File-1.txt','utf-8')

const secondFile = readFileSync('./Content/subFolder/File-1.txt','utf-8')

writeFileSync('./Content/subFolder/SyncResultFile.txt',`File Content : ${firstFile}, ${secondFile}`)


