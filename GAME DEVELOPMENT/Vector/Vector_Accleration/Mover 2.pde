class RollingBall
{
  
  PVector location;
  PVector velocity;
  PVector accleration;
  
  RollingBall()
  {
   
    location=new PVector(width/2,height/2);
    velocity=new PVector(0,0);
    accleration=new PVector(0,0);
  }
  
  void update()
  {
    //Assigining random value to accleration
    accleration= PVector.random2D();
    
    velocity.add(accleration);
    location.add(velocity);
    velocity.limit(2);
  }
  
  void edges()
  {
    if(location.x>width) location.x=0;
    if(location.y<0) location.x=width;
    if(location.y>height) location.y=0;
    if(location.y<0) location.x=height;
  }
  
  void display()
  {
    stroke(0);
    strokeWeight(2);
    fill(128);
    ellipse(location.x,location.y,50,50);
  }
}
