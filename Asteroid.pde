class Asteroid extends GameObject {

  PImage Asteroids;

  Asteroid () {

    super ( random ( 0, width), random ( 0, height), 1, 1, 3);
    lives = 3;
    vel.setMag (random (1, 3));
    vel.rotate (random (TWO_PI));
    d = lives* 30;
    Asteroids = loadImage ("Asteroids.png");
  }

  Asteroid(float x, float y, PVector mag, float dir, int life) {
    super ( x, y, 1, 1, life);

    lives = life;

    life = 3;
    loc.x = x+random( -50, 50);
    loc.y = y+random ( -50, 50);

    //vel .setMag( random ( 1, 2) *dir);
    vel.rotate ( random ( TWO_PI));
    dir = random ( 0, 360);
    d = lives*20;
    println( lives);
    Asteroids = loadImage ("Asteroids.png");
  }

  void show() {
    fill ( black);
    stroke ( white);
    image( Asteroids, loc.x, loc.y, d, d );
    //circle ( loc.x, loc.y, d);
    //line ( loc.x, loc.y, loc.x +d/2,loc.y );
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
          lives = lives-1;
          if ( lives > 0 ) {

            objects.add( new Asteroid(loc.x, loc.y, vel, 30, lives));
            objects.add( new Asteroid(loc.x, loc.y, vel, 30, lives));
          } else {
            lives = 0;
          }

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
