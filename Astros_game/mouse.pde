void mouseReleased () {


  if (mode==MENU) {
    menuClicks();
  } else if (mode==MAINGAME) {
    maingameClicks();
  } else if ( mode== GAMEOVER) {
    gameoverClicks();
  } else if ( mode== YOUWON) {
    youwonClicks();
  } else if ( mode==PAUSE){
   pauseClicks(); 
    
  }else if ( mode ==OPTIONS){
    optionsClicks();
    
  }
}
