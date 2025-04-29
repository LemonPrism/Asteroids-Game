
final float cannon = 1;
final float laser = 2;
final float rocket = 3;

class Bullet extends GameObject {
  float _type;
  int timer;

  Bullet(Spaceship shooter, float _type) {
    super(shooter.loc.copy(), shooter.dir.copy(), 1);
    this._type = _type;
    vel.setMag(10);

    if (_type == cannon) {
      timer = 30;
      d = 1;
    } else if (_type == laser) {
      timer = 20;
      d = 6;
    } else if (_type == rocket) {
      timer = 60;
      d = 20;
    }
  }

  void show() {
    if (_type == cannon) {
      fill(black);
      stroke ( random ( 0, 255));
      circle(loc.x, loc.y, d);
    } else if (_type == laser) {
      stroke(0, 255, 255);
      strokeWeight(3);
      line(loc.x, loc.y, loc.x - vel.x * 2, loc.y - vel.y * 2);
    } else if (_type == rocket) {
      pushMatrix();
      translate(loc.x, loc.y);
      rotate(vel.heading());
      fill(255);
      stroke(255);
      rectMode(CENTER);
      ellipse ( 10, 0, 20, 10);
      rect(0, 0, 20, 10);
      fill(255, 0, 0);
      triangle(-10, -5, -10, 5, -20, 0);

      popMatrix();
    }
  }

  void act() {
    loc.add(vel);
    wraparound();
    timer--;
    if (timer <= 0) {
      lives = 0;
    }
  }
}
