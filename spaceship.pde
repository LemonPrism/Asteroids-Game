class Spaceship {

  PVector loc;
  PVector vel;
  PVector dir;
  float maxspeed = 5;

  Spaceship () {
    loc = new PVector ( width/2, height/2);
    vel = new PVector ( 0, 0);
    dir  = new PVector ( 1, 0);
  }


  void show () {
    pushMatrix();
    translate( loc.x, loc.y);
    rotate(dir.heading());
    drawShip();

    popMatrix();
  }

  void drawShip() {
    fill( black);
    stroke( white);
    triangle ( -10, -10, -10, 10, 30, 0 );
    circle ( 15, 0, 5);
  }

  void act() {

    move ();
    shoot ();
    checkForCollisions();
    checkForBoundary();
  }




  void move() {




    loc.add (vel);


    println( vel);

float i = 3 ; 

    if (vel.mag() > maxspeed|| vel.mag() < -5) {
      vel.setMag(maxspeed);
    }

    if (upkey) {

      vel.add(dir);
    } else {
      vel.setMag(i);
      
    }

    if (leftkey) dir.rotate (-radians(3));
    if (rightkey) dir.rotate (radians(3));
    
    
    
  }


  void shoot() {
  }
  void checkForCollisions() {
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
