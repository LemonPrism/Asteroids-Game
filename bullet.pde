class Bullet extends GameObject {



  int timer;

  Bullet() {

    super ( player1.loc.copy(), player1.dir.copy());

    vel.setMag (10);
    timer = 60;
    d = 5; 
  }


  void show() {
    fill( black);
    stroke( white);
    circle ( loc.x, loc.y, d);
  }


  void act () {

    loc.add(vel);
    wraparound(); 
    timer--;
    if (timer ==0 ) lives = 0 ;
  }

 
}
