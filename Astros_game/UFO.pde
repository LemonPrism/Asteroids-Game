class UFO extends GameObject {

  PVector dir;
  float maxspeed = 10 ;
  int lives;
  float x, y;

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
  }

  void act () {



    if (frameCount % 60==0 ) {
      changeDir();
    }
    move();
    wraparound();
    checkforCollisions();
  }




  void move () {
    loc.add(vel);
    vel.limit ( 3);
    vel.add(dir);
  }

  void changeDir() {
    float newX = random(-1, 1);
    float newY = random(-1, 1);
    dir = new PVector(newX, newY);
    dir.normalize();
    dir.mult(0.5);

    stroke ( white);
    strokeWeight( 10);
    line ( loc.x+50, loc.y, loc.x+70, loc.y);
    line ( loc.x-50, loc.y, loc.x-70, loc.y);
  }





  void drawUFO() {

    fill ( white);
    pushMatrix();


    imageMode(CENTER);
    Tief.resize( 20, 20 );
    image (Tief, 0, 0, 70, 70);

    popMatrix();
  }



  void checkforCollisions() {

    int i = 0;
    while (i < objects.size()) {
      GameObject obj = objects.get(i);

      if (obj instanceof Bullet) {
        Bullet bullet = (Bullet) obj;

        if (dist(loc.x, loc.y, bullet.loc.x, bullet.loc.y) < d/2 + bullet.d/2) {
          lives--;
          println("UFO hit! Lives remaining: " + lives);
        }
      }

      i++;
    }
  }
}
