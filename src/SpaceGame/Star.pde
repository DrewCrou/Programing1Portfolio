class Star {
  int x, y, speed, diam, c1, c2, c3;

  Star() {
    x = int(random(width));
    y = int(random(height));
    speed = int(random(2, 6));
    diam = int(random(1, 6));
    c1 = 0;
    c2 = int(random(150, 255));
    c3 = int(random(150, 255));
  }

  void display() {
    fill(c1, c2, c3);
    ellipse(x, y, diam, diam);
  }

  void move() {
    if (y>height+5) {
      y = -5;
    } else {
      y += speed;
    }
  }

  boolean reachedBottom() {
    return true;
  }
}
