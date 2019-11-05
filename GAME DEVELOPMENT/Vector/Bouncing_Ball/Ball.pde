class Ball
{
  float x;
  float y;
  float xspeed;
  float yspeed;
  
  PVector position;
  PVector velocity;
  
  Ball()
  {
    x=width/2;
    y=height/2;
    xspeed=2.5;
    yspeed=2;
    
    position=new PVector(width/2,height/2);
    velocity=new PVector(2.5,2);
  }
}
