
void maingame () {


  background ( black);



  int i = 0 ;
  while ( i < objects.size()) {
    GameObject currentObject = objects.get(i);
    currentObject.act();
    currentObject.show();
    if ( currentObject.lives==0)
      objects.remove(i);
    else i++;
  }
  strokeWeight ( 5); 
  stroke ( white); 
  circle ( 900, 100, 20); 

  

}

void maingameClicks() {

}
