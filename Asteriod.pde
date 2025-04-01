class Asteriod {

  PVector loc;
  PVector vel;
  float d;




  Asteriod() {


    loc =  new PVector (random( 0, width - 100), random( 0, width+100));
    vel = new PVector (3, 0 );
    vel.rotate ( radians(random ( 0, 360)));


    d= 100;
  }

  void act () {
    move();
    bounceOffEdge();
  }

  void move() {

    loc.add(vel);
  }

  void bounceOffEdge() {

    if ( loc.x < -100 || loc.x > width+100) vel.x=-vel.x;
    if ( loc.y< -100|| loc.y > height+ 100) vel.y=-vel.y;
  }


  void showBody() {


    stroke( white);
    fill ( black);
    circle ( loc.x, loc.y, d);
  }
}
