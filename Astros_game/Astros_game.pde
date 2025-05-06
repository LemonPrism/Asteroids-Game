import java.util.ArrayList;


color white = #ffffff;
color black = #000000;
color nblue = #04d9ff;
color npurple = #8A00C4;
color yellow = #FFE81F;

int numberOfAsteriods = 10;



// Gifs
boolean gifinish = false;

Gif losegif;

int mode;
final int MENU = 0;
final int MAINGAME = 1;
final int GAMEOVER= 2;
final int YOUWON = 3;
final int PAUSE =4;



PVector gravity;
PVector loc;
PVector vel;
float d;

int cannonBullets = 500;
int laserBullets = 100;
int rocketBullets = 1;

boolean upkey, downkey, leftkey, rightkey, spacekey;

//List of Bullets
ArrayList <GameObject> objects;

PFont font;
 
//Game Objects
Spaceship player1;


void setup() {
  size ( 1000, 600);
  textAlign(CENTER, CENTER);

  font = createFont("Courier New", 20);

  textFont(font);
  losegif = new Gif ("lose/frame_", "_delay-0.1s.gif", 73, 7, 500, 300, width, height);


  mode = MENU;

  objects = new ArrayList ();

  player1 = new Spaceship();
  textAlign ( CENTER, CENTER);
  rectMode ( CENTER);
  objects.add(player1);

  objects.add( new Asteroid());
  objects.add( new Asteroid());
  objects.add( new Asteroid());
  objects.add( new Asteroid());
}


void draw () {


  if (mode==MENU) {

    menu();
  } else if ( mode ==MAINGAME) {



    maingame();
  } else if ( mode == GAMEOVER) {


    gameover();
  } else if ( mode == YOUWON) {


    youwon();
  } else if (mode==PAUSE) {
    pause();
  }
}
