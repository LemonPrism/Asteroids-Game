
color white = #ffffff;
color black = #000000;
color nblue = #04d9ff;
color npurple = #8A00C4;





int mode; 
final int MENU = 0; 
final int MAINGAME = 1; 
final int GAMEOVER= 2; 
final int YOUWON = 3;
final int PAUSE =4; 










void setup(){
 size ( 1000 , 600); 
 
 mode = MENU; 
  
  
  
  
  
  
  
  
  
  
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
