function setup() {
  //createCanvas(windowWidth, windowHeight);
  noCanvas();
  CreateTree();
}

function draw() {}

var tree;
function CreateTree() {
  tree = new Tree();

  for (i = 0; i < 10; i++) {
    tree.addValue(floor(random(0, 100)));
  }
  /*
  tree.addValue(10);
  tree.addValue(5);
  tree.addValue(1);

  tree.addValue(6);
  tree.addValue(3);
  tree.addValue(30);
*/
  console.log(tree);

  tree.traverse();

  //tree.search(24);
}
