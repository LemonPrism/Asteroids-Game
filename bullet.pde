
final float cannon = 1; 
final float laser = 2; 

class Bullet extends GameObject {
  float _type;
  int timer;

  Bullet(Spaceship shooter, float _type) {
    super(shooter.loc.copy(), shooter.dir.copy(), _type);
    vel.setMag(10);
    this._type = _type;

    if (_type == cannon) {
      timer = 30;
      d = 1;
    } else if (_type == laser) {
      timer = 15;
      d = 10;
    }
  }

  void show() {
    if (_type == cannon) {
      fill(black);
      strokeWeight ( 1);
      stroke(random(0 , 255));  
      circle(loc.x, loc.y, d);
    } else if (_type == laser) {
      stroke(0, 255, 255); 
      strokeWeight(2);
      line(loc.x, loc.y, loc.x - vel.x * 2, loc.y - vel.y * 2);
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
