// Single-sketch example

function setup() {
  createCanvas(800, 600);
  Hello();
}

function draw() {
  background(100);
  fill(255);
  noStroke();
  rectMode(CENTER);
  rect(mouseX, mouseY, 50, 50);
  Hello();
}

function Hello() {
  console.log("Hello");
  println("HI");
}
