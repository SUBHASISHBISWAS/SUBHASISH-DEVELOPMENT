// npm -global command , comes with node
// npm --version or npm --v

// local dependency -use it only in this particular project
// mpm -i <PackageName>

// Global Dependency - use it any Project
// npm install -g <PackageName>
// sudo npm install -g <PackageName> (mac)


// package.json -manifestfile file (store important info about project/package)
// manual approach (create package.json in the root, create properties etc)
// Below Command create package.json
// npm -init (step by step, Enter tp skip)
// npm -init -y (everything default)

const _ = require('lodash');

const items = [1,[2,[3,[4]]]]
const  newItems = _.flattenDeep(items)
console.log(newItems);