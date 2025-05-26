class UFO extends GameObject {
  PVector dir;
  int lives = 3;
  int cooldown = 0;
  int respawnTimer = 0;
  boolean isDead = false;

  UFO() {
    super(random(width), random(height), 0, 0, 5);
    dir = PVector.random2D().mult(0.5);
  }

  void act() {
    if (isDead) {
      respawnTimer--;
      if (respawnTimer <= 0) {
        loc = new PVector(random(width), random(height));
        dir = PVector.random2D().mult(0.5);
        vel = new PVector(0, 0);
        lives = 3;
        isDead = false;
        println("UFO respawned!");
      }
      return;
    }

    if (cooldown > 0) cooldown--;
    else {
      shoot();
      cooldown = 100;
    }

    if (frameCount % 60 == 0) changeDir();

    move();
    wraparound();
    checkforCollisions();
  }

  void show() {
    if (!isDead) {
      pushMatrix();
      translate(loc.x, loc.y);
      rotate(dir.heading());
      drawUFO();
      popMatrix();
    }
  }

  void drawUFO() {
    imageMode(CENTER);
    Tief.resize(200, 200);
    image(Tief, 0, 0, 70, 70);
  }

  void move() {
    PVector avoid = avoidAsteroids();
    vel.add(dir);
    vel.add(avoid);
    vel.limit(3);
    loc.add(vel);
  }

  void changeDir() {
    float angle = random(TWO_PI);
    dir = new PVector(cos(angle), sin(angle));
    dir.mult(0.5);
  }

  void shoot() {
    Bullet ufobullet = new Bullet(this);
    objects.add(ufobullet);
  }

  void checkforCollisions() {
    for (int i = 0; i < objects.size(); i++) {
      GameObject obj = objects.get(i);
      if (obj instanceof Bullet) {
        Bullet bullet = (Bullet) obj;
        if (!bullet.isEnemy && dist(loc.x, loc.y, bullet.loc.x, bullet.loc.y) < d / 2 + bullet.d / 2) {
          lives--;
          bullet.lives = 0;
          println("UFO" + lives);
          if (lives <= 0 && !isDead) {
            isDead = true;
            respawnTimer = 180;
            println("UFO destroyed");
          }
        }
      }
    }
  }

  PVector avoidAsteroids() {
    PVector push = new PVector();
    for (int i = 0; i < objects.size(); i++) {
      GameObject o = objects.get(i);
      if (o instanceof Asteroid) {
        float d = PVector.dist(loc, o.loc);
        if (d < 150) {
          PVector away = PVector.sub(loc, o.loc).normalize().mult((150 - d) / 150);
          push.add(away);
        }
      }
    }
    return push;
  }
}
