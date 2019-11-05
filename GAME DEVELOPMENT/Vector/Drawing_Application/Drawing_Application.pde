import java.util.*;

void setup()
{
  size(640,360);
}

void draw()
{
  
  //background(255);
  stroke(255,0,0);
  fill(0,255,0);
  rectMode(CENTER);
  
  line(pmouseX,pmouseY,mouseX,mouseY);
}
