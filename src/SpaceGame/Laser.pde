class Laser {
  int x, y, w, h, speed, c1, c2, c3;

  Laser(int x, int y) {
    this.x = x;
    this.y = y;
    x = 0;
    y = 0;
    w = 4;
    h = 30;
    speed = 10;
    c1 = 100;
    c2 = 0;
    c3 = 0;
  }

  void display() {
    rectMode(CENTER);
    noStroke();
    fill(c1, c2, c3);
    rect(x, y, w, h);
  }

  void move() {
    y -= speed;
  }

  boolean reachedTop() {
    if (y<-10) {
      return true;
    } else {
      return false;
    }
  }

  boolean intersect(Rock rock) {
    float d = dist(x, y, rock.x, rock.y);
    if (d < rock.diam/2) {
      return true;
    } else {
      return false;
    }
  }
}
