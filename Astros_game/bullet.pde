final float cannon = 1;
final float laser = 2;
final float rocket = 3;
final float ufo_bullet = 4;

class Bullet extends GameObject {
  float _type;
  int timer;
  boolean isEnemy;

  Bullet(Spaceship ship, float _type) {
    super(ship.loc.copy(), ship.dir.copy(), 1);
    this._type = _type;
    isEnemy = false;

    vel.setMag(10);
    if (_type == cannon) {
      timer = 30; d = 1;
    } else if (_type == laser) {
      timer = 20; d = 6;
    } else if (_type == rocket) {
      timer = 60; d = 20;
    }
  }

  Bullet(UFO ufo) {
    super(ufo.loc.copy(), ufo.dir.copy(), 1);
    this._type = ufo_bullet;
    isEnemy = true;
    vel.setMag(1.5);
    timer = 100;
    d = 10;
  }

  void act() {
    loc.add(vel);
    wraparound();
    timer--;
    if (timer <= 0) lives = 0;
  }

  void show() {
    if (_type == cannon) {
      fill(black); 
      stroke ( random ( 255)); 
      ellipse(loc.x, loc.y, d, d);
    } else if (_type == laser) {
      stroke(#8A00C4);
      strokeWeight(2);
      line(loc.x, loc.y, loc.x - vel.x * 2, loc.y - vel.y * 2);
    } else if (_type == rocket) {
      pushMatrix();
      translate(loc.x, loc.y);
      rotate(vel.heading());
      fill(255);
      rect(0, 0, 20, 10);
      fill(255, 0, 0);
      triangle(-10, -5, -10, 5, -20, 0);
      popMatrix();
    } else if (_type == ufo_bullet) {
      fill(0, 255, 255);
      ellipse(loc.x, loc.y, d, d);
    }
  }
}
