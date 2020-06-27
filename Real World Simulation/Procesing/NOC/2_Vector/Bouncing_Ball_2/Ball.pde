public class Ball  
{
/*
    float  x = width/2;
    float y = height/2;
    float xspeed = 2.5;
    float yspeed = -2;
*/

    PVector location;
    PVector velocity;



    Ball () 
    {
        location=new PVector(width/2,height/2);
        velocity=new PVector(-2.5,2);
    }

    void move()
    {
        /*

            x=x+xspeed;
            y=y+yspeed; 

        */
        location.add(velocity);
    }

    void bounce(){

        /*

            if (x>width || x<0) {
                xspeed = xspeed * -1;
            }
            if(y>height || y<0){
            yspeed = yspeed * -1;
        }

        */
        if (location.x>width || location.x<0) 
        {
            velocity.x=velocity.x * -1;
        }
        if(location.y>height || location.y<0)
        {
            velocity.y=velocity.y * -1;
        }
    }

    void display(){
        stroke(0);
        strokeWeight(2);
        fill(127);
        ellipse(location.x, location.y, 48, 48);
    }

}
