



void options() {
  background(black);
  fill(yellow);
  textSize(50);
  text("Choose your fighter", 500, 200);
  imageMode(CORNER);
  fill(black);
  starship.resize ( 100, 100);

  tactiles(250, 350, 100, 100);
  square(300, 400, 100);
  pushMatrix();
  image(starship, 250, 360);
  popMatrix();

  tactiles(650, 350, 100, 100);
  square(700, 400, 100);
  pushMatrix();
  filter(INVERT);
  image(starship, 650, 360);
  filter(INVERT);
  popMatrix();
}




void optionsClicks() {


  if ( mouseX>250 && mouseX < 350 && mouseY > 350 && mouseY < 450) {
    ship = 1;
    mode = MAINGAME;
  }
  if ( mouseX>650 && mouseX < 750 && mouseY > 350 && mouseY < 450) {
    ship = 2;
    mode = MAINGAME;
  }
}


void tactiles( int x, int y, int w, int h  ) {
  if ( mouseX> x&& mouseX< x+ w && mouseY > y && mouseY < y+h ) {

    stroke ( yellow);
  } else {
    stroke ( white) ;
  }
}
