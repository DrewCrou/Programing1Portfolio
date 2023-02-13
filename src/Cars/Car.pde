class Car {
  color c;
  float xpos, ypos, xspeed;
  boolean left;

  Car() {
    c = color(random(255), random(255), random(255));
    xpos = random(width);
    ypos = random(height);
    xspeed = 1;
    if(int(random(2)) == 0) {
      left = true;
    } else{
      left = false;
    }
  }

  void display() {
    rectMode(CENTER);
    fill(c);
    stroke(0);
    strokeWeight(1);
    rect(xpos, ypos, 20, 10);
    fill(0);
    rect(xpos-7, ypos-7, 5, 3);
    rect(xpos+7, ypos-7, 5, 3);
    rect(xpos-7, ypos+7, 5, 3);
    rect(xpos+7, ypos+7, 5, 3);
    fill(0);
    rect(xpos, ypos, 5, 10);
    stroke(255, 255, 0);
    strokeWeight(3);
    if(left == false) {
    line(xpos + 10, ypos - 5, xpos + 17, ypos - 10);
    line(xpos + 10, ypos + 5, xpos + 17, ypos + 10);
    } else {
      line(xpos - 10, ypos - 5, xpos - 17, ypos - 10);
      line(xpos - 10, ypos + 5, xpos - 17, ypos + 10);
    }
  }

  void drive() {
    if(left == true) {
      xpos -= xspeed;
    } else {
      xpos += xspeed;
    }
    if (xpos > width) {
      xpos = 0;
    }
    if (xpos < 0) {
      xpos = width;
    }
  }
}
