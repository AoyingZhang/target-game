//Final assignment option A
//Aoying Zhang
//CS30
//

Game currentGame;
void setup() {
  size(1068, 600);
  currentGame = new Game();
}

void draw() {
  currentGame.play();
  quickInput();
}

void keyPressed() {
  if (key == ' '&& currentGame.stopGame == false) {
    //If space is pressed, create a cannonball to shoot
    
    currentGame.createShot();
  }
  //if game end, press enter to play again
  else if(keyCode == ENTER && currentGame.stopGame){
    currentGame = new Game();
  }
}

void quickInput() {
  //use for keyboard input that we want checked every frame(arrow keys)
  if (keyPressed) {
    if (keyCode == UP) {
      //increase power
      currentGame.increasePower(true);
    } else if (keyCode == DOWN) {
      //decrease power
      currentGame.increasePower(false);
    } else if (keyCode == LEFT) {
      //increase angle
      currentGame.increaseAngle(true);
    } else if (keyCode == RIGHT) {
      //decrease angle
      currentGame.increaseAngle(false);
    }
  }
}
