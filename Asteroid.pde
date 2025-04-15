class Asteroid extends GameObject {
  Asteroid () {

    super ( random ( 0, width), random ( 0, height), 1, 1, 3);
    lives = 3;
    vel.setMag (random (1, 3));
    vel.rotate (random (TWO_PI));
    d = lives* 30;
  }

  Asteroid(float x, float y, PVector mag, int dir, int life) {
    super ( x, y, 1, 1, life);
    vel = mag;
    life = 3;

    vel .setMag( random ( 2, 3) *dir);
    vel.rotate ( random ( TWO_PI));


      d = lives*30;
  }

  //Asteroids (PVector lx, PVector ly, int lives ){

  //  super (Asteroid.loc.x, Asteroid.loc.y, 3);
  //  lives = 3;


  //}


  void show() {
    fill ( black);
    stroke ( white);
    circle ( loc.x, loc.y, d);
    line ( loc.x, loc.y, loc.x +d/2, loc.y);
  }


  void act () {

    loc.add(vel);
    checkforbounds();
    checkforCollisons();
  }


  void checkforCollisons() {
    int i = 0 ;
    while ( i < objects.size()) {
      GameObject obj= objects.get(i);
      if (obj instanceof Bullet) {
        if ( dist ( loc.x, loc.y, obj.loc.x, obj.loc.y)< d/2  + obj.d/2) {
          objects.add( new Asteroid(loc.x, loc.y,vel,30, 3));
          //objects.add ( new Asteroid(loc,lives));
          lives = 0 ;
          obj.lives = 0;
        }
      }
      i ++;
    }
  }

  void checkforbounds() {

    if (loc.x >1100) {
      loc.x = -100;
    }
    if (loc.x <-100) {
      loc.x = 1100;
    }
    if (loc.y >700) {
      loc.y = -100;
    }
    if (loc.y <-100) {
      loc.y = 700;
    }
  }
}
