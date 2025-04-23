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
    fill(black);
    stroke(white);
    pushMatrix();
    rotate(radians(90));
    imageMode(CENTER);


    if (upkey) {
      noStroke();
      fill(255, 100, 0);
      triangle(-10, 10, 0, 30 + random(10), 10, 10);
    }

    image(starship, 0, 0, 70, 70);
    fill ( white);
    textSize(10); 
    text ("laser:", -10 , 50);
    textSize( 30);
    text (bulletCount, 50, 50);
    popMatrix();
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
    if (spacekey && bulletCount > minBullets) {
      objects.add(new Bullet());
      bulletCount--;
      println( bulletCount);
    }
  }
  void checkForCollisions() {
  }
}
