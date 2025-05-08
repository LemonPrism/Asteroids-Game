




void options() {
  
  //float r = red(starship.pixels[loc]); 
  //float g = green(img.pixels [loc]); 
  //float b = blue ( img.pixels[Loc]);
  background(black);
  fill ( yellow);
  textSize (50);
  text ( "Choose your fighter", 500, 200);

  fill ( black);
  
 
  tactiles( 150, 350, 100, 100);
  square ( 200, 400, 100);
  starship.resize ( 100, 100);
  image (starship, 150, 360);
  tactiles( 350, 350, 100, 100);


  square ( 400, 400, 100);
  filter ( INVERT);
  image ( starship, 350, 360);

  filter (INVERT);
  
  
 
  tactiles( 550, 350, 100, 100);
  square ( 600, 400, 100);
  image ( starship, 550, 360);

  

  
  
  
  
  
  
  
  
  
  
  
  
  tactiles( 750, 350, 100, 100);
  square ( 800, 400, 100);
}



void optionsClicks() {
  
  
  if ( mouseX>150 && mouseX < 250 && mouseY > 350 && mouseY < 450){
    ship = 1; 
    mode = MAINGAME; 
    
  }
   if ( mouseX>350 && mouseX < 450 && mouseY > 350 && mouseY < 450){
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
