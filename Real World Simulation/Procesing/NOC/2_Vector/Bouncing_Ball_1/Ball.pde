public class Ball  
{
    float  x = 0.0;
    float y = 0.0;
    float xspeed = 0.0;
    float yspeed = 0.0;
    Ball () 
    {
        x=width/2;
        y=height/2;
        xspeed=2.5;
        yspeed=-2;
    }

    void move(){
        x=x+xspeed;
        y=y+yspeed; 
    }

    void bounce()
    {
        if (x>width || x<0) {

            xspeed = xspeed * -1;
        }
        if(y>height || y<0){
            yspeed = yspeed * -1;
        }
    }

    void display(){
        stroke(1);
        strokeWeight(2);
        fill(127);
        ellipse(x, y, 48, 48);
    }



}
