
boolean gifFinish = false;
int gifStart = 0;
float gifTime =8250; 

  void gameover() {
    background(black);

    if (gifFinish==false) {
      losegif.show();

      
      if (gifStart== 0) {
        gifStart = millis(); 
      }

 
      if (millis() - gifStart >= gifTime) {
        gifFinish = true;
        
      } 
    }
    if ( gifFinish ==true){
      
      textSize ( 50);
        fill ( 188, 36, 36);
        text ( "Mission Failed", 500, 250);
      
    }
  }







void gameoverClicks() {
}
