class PowerUp {
  int x, y, speed, diam;
  char type;

  PowerUp() {
    x = int(random(width));
    y = -50;
    speed = int(random(2, 4));
    diam = 60;
    if (int(random(2)) == 0) {
      type = 'H';
    } else {
      type = 'A';
    }
  }

  void display() {
    fill(0, 255, 0);
    ellipse(x, y, diam, diam);
    fill(255);
    text(type, x, y);
  }

  void move() {
    y = y + speed;
  }

  boolean reachedBottom() {
    if (y>height+100) {
      return true;
    } else {
      return false;
    }
  }
  
   boolean intersect(SpaceShip ship) {
    float d = dist(x, y, ship.x, ship.y);
    if (d < 40) {
      return true;
    } else {
      return false;
    }
  }
}
