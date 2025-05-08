Star[] myStars; 
int numstars;


void menu () {
  background ( black);
  
  numstars=100;
  myStars = new Star[numstars];
  
    int i = 0 ;
  while ( i < numstars) {

    myStars[i]= new Star();
    i++;
  }
  textSize(100);
fill (yellow);
  text ("ASTEROID GAME", width/2, height/4);
  
  
  

  textSize ( 20); 
  text( "Click anywhere to begin", width/2, height/2+50); 

 int j = 0 ;
  while ( j < numstars) {

    myStars[j].show1();
    myStars[j].act1();
    myStars[j].show2();
    myStars[j].act2();
    j++;
  }

}

void menuClicks() {
  
    mode =OPTIONS;
    
    
  
}
