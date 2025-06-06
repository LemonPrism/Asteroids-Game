import java.util.ArrayList;


color white = #ffffff;
color black = #000000;
color nblue = #04d9ff;
color npurple = #8A00C4;
color yellow = #FFE81F;
color red = #FF0000;

int numberOfAsteriods = 10;



// Gifs


int mode;
final int MENU = 0;
final int MAINGAME = 1;
final int GAMEOVER= 2;
final int YOUWON = 3;
final int PAUSE =4;
final int OPTIONS = 5;


//options menu

float ship;
PImage starship;
PImage Tief;




PVector gravity;
PVector loc;
PVector vel;
float d;

int cannonBullets = 500;
int laserBullets = 100;
int rocketBullets = 1;

boolean upkey, downkey, leftkey, rightkey, spacekey, tkey;

//List of Bullets
ArrayList <GameObject> objects;

PFont font;

//Game Objects
Spaceship player1;
UFO ufo;


void setup() {
  size ( 1000, 600);
  textAlign(CENTER, CENTER);

  font = createFont("Courier New", 20);

  textFont(font);
 


  mode = MENU;

  objects = new ArrayList ();

  player1 = new Spaceship();
  textAlign ( CENTER, CENTER);
  rectMode ( CENTER);
  objects.add(player1);
  ufo= new UFO();
  objects.add( new UFO());
  objects.add( new Asteroid());
  objects.add( new Asteroid());
  objects.add( new Asteroid());
  objects.add( new Asteroid());





  // options


  //ship images
  starship = loadImage ("starship.png");
  Tief= loadImage ("Tie.png");
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
  } else if ( mode == OPTIONS) {
    options();
  }
}
