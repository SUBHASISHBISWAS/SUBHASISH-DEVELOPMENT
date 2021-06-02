
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
    mouse.mult(2);
    line(0,0,mouse.x,mouse.y);
    
}
