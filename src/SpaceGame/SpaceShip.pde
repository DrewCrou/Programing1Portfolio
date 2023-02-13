class SpaceShip {
  int x, y, w, ammo, turretCount, health;

  SpaceShip() {
    x = 0;
    y = 0;
    w = 100;
    ammo = 500;
    turretCount = 2;
    health = 100;
  }

  void display(int tempx, int tempy) {
    x = tempx;
    y = tempy;
    fill(140);
    noStroke();
    triangle(x, y - 50, x + 20, y + 30, x - 20, y + 30);
    triangle(x, y - 10, x + 50, y + 30, x - 50, y + 30);
    fill(140);
    ellipse(x - 30, y + 22, 15, 35);
    ellipse(x + 30, y + 22, 15, 35);
    fill(0);
    triangle(x, y - 40, x + 5, y - 20, x - 5, y - 20);
    fill(140);
    rect(x, y + 30, 10, 20);
    triangle(x - 5, y + 33, x - 15, y + 43, x - 5, y + 43);
    triangle(x + 5, y + 33, x + 15, y + 43, x + 5, y + 43);
    stroke(100, 0, 0);
    strokeWeight(3);
    line(x - 31, y + 5, x - 31, y - 10);
    line(x + 30, y + 5, x + 30, y - 10);
  }

  void move() {
  }

  boolean fire() {
    if (ammo > 0) {
      ammo--;
      return true;
    } else {
      return false;
    }
  }

  boolean intersect(Rock rock) {
    float d = dist(x, y, rock.x, rock.y);
    if (d < 40) {
      return true;
    } else {
      return false;
    }
  }
}
