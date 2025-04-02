







void maingame () {


  background ( black);

  int i = 0 ;
  while ( i < asteriods.size()) {
    Asteriod m = asteriods.get(i);
    m.act();
    m.showBody();

    i++;
  }
  
  player1.show();
  player1.act(); 
}

void maingameClicks() {
}
