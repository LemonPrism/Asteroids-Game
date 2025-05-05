
boolean gifFinish = false;
int gifStart = 0;
float gifTime =8250;

void gameover() {
  background(black);

  //if (gifFinish==false) {
  //  losegif.show();


  //  if (gifStart== 0) {
  //    gifStart = millis();
  //  }


  //  if (millis() - gifStart >= gifTime) {
  //    gifFinish = true;

  //  }
  //}
  //if ( gifFinish ==true){

  textSize ( 50);
  fill ( 188, 36, 36);
  text ( "Mission Failed", 500, 250);

  //}


  textSize(20);
  fill ( 255);
  text ("Click anywhere to reset", width/2, height /2 + 50);
}







void gameoverClicks() {
  gameReset();
}

void gameReset() {
  for (int i = objects.size() - 1; i >= 0; i--) {
    GameObject obj = objects.get(i);
    if (obj instanceof Bullet || obj instanceof Asteroid) {
      objects.remove(i);
    }
  }

  player1.loc = new PVector(width / 2, height / 2);
  player1.vel.set(0, 0);
  player1.dir = new PVector(1, 0);
  player1.lives = 5;
  player1.hitCooldown = 120;
  player1.currentWeapon = cannon;


  cannonBullets = 500;
  laserBullets = 100;
  rocketBullets = 1;


  for (int i = 0; i < numberOfAsteriods; i++) {
    objects.add(new Asteroid());
  }

  mode = MENU;
}
