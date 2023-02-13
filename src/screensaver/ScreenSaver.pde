// Drew Crouch | October 10, 2022 | ScreenSaver
float xpos,ypos,strokeW,pointCount;
void setup() {
  size(displayWidth, displayHeight);
  xpos = random(height);
  ypos = random(height);
}

void draw() {
  strokeW = random(1, 10);
  pointCount = random(30, 70);
  strokeWeight(strokeW);
  stroke(random(0), random(255), random(0));
  if(xpos > width || xpos < 0 || ypos > height || ypos < 0) {
    xpos = random(width);
    ypos = random(height);
  } else {
    if (random(100) > 70) {
      strokeWeight(strokeW);
      moveRight(xpos, ypos, pointCount);
    } else if (random(100) > 65) {
      strokeWeight(strokeW);
      moveLeft(xpos, ypos, pointCount);
    } else if (random(100) > 50) {
      strokeWeight(strokeW);
      moveDown(xpos, ypos, pointCount);
    } else {
      strokeWeight(strokeW);
      moveUp(xpos, ypos, pointCount);
    }
  }
}

void moveRight(float startX, float startY, float moveCount) {
  for(float i = 0; i < moveCount; i = i + 1) {
    point(startX+i, startY);
    xpos = startX + i;
    ypos = startY;
  }
}

void moveLeft(float startX, float startY, float moveCount) {
  for(float i = 0; i < moveCount; i = i + 1) {
    point(startX-i, startY);
    xpos = startX - i;
    ypos = startY;
  }
}

void moveDown(float startX, float startY, float moveCount) {
  for(float i = 0; i < moveCount; i = i + 1) {
    point(startX, startY+i);
    xpos = startX;
    ypos = startY + i;
  }
}

void moveUp(float startX, float startY, float moveCount) {
  for(float i = 0; i < moveCount; i = i + 1) {
    point(startX, startY-i);
    xpos = startX;
    ypos = startY - i;
  }
}
