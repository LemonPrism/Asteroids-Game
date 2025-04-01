void menu () {

  background ( black);
  textSize(50);
  text ("ASTEROID GAME", width/2, height/4);

  fill ( white);
  rect ( width/2, 450, 200, 100);
}

void menuClicks() {
  if( mouseX > width/2 - 100 && mouseX < width/2 +100 && mouseY > 400 && mouseY < 500){
    mode = MAINGAME; 
    
    
  }
}
