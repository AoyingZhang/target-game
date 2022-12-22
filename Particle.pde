class Particle {
  //class properties(variables)
  PVector location;
  PVector velocity;
  PVector acceleration;
  int size;
  color Color;
  float colX;
  
  boolean alive;
  int LIFETIME =20;
  int steps;
  


  //class constructor(to initialize the object0
  Particle(int x_, int y_) {
    
    //accelerate up
    acceleration = new PVector(0,-0.05);
    
    //move in random velocity and given location
    velocity = new PVector(random(-0.5, 0.5), random(-0.5, 0.5));
    location = new PVector(x_, y_);
    size = 30;
    //set for lifetime
    alive = true;
    steps = 0;
    
    colX = random(50, 200);
    Color = color ((int)colX);
  }



  //class functions
  void move() {
    //make sure particle alive
    if(steps>LIFETIME){
      alive = false;
    }
    //bounce from bottom
    /*
    if (location.y >= height)
    {
      velocity.x = random(-1,1)-0.7;
      velocity.y = -velocity.y+0.7;
      
    }*/
    //move
    
    velocity.add(acceleration);
    location.add(velocity);
    steps++;
    
  }

  void display() {
    fill(Color);
    
    //matrix system
    pushMatrix();
    translate(location.x, location.y);
    //draw particles with scale
    scale(1-steps*0.035);
    
    ellipse(0, 0, size, size);
    popMatrix();
}
  
  boolean isAlive(){
    return alive;
  }
}
