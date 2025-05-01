void pause() {
  background ( 0 , 0 , 0 ,25); 
  fill ( white); 
  textSize ( 50); 
  text ( "GAME PAUSED" , 500 , 200); 
  
    fill ( white);
  rect ( width/2, 450, 200, 100);
  
}
void pauseClicks() {
  
      if ( mouseX > width/2 - 100 && mouseX < width/2 +100 && mouseY > 400 && mouseY < 500) {
    mode = MAINGAME;
  }
}
