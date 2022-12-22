class Explosion {
  PImage ex1, ex2, ex3, ex4, ex5, ex6;
  int currentFrame=0;
  float targetX, targetY;
  //explosion images
  void loadImages(){
    ex1 = loadImage("ex1.png");
    ex2 = loadImage("ex2.png");
    ex3 = loadImage("ex3.png");
    ex4 = loadImage("ex4.png");
    ex5 = loadImage("ex5.png");
    ex6 = loadImage("ex6.png");
  }
  Explosion(float x, float y) {
    loadImages();
    //int currentFrame = 0;
    targetX = x;
    targetY = y;
    
  }

  void display() {
    if(currentFrame == 0) image(ex1, targetX, targetY);
  
    else if(currentFrame <=4)image(ex2, targetX, targetY);
    else if(currentFrame <=8)image(ex3, targetX, targetY);
    else if(currentFrame <=12)image(ex4, targetX, targetY);
    else if(currentFrame <=16)image(ex5, targetX, targetY);
    else if(currentFrame <=20)image(ex6, targetX, targetY);
    
    currentFrame++;
  }

  Boolean alive() {
    if (currentFrame>20) {
      return false;
    }
    return true;
  }
}
