import java.lang.Math;

class LaunchAngle
{
  PVector location;
  PVector velocity;
  PVector acceleration;
  boolean alive;
 
  int theta;
 
  LaunchAngle(int x_, int y_)
  {
    //class constructor
   
    //outputs the changing angle in the margin
    theta = Math.atan(y_ / x_);
  }
}
