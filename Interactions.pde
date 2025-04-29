void keyPressed() {

  if ( keyCode == UP) upkey = true;
  if ( keyCode == DOWN) downkey = true;
  if ( keyCode == LEFT) leftkey = true;
  if ( keyCode == RIGHT) rightkey = true;
  if ( key == ' ') spacekey = true;

  if (key == '1') {
    player1.currentWeapon = cannon;
  } else if (key == '2') {
    player1.currentWeapon = laser;
  } else if ( key == '3' ) {
    player1.currentWeapon = rocket;
  }
  reload();
}


void keyReleased () {
  if ( keyCode == UP) upkey = false;
  if ( keyCode == DOWN) downkey =false;
  if ( keyCode == LEFT) leftkey = false;
  if ( keyCode == RIGHT) rightkey = false;
  if ( key == ' ') spacekey = false;
}

void reload() {
  if (key == 'r') {
    if ( cannonBullets< 500) {
      cannonBullets ++;
    }
  }
}
