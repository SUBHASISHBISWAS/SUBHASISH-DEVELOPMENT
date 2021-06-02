const path = require('path')

console.log(path.sep);

filePath=path.join('/Content','subFolder','Test.txt')
console.log(filePath);

const fileName = path.basename(filePath)
console.log(fileName);

var absolutePath=path.resolve(__dirname,'Content','subFolder')
console.log(absolutePath);