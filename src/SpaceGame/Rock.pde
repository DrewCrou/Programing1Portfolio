class Rock {
  int x, y, speed, diam;
  PImage rock;

  Rock() {
    x = int(random(width));
    y = -50;
    speed = int(random(2, 8));
    diam = int(random(50, 75));
    rock = loadImage("Rock.png");
  }

  void display() {
    imageMode(CENTER);
    image(rock, x, y);
    rock.resize(diam, diam);
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

  boolean intersect(Laser laser) {
    float d = dist(x, y, laser.x, laser.y);
    if (d < 50) {
      return true;
    } else {
      return false;
    }
  }
}
