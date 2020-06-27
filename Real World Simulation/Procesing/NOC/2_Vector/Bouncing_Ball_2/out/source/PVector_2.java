import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class PVector_2 extends PApplet {

Ball b;

public void  setup() {
    
    b=new Ball();
}

public void draw() {
  background(255);
  stroke(255,0,0);
  fill(0,255,0);
  //rectMode(CENTER);

  b.move();
  b.bounce();
  b.display();
}
public class Ball  
{
    PVector location;
    PVector velocity;

    float  x = width/2;
    float y = height/2;
    float xspeed = 2.5f;
    float yspeed = -2;

    Ball () 
    {
        location=new PVector(width/2,height/2);
        velocity=new PVector(-2.5f,2);
    }

    public void move()
    {
        location.add(velocity);
    }

    public void bounce(){
        if (location.x>width || location.x<0) 
        {
            velocity.x=velocity.x * -1;
        }
        if(location.y>height || location.y<0)
        {
            velocity.y=velocity.y * -1;
        }
    }

    public void display(){
        stroke(0);
        strokeWeight(2);
        fill(127);
        ellipse(location.x, location.y, 48, 48);
    }

}
  public void settings() {  size(640,360); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "PVector_2" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
