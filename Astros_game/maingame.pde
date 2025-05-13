
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
 
  if ( mouseX > 940 && mouseX < 960 && mouseY > 40 && mouseY < 60) {
    stroke ( black);
  fill ( white);
  } else {
  stroke ( white);
  fill ( black);
  }

 strokeWeight ( 2);
  circle ( 950, 50, 20);
  line ( 948, 46, 948, 53);
  line ( 952, 46, 952, 53);
  
  
}

void maingameClicks() {

  if ( mouseX > 940 && mouseX < 960 && mouseY > 40 && mouseY < 60) {
    mode = PAUSE;
  }
}
