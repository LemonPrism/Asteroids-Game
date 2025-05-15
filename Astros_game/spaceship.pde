class Spaceship extends GameObject {
  float currentWeapon = cannon;


  PVector dir;
  float maxspeed = 5;
  int lives = 3;
  int hitCooldown = 0;
  final float  maxTeleportCooldown = 300;
  float teleportCooldown = 0;
  boolean canTeleport = true;

  Spaceship () {
    super(width/2, height/2, 0, 0, 5);
    dir  = new PVector ( 1, 0);


    lives = 5;
    ship =1; 
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




    if ( ship==1) {
      image(starship, 0, 0, 70, 70);
    } else if ( ship==2) {
      filter(INVERT);
      image(starship, 0, 0, 70, 70);
      filter(INVERT);
    }
    popMatrix();
  }


  void act() {

    move ();
    shoot ();
    teleport();
    if (!canTeleport) {
      teleportCooldown--;
      if (teleportCooldown <= 0) {
        canTeleport = true;
      }
    }

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

  void teleport () {
    if (tkey && canTeleport ) {

      PVector safeloc = new PVector ();
      boolean safe = false;

      while ( safe ==false ) {

        float safeX = random ( 0, width ) ;
        float safeY = random ( 0, height);
        safeloc.set(safeX, safeY);
        safe = true;





        int i = 0 ;
        while ( i< objects.size()) {

          GameObject obj = objects.get(i);
          if ( obj instanceof Asteroid) {
            float d = dist (safeloc.x, safeloc.y, obj.loc.x, obj.loc.y);
            if ( d< 200) {
              safe = false;
              break;
            }
          }
          i++;
        }
      }
      canTeleport = false;
      loc.set(safeloc);
      teleportCooldown = maxTeleportCooldown;
    }
  }
}
