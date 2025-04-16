class Spaceship extends GameObject {


  PVector dir;
  float maxspeed = 5;

  Spaceship () {
    super(width/2, height/2, 0, 0, 1);
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
    wraparound();
  }




  void move() {




    loc.add (vel);


    println( vel);

    //    float i = 3 ;

    //    if (vel.mag() > maxspeed|| vel.mag() < -5) {
    //      vel.setMag(maxspeed);
    //    }

    if (upkey)  vel.add(dir);
    //} else {
    //  vel.setMag(i);
    //}

    if (leftkey) dir.rotate (-radians(3));
    if (rightkey) dir.rotate (radians(3));
    vel.limit ( 5);
  }


  void shoot() {
    if (spacekey)  objects.add( new Bullet());
  }
  void checkForCollisions() {
  }
}
