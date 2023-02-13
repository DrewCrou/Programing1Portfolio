class Button {
  //Member Variables
  int x, y, w, h;
  char val;
  color c1, c2;
  boolean on;

  //Constructor
  Button(int x, int y, int w, int h, char val, color c1, color c2) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.val = val;
    this.c1 = c1;
    this.c2 = c2;
    on = false;
  }

  //Member Methods
  void display() {
    rectMode(CENTER);
    if (on == true) {
      fill(c2);
    } else {
      fill(c1);
    }
    textSize(20);
    rect(x, y, w, h, 8);
    fill(0);
    textAlign(CENTER);
    if (val == 'S') {
      text("x²", x, y);
    } else   if (val == 'C') {
      text("AC", x, y);
    } else   if (val == 'e') {
      text("EE", x, y);
    } else {
      text(val, x, y);
    }
  }

  void hover(int mx, int my) {
    on = (mx > x - w/2 && mx < x + w/2 && my > y - h/2 && my < y + h/2);
  }
}
