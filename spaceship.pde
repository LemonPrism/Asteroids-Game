class Spaceship extends GameObject {

  PImage starship;
  PVector dir;
  float maxspeed = 5;

  Spaceship () {
    super(width/2, height/2, 0, 0, 1);
    dir  = new PVector ( 1, 0);
    starship = loadImage ("starship.png");
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
    pushMatrix();
    rotate ( radians( 90));
    image ( starship, -10, -10, 70, 70);
    popMatrix();
    //triangle ( -10, -10, -10, 10, 30, 0 );
    //circle ( 15, 0, 5);
  }

  void act() {

    move ();
    shoot ();
    checkForCollisions();
    wraparound();
  }




  void move() {




    loc.add (vel);


    if (upkey) {

      vel.add(dir);
    }

    if (leftkey) dir.rotate (-radians(3));
    if (rightkey) dir.rotate (radians(3));
    vel.limit ( 3);
  }


  void shoot() {
    if (spacekey)  objects.add( new Bullet());
  }
  void checkForCollisions() {
  }
}
