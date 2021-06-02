
void setup()
{
  size(400,300);
}

void draw()
{
    background(255);
    stroke(0);
    strokeWeight(2);
    noFill();
    translate(width/2,height/2);
    ellipse(0,0,5,5);
    
    PVector center=new PVector(width/2,height/2);
    PVector mouse=new PVector(mouseX,mouseY);
    
    mouse.sub(center);
    
    /*
    float m=mouse.mag();
    fill(255,0,0);
    rect(0,0,m,20);
    */
    
    mouse.normalize();
    mouse.mult(50);
    
    mouse.setMag(100);
    print(mouse.x);
    line(0,0,mouse.x,mouse.y);
   
    
}
