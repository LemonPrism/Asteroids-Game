void pause() {
  background ( 0, 0, 0, 25);
  fill ( yellow);
  textSize ( 100);
  text ( "GAME PAUSED", 500, 200);


  //textSize ( 20);
  //text( "Click anywhere to return", width/2, height/2+50);

  if ( mouseX> 300 && mouseX < 400 && mouseY > 370&& mouseY < 420) {
    fill(yellow);
    stroke ( white);
  } else {
    fill( white);
    stroke (black);
    
  }

  textSize( 20);
  text ("Reset", 350, 400);








  if ( mouseX> 600 && mouseX < 700 && mouseY > 370&& mouseY < 420) {
    fill(yellow);
    stroke ( white);
  } else {
    fill( white);
    stroke (black);
    
  }
  textSize( 20);
  text ("Resume", 650, 400);
}
void pauseClicks() {

  if ( mouseX> 300 && mouseX < 400 && mouseY > 370&& mouseY < 430) {
    mode = MENU;
    gameReset();
  }
  
    if ( mouseX> 600 && mouseX < 700 && mouseY > 370&& mouseY < 430) {
    mode = MAINGAME;
  
  }
}
