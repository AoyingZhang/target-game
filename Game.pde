class Game {
  //explode layer
  PGraphics explode;

  ArrayList<Ball> shots = new ArrayList<Ball>();
  ArrayList<Explosion> myExplosions = new ArrayList<Explosion>();
  ArrayList<Particle> particles= new ArrayList<Particle>();
  PImage backImage, base, barrel, target,
    shots1, shots2, shots3, shots4, shots5, shots6, shots7, shots8, shots9,
    shots10, shots11, shots12, shots13, shots14, shots15, shots16, shots17,
    shots18, shots19, shots20, target1, target2, target3, target4, target5,
    target6, target7, target8, target9, target10, target11, target12, target13,
    target14, target15, target16, target17, target18, target19, target20;
  float cannonAngle = 0;
  float cannonPower = 5;
  int ballsCount = 20;
  int targetCount = 20;
  int fallCount = 0;
  int collidesCount = 0;
  PFont f = createFont("Arial", 16, true);
  Boolean stopGame = false;

  //initialize target position
  float targetX = random(150, 1050);
  float targetY = random(120, 500);
  Game() {
    imageMode(CENTER);
    loadImages();
  }

  void play() {
    //draw background image to screen
    image(backImage, width/2, height/2);

    //move and draw cannon balls
    for (int i = 0; i<shots.size(); i++) {
      Ball b = shots.get(i);
      b.move();
      b.display();
      b.checkGroundCollision();

      //if touch ground, remove ball
      if (b.alive == false) {
        //add smoke effect
        for(int j = 0;j<30; j++){
        particles.add(new Particle(int(b.pos.x), int(b.pos.y) ));
        }
        shots.remove(i);
        i--;
        fallCount+=1;
      }
    }
    displayPower();
    displayCannon();
    displayTarget();
    displayBallsNum();
    displayTargetsNum();
    //if no balls left, end game
    if (ballsCount ==0 && (fallCount+collidesCount >= 20)) {
      stopGame = true;
      displayResult();
    }
    //show explosion
    for (int i = 0; i<myExplosions.size(); i++) {
      Explosion e = myExplosions.get(i);
      e.display();
      if (e.alive() == false) {
        myExplosions.remove(i);
      }
    }
    //show smoke
    //for all particles in arraylist, move and draw
    for (int i = 0; i<particles.size(); i++) {
      
      particles.get(i).move();
      particles.get(i).display();
      if (particles.get(i).isAlive() == false)
      {
        particles.remove(i);
      }
    }
  }

  void createShot() {
    //use tragectory to get x, y velo
    shots.add(new Ball(new PVector(cannonPower*cos(radians(cannonAngle)), cannonPower*sin(radians(cannonAngle))*-1)));
    ballsCount --;
  }

  void displayCannon() {
    //write code to draw the cannon(base and barrel) to the window
    pushMatrix();
    translate(73, 525);
    rotate(radians(cannonAngle*-1));
    image(barrel, 0, 0);
    popMatrix();
    image(base, 73, 525);
  }

  void increaseAngle(Boolean increase) {
    if (increase && cannonAngle < 90) cannonAngle +=2;
    else if (increase == false && cannonAngle > 0) cannonAngle --;
  }

  void increasePower(Boolean increase) {
    if (increase && cannonPower <17) cannonPower ++;
    else if (increase == false &&cannonPower>4) cannonPower--;
  }

  //draw power rectangle based on current power
  void displayPower() {
    fill(0);
    rect(0, 40, 20*cannonPower, 55);
  }

  //place target at a random location
  void displayTarget() {
    //if collides, explodes and refresh target position

    if (ballCollidesTarget()) {

      collidesCount++;
      targetCount--;
      targetX = random(150, 1050);
      targetY = random(120, 500);
    } else {
      image(target, targetX, targetY);
    }
  }

  Boolean ballCollidesTarget() {
    //for all balls in arraylists
    for (int i = 0; i<shots.size(); i++) {
      Ball b = shots.get(i);
      //if collide with target
      if (dist(targetX, targetY, b.pos.x, b.pos.y)<30) {
        shots.remove(i);
        //explode
        myExplosions.add(new Explosion(targetX, targetY));
        
        return true;
      }
    }

    //if no ball collides with target
    return false;
  }

  void displayBallsNum() {
    if (ballsCount == 1) image(shots1, 534, 40);
    else if (ballsCount == 2) image(shots2, 534, 40);
    else if (ballsCount == 3) image(shots3, 534, 40);
    else if (ballsCount == 4) image(shots4, 534, 40);
    else if (ballsCount == 5) image(shots5, 534, 40);
    else if (ballsCount == 6) image(shots6, 534, 40);
    else if (ballsCount == 7) image(shots7, 534, 40);
    else if (ballsCount == 8) image(shots8, 534, 40);
    else if (ballsCount == 9) image(shots9, 534, 40);
    else if (ballsCount == 10) image(shots10, 534, 40);
    else if (ballsCount == 11) image(shots11, 534, 40);
    else if (ballsCount == 12) image(shots12, 534, 40);
    else if (ballsCount == 13) image(shots13, 534, 40);
    else if (ballsCount == 14) image(shots14, 534, 40);

    else if (ballsCount == 15) image(shots15, 534, 40);
    else if (ballsCount == 16) image(shots16, 534, 40);
    else if (ballsCount == 17) image(shots17, 534, 40);
    else if (ballsCount == 18) image(shots18, 534, 40);
    else if (ballsCount == 19) image(shots19, 534, 40);
    else if (ballsCount == 20) image(shots20, 534, 40);
  }

  void displayTargetsNum() {
    //display the number of targets left
    if (targetCount == 1) image(target1, 900, 40);
    else if (targetCount == 2) image(target2, 900, 40);
    else if (targetCount == 3) image(target3, 900, 40);
    else if (targetCount == 4) image(target4, 900, 40);
    else if (targetCount == 5) image(target5, 900, 40);
    else if (targetCount == 6) image(target6, 900, 40);
    else if (targetCount == 7) image(target7, 900, 40);
    else if (targetCount == 8) image(target8, 900, 40);
    else if (targetCount == 9) image(target9, 900, 40);
    else if (targetCount == 10) image(target10, 900, 40);
    else if (targetCount == 11) image(target11, 900, 40);
    else if (targetCount == 12) image(target12, 900, 40);
    else if (targetCount == 13) image(target13, 900, 40);
    else if (targetCount == 14) image(target14, 900, 40);
    else if (targetCount == 15) image(target15, 900, 40);
    else if (targetCount == 16) image(target16, 900, 40);
    else if (targetCount == 17) image(target17, 900, 40);
    else if (targetCount == 18) image(target18, 900, 40);
    else if (targetCount == 19) image(target19, 900, 40);
    else if (targetCount == 20) image(target20, 900, 40);
  }

  void displayResult() {
    //win or not
    String level = "N/A";
    textFont(f, 60);
    fill(50);
    if (collidesCount>=5) {
      text("You win!", 334, 200);
      text("Your accuracy: "+ collidesCount + " / 20", 234, 300);
      if (collidesCount>16)  level = "A";
      else if (collidesCount>12)  level = "B";
      else if (collidesCount>8)  level = "C";
      else level = "D";
      text("You are at: "+level, 250, 400);
      textFont(f, 30);
      text("press enter to try again", 300, 500);
    } else {
      text("Better luck next time!", 234, 200);
      text("Your accuracy: "+ collidesCount + " / 20", 234, 300);
      //set levels
      if (collidesCount>2)level = "E";
      else level = "F";
      text("You are at: "+level, 250, 400);
      textFont(f, 30);
      text("press enter to try again", 300, 500);
    }
  }



  void loadImages() {
    backImage = loadImage("background.png");
    base = loadImage("base.png");
    barrel = loadImage("barrel.png");
    target = loadImage("target.png");



    //shots images
    shots1 = loadImage("shots1.png");
    shots2 = loadImage("shots2.png");
    shots3 = loadImage("shots3.png");
    shots4 = loadImage("shots4.png");
    shots5 = loadImage("shots5.png");
    shots6 = loadImage("shots6.png");
    shots7 = loadImage("shots7.png");
    shots8 = loadImage("shots8.png");
    shots9 = loadImage("shots9.png");
    shots10 = loadImage("shots10.png");
    shots11= loadImage("shots11.png");

    shots12 = loadImage("shots12.png");
    shots13 = loadImage("shots13.png");
    shots14 = loadImage("shots14.png");
    shots15 = loadImage("shots15.png");
    shots16 = loadImage("shots16.png");
    shots17 = loadImage("shots17.png");
    shots18 = loadImage("shots18.png");
    shots19 = loadImage("shots19.png");
    shots20 = loadImage("shots20.png");

    //targets count
    target1 = loadImage("target1.png");
    target2 = loadImage("target2.png");
    target3 = loadImage("target3.png");
    target4 = loadImage("target4.png");
    target5 = loadImage("target5.png");
    target6 = loadImage("target6.png");
    target7 = loadImage("target7.png");
    target8 = loadImage("target8.png");
    target9 = loadImage("target9.png");
    target10 = loadImage("target10.png");

    target11 = loadImage("target11.png");
    target12 = loadImage("target12.png");
    target13 = loadImage("target13.png");
    target14 = loadImage("target14.png");
    target15 = loadImage("target15.png");
    target16 = loadImage("target16.png");
    target17 = loadImage("target17.png");
    target18 = loadImage("target18.png");
    target19 = loadImage("target19.png");
    target20 = loadImage("target20.png");
  }
}
