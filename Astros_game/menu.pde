Star[] myStars;
int numstars = 100;
boolean stars = false;

void menu() {
  background(0); 

  
  if (!stars) {
    myStars = new Star[numstars];
    for (int i = 0; i < numstars; i++) {
      myStars[i] = new Star();
    }
    stars = true;
  }

  // Show stars
  for (int i = 0; i < numstars; i++) {
    myStars[i].show1();
    myStars[i].act1();
  }


  textAlign(CENTER);
  textSize(80);
  fill(255, 255, 0); 
  text("ASTEROID GAME", width / 2, height / 4);

  textSize(20);

  fill(255); 
  text("Click anywhere to begin", width / 2, height / 2 + 100);
}

void menuClicks() {
  mode = OPTIONS;
}
