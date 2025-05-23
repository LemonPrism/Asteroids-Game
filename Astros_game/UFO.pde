class UFO extends GameObject {

  PVector dir;
  float maxspeed = 10 ;
  int lives;
  float x, y;
  int cooldown = 0;
  UFO() {

    super ( width/2, height/2, 0, 0, 5);
    x= random ( -1, 1);
    y = random ( -1, 1);

    dir = new PVector (x, y);


    lives = 3;
  }


  void show() {
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(dir.heading());
    drawUFO();
    popMatrix();
    shoot();
  }

  void act() {
    if (cooldown > 0) {
      cooldown--;
    } else {
      shoot();
      cooldown = 100;
    }

    if (frameCount % 60 == 0) {
      changeDir();
    }

    move();
    wraparound();
    checkforCollisions();
  }



  void move() {
    PVector avoid = avoidAsteroids();
    vel.add(dir);
    vel.add(avoid);
    vel.limit(3);
    loc.add(vel);
  }


  void changeDir() {
    float newX = random(-1, 1);
    float newY = random(-1, 1);
    dir = new PVector(newX, newY);
    dir.normalize();
    dir.mult(0.5);

    stroke ( white);
    strokeWeight( 10);
    line ( loc.x, loc.y+50, loc.x, loc.y);
    line ( loc.x, loc.y, loc.x-70, loc.y);
  }





  void drawUFO() {

    fill ( white);
    pushMatrix();


    imageMode(CENTER);
    Tief.resize( 200, 200 );
    image (Tief, 0, 0, 70, 70);

    popMatrix();
  }


  void shoot() {
    Bullet ufobullet = new Bullet(this);
    objects.add(ufobullet);
  }



  void checkforCollisions() {

    int i = 0;
    while (i < objects.size()) {
      GameObject obj = objects.get(i);

      if (obj instanceof Bullet) {
        Bullet bullet = (Bullet) obj;

        if (dist(loc.x, loc.y, bullet.loc.x, bullet.loc.y) < d/2 + bullet.d/2) {
          lives--;

          println("UFO" + lives);
        }
      }

      i++;
    }
  }
  PVector avoidAsteroids() {
    PVector avoid = new PVector(0, 0);
    float range = 150;

    for (int i = 0; i < objects.size(); i++) {
      GameObject obj = objects.get(i);

      if (obj instanceof Asteroid) {
        float dist = PVector.dist(loc, obj.loc);

        if (dist < range) {
          PVector back = PVector.sub(loc, obj.loc);
          back.normalize();
          back.mult(1.5 * (range - dist) / range);
          avoid.add(back);
        }
      }
    }

    return avoid;
  }
}
