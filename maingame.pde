







void maingame () {


  background ( black);

  int i = 0 ;
  while ( i < asteriods.size()) {
    Asteriod m = asteriods.get(i);
    m.act();
    m.showBody();

    i++;
  }
}

void maingameClicks() {
}
