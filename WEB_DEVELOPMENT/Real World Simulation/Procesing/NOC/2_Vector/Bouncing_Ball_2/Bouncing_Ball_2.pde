Ball b;

void  setup() {
    size(640,360);
    b=new Ball();
}

void draw() {
  background(255);
  stroke(255,0,0);
  fill(0,255,0);
  //rectMode(CENTER);

  b.move();
  b.bounce();
  b.display();
}
