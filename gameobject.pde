class GameObject {
  PVector loc;
  PVector vel;
  int lives;
  float d;
  int spacelives;

  GameObject(float lx, float ly, float vx, float vy, float life) {
    loc = new PVector ( lx, ly );
    vel = new PVector ( vx, vy);
    
    lives =3; 
  }

  GameObject ( PVector l, PVector v, float _type) {
    loc = l;
    vel = v;
    lives = 1;
  }
  GameObject ( PVector l, PVector v, int lv) {
    loc = l;
    vel = v;
    lives = lv;
  }
  void act() {
  }
  void show () {
  }

  void wraparound() {
    if (loc.x >1050) {
      loc.x = -50;
    }
    if (loc.x <-50) {
      loc.x = 1050;
    }
    if (loc.y >600) {
      loc.y = -50;
    }
    if (loc.y <-50) {
      loc.y = 600;
    }
  }
}
