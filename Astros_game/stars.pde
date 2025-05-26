class Star {


  //instance variables or fields
  float x, y, vx, vy, size;
  int h , s , b;
   float x1, y1, vx1, vy1, size1;

  // constructor ; special funciton that defines how a object of this class is born
  //      defines intial values for it's fields

  Star() {
    x = random ( 0, width);
    y = random ( 0, height);
    vx= random ( -5,5);
    vy = random ( 1, 5);
    size = vy;
    h = int( random ( 0 , 255));
    s= 255;
    b = 255;
      x1 = random ( 0, width);
    y1 = random ( 0 , height);
    vx1= random ( -5,5);
    vy1 = 0;
    size1 = vy;
  }


  //behaviour functions : these define what a object does and acts


  void show1() {
    fill (white );
    square ( x, y, size);

  }
 

 
    void act1() {
    y= y+ vy;
    if ( y > height+ size ) {
      size = vy+3;
      y = mouseY;
    }
   
  }
 
 
  void show2() {
    fill (h , s , b );
    square ( x1, y1, size1);
  }
 
    void act2() {
    x1= x1+ vx1;
    if ( x1 > width+ size1 ) {
      size1 = vx1+3;
      x1 = mouseX;
    }
   
  }



}
