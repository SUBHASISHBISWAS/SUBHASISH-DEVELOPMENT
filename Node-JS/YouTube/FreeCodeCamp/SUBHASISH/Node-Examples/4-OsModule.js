const os = require('os')

const currentOS={
    name : os.type(),
    release :  os.release(),
    totalMem : os.totalmem()/(1024 *1024 * 1024),
    freeMem : os.freemem()/(1024 * 1024 * 1024)
}

console.log(currentOS);