RollingBall m;

void setup()
{
  size(500,500);
  m=new RollingBall();
}

void draw()
{
  background(255);
  m.update();
  m.edges();
  m.display();
}
