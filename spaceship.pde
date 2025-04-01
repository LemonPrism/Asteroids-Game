class Spaceship {

  PVector loc;
  PVector vel;
  PVector dir;


  Spaceship () {
    loc = new PVector ( width/2, height/2);
    vel = new PVector ( 0, 0);
    dir  = new PVector ( 1, 0);
  }


  void show () {
    
  }

  void act() {

    move ();
    shoot ();
    checkForCollisions();
  }

  void move() {
  }


  void shoot() {
  }
 void checkForCollisions() {
  }
}
