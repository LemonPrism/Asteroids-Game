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

    vel.rotate ( random ( TWO_PI));
    dir = random ( 0, 360);
    d = lives*20;

    Asteroids = loadImage ("Asteroids.png");
  }

  void show() {
    fill ( black);
    stroke ( white);
    image( Asteroids, loc.x, loc.y, d, d );
  }


  void act () {

    loc.add(vel);
    checkforbounds();
    checkforCollisons();
  }

  void checkforCollisons() {
    for (int i = 0; i < objects.size(); i++) {
      GameObject obj = objects.get(i);

      if (obj instanceof Spaceship) {
        Spaceship ship = (Spaceship) obj;

        if (dist(loc.x, loc.y, ship.loc.x, ship.loc.y) < d + ship.d) {
          if (ship.hitCooldown == 0) {
            ship.lives--;
            ship.hitCooldown = 120;
            println(ship.lives);


            if (lives > 1) {
              objects.add(new Asteroid(loc.x, loc.y, vel, 30, lives - 1));
              objects.add(new Asteroid(loc.x, loc.y, vel, 30, lives - 1));
              objects.add(new Asteroid(loc.x, loc.y, vel, 30, lives - 1));
              objects.add(new Asteroid(loc.x, loc.y, vel, 30, lives - 1));
            }
            lives = 0;

            if (ship.lives < 1) {
              mode = GAMEOVER;
            }
            objects.add(new Particle(loc.x, loc.y, 1, 0));
          objects.add(new Particle(loc.x, loc.y, -1, 0));
          objects.add(new Particle(loc.x, loc.y, 0, 1));
          objects.add(new Particle(loc.x, loc.y, 0, -1));
          objects.add(new Particle(loc.x, loc.y, 1, 1));
          objects.add(new Particle(loc.x, loc.y, -1, -1));
          objects.add(new Particle(loc.x, loc.y, 1.5, 0));
          objects.add(new Particle(loc.x, loc.y, -1.5, 0));
          objects.add(new Particle(loc.x, loc.y, 0, 1.5));
          objects.add(new Particle(loc.x, loc.y, 0, -1.5));
          objects.add(new Particle(loc.x, loc.y, 1, 1.5));
          objects.add(new Particle(loc.x, loc.y, -1, -1.5));
          }
        }
      }

      if (obj instanceof Bullet) {
        Bullet bullet = (Bullet) obj;

        if (dist(loc.x, loc.y, bullet.loc.x, bullet.loc.y) < d/2 + bullet.d/2) {
          if (bullet._type == rocket) {
            lives = 0;
            bullet.lives = 0;
          } else {
            lives--;
            if (lives > 0) {

              objects.add(new Asteroid(loc.x, loc.y, vel, 30, lives));
              objects.add(new Asteroid(loc.x, loc.y, vel, 30, lives));
              objects.add(new Asteroid(loc.x, loc.y, vel, 30, lives));
              objects.add(new Asteroid(loc.x, loc.y, vel, 30, lives));
            } else {
              lives = 0;
            }
            bullet.lives = 0;
          }


          objects.add(new Particle(loc.x, loc.y, 1, 0));
          objects.add(new Particle(loc.x, loc.y, -1, 0));
          objects.add(new Particle(loc.x, loc.y, 0, 1));
          objects.add(new Particle(loc.x, loc.y, 0, -1));
          objects.add(new Particle(loc.x, loc.y, 1, 1));
          objects.add(new Particle(loc.x, loc.y, -1, -1));
          objects.add(new Particle(loc.x, loc.y, 1.5, 0));
          objects.add(new Particle(loc.x, loc.y, -1.5, 0));
          objects.add(new Particle(loc.x, loc.y, 0, 1.5));
          objects.add(new Particle(loc.x, loc.y, 0, -1.5));
          objects.add(new Particle(loc.x, loc.y, 1, 1.5));
          objects.add(new Particle(loc.x, loc.y, -1, -1.5));
        }
      }
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
