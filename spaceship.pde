class Spaceship extends GameObject {
  float currentWeapon = cannon;

  PImage starship;
  PVector dir;
  float maxspeed = 5;
  int lives = 3;
  int hitCooldown = 0;


  Spaceship () {
    super(width/2, height/2, 0, 0, 5);
    dir  = new PVector ( 1, 0);
    starship = loadImage ("starship.png");

    lives = 5;
  }


  void show () {
    pushMatrix();
    translate( loc.x, loc.y);
    rotate(dir.heading());
    
     if (hitCooldown > 0) {
    noFill();
    stroke(0, 255, 255, 150); 
    strokeWeight(4);
    ellipse(0, 0, d + 100, d + 100); 
  }
    drawShip();

    popMatrix();
  }


  void drawShip() {
    fill(black);
    stroke(white);
    pushMatrix();
    rotate(radians(90));
    imageMode(CENTER);


    if (upkey) {
      noStroke();
      fill(255, 100, 0);
      triangle(-10, 10, 0, 30 + random(10), 10, 10);
    }


    fill ( white);
    textSize(12);
    fill(white);
    String weaponName;
    int ammoCount = cannonBullets;
    weaponName = "Cannon";
    if (currentWeapon == cannon) {
      ammoCount= cannonBullets;
      weaponName=  "Cannon";
    } else if (currentWeapon ==laser) {
      ammoCount= laserBullets;
      weaponName= "Laser";
    } else if (currentWeapon ==rocket) {
      ammoCount= rocketBullets;
      weaponName= "Rocket";
    }
    text(weaponName+":"+ ammoCount, 0, 50);


    image(starship, 0, 0, 70, 70);
    popMatrix();
  }


  void act() {

    move ();
    shoot ();
    checkForCollisions();
    wraparound();
    if (hitCooldown > 0) {
      hitCooldown--;
    }
  }




  void move() {




    loc.add (vel);


    if (upkey) {

      vel.add(dir);
    }

    if (leftkey) dir.rotate (-radians(3));
    if (rightkey) dir.rotate (radians(3));
    vel.limit ( 3);
  }

  void shoot() {
    if ( spacekey) {
      if (currentWeapon == cannon && cannonBullets > 0) {
        objects.add(new Bullet(this, cannon));
        cannonBullets--;
      } else if (currentWeapon == laser && laserBullets > 0) {
        objects.add(new Bullet(this, laser));
        laserBullets--;
      } else if (currentWeapon == rocket && rocketBullets > 0) {
        objects.add(new Bullet(this, rocket));
        rocketBullets--;
      }
    }
  }
  void checkForCollisions() {
  }
}
