// Single-sketch example

function setup() {
  noCanvas();
  CreateTree();
}

var tree;
function CreateTree() {
  tree = new Tree();
  tree.addValue(10);
  tree.addValue(5);
  tree.addValue(1);

  tree.addValue(20);
  tree.addValue(25);
  tree.addValue(30);

  console.log(tree);
}
