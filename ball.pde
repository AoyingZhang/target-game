class Ball {
  PVector pos;
  PVector velocity;
  PVector acceleration;
  PImage ballImage;
  boolean alive;

  Ball(PVector v_) {
    //class constructor
    pos = new PVector(70, 520);
    velocity = v_;
    alive = true;
    acceleration = new PVector(0, 0.2);

    //radius of image: 20 pix
    ballImage = loadImage("Cannonball.png");
  }

  void move() {
    //calculate new position of cannonball
    pos = pos.add(velocity);
    velocity = velocity.add(acceleration);
  }

  void display() {
    //display cannon ball on screen
    pushMatrix();
    translate(pos.x, pos.y);
    image(ballImage, 0, 0);
    popMatrix();
  }

  //check if reach the ground
  void checkGroundCollision() {
    if (pos.y > 546) {
      alive = false;
    }
  }

  Boolean isAlive() {
    return alive;
  }
}
