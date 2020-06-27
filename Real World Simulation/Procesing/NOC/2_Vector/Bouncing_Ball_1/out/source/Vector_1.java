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

public class Vector_1 extends PApplet {

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
    float  x = 0.0f;
    float y = 0.0f;
    float xspeed = 0.0f;
    float yspeed = 0.0f;
    Ball () 
    {
        x=width/2;
        y=height/2;
        xspeed=2.5f;
        yspeed=-2;
    }

    public void move(){
        x=x+xspeed;
        y=y+yspeed; 
    }

    public void bounce()
    {
        if (x>width || x<0) {

            xspeed = xspeed * -1;
        }
        if(y>height || y<0){
            yspeed = yspeed * -1;
        }
    }

    public void display(){
        stroke(1);
        strokeWeight(2);
        fill(127);
        ellipse(x, y, 48, 48);
    }



}
  public void settings() {  size(640,360); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Vector_1" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
