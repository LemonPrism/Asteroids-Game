










float Y = 600;
float Speed = 0.5;

void gameover() {
  background(0);

  for (int i = 0; i < 100; i++) {
    stroke(255);
    point(random(width), random(height));
  }




  textAlign(CENTER);


  fill(255, 221, 0);
  textSize(48);
  text("MISSION FAILED", width / 2, Y);
  textSize ( 20);

  text ( "You were weak... just like the others.", width/2, Y +100);
  text ("The Force was never with you.", width/2, Y + 120);
  text ( "Mission failed, rebel scum.", width/2, Y + 150);
  text ( "Even Jar Jar could’ve done better.", width/2, Y + 170);
  text ( "Perhaps next time... you’ll learn to aim.", width /2, Y + 190);
  textSize ( 40); 
  text("Click anywhere to reset", width / 2, Y+250);
  if (Y > 200) {
    Y -= Speed;
  }

  if ( Y < 200) {
    textSize(20);
    fill(200);
    text("Click anywhere to try again", width / 2, height - 50);
  }
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
