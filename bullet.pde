class Bullet extends GameObject {



  int timer;

  Bullet() {

    super ( player1.loc.copy(), player1.dir.copy());

    vel.setMag (10);
    timer = 60;
  }


  void show() {
    fill( black);
    stroke( white);
    circle ( loc.x, loc.y, 5);
  }


  void act () {

    loc.add(vel);
    checkForBoundary();
    timer--;
    if (timer ==0 ) lives = 0 ;
  }

  void checkForBoundary() {
    if (loc.x >1050) {
      loc.x = -50;
    }
    if (loc.x <-50) {
      loc.x = 1050;
    }
    if (loc.y >600) {
      loc.y = -50;
    }
    if (loc.y <-50) {
      loc.y = 600;
    }
  }
}
