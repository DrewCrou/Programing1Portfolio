//Drew Crouch | November 2022 | Calculator
Button[] numButtons = new Button[11];
Button[] opButtons = new Button[12];
String dVal = "0.0";
char op = ' ';
float l, r, result;
boolean left = true;


void setup() {
  size(480, 580);
  textSize(20);
  numButtons[0] = new Button(110, 510, 140, 60, '0', color(#938F8A), color(#D3CBC0));
  numButtons[1] = new Button(70, 430, 60, 60, '1', color(#938F8A), color(#D3CBC0));
  numButtons[2] = new Button(150, 430, 60, 60, '2', color(#938F8A), color(#D3CBC0));
  numButtons[3] = new Button(230, 430, 60, 60, '3', color(#938F8A), color(#D3CBC0));
  numButtons[4] = new Button(70, 350, 60, 60, '4', color(#938F8A), color(#D3CBC0));
  numButtons[5] = new Button(150, 350, 60, 60, '5', color(#938F8A), color(#D3CBC0));
  numButtons[6] = new Button(230, 350, 60, 60, '6', color(#938F8A), color(#D3CBC0));
  numButtons[7] = new Button(70, 270, 60, 60, '7', color(#938F8A), color(#D3CBC0));
  numButtons[8] = new Button(150, 270, 60, 60, '8', color(#938F8A), color(#D3CBC0));
  numButtons[9] = new Button(230, 270, 60, 60, '9', color(#938F8A), color(#D3CBC0));
  numButtons[10] = new Button(230, 510, 60, 60, '.', color(#938F8A), color(#D3CBC0));
  opButtons[0] = new Button(330, 470, 60, 140, '=', color(#F5900C), color(#E8B470));
  opButtons[1] = new Button(330, 350, 60, 60, '+', color(#F5900C), color(#E8B470));
  opButtons[2] = new Button(410, 430, 60, 60, '-', color(#F5900C), color(#E8B470));
  opButtons[3] = new Button(330, 270, 60, 60, 'x', color(#F5900C), color(#E8B470));
  opButtons[4] = new Button(410, 350, 60, 60, '÷', color(#F5900C), color(#E8B470));
  opButtons[5] = new Button(410, 510, 60, 60, '±', color(#F5900C), color(#E8B470));
  opButtons[6] = new Button(150, 190, 60, 60, '√', color(#D6D1CB), color(#FFFFFF));
  opButtons[7] = new Button(230, 190, 60, 60, 'S', color(#D6D1CB), color(#FFFFFF));
  opButtons[8] = new Button(410, 190, 60, 60, '%', color(#D6D1CB), color(#FFFFFF));
  opButtons[9] = new Button(70, 190, 60, 60, 'C', color(#D6D1CB), color(#FFFFFF));
  opButtons[10] = new Button(330, 190, 60, 60, 'π', color(#D6D1CB), color(#FFFFFF));
  opButtons[11] = new Button(410, 270, 60, 60, 'e', color(#F5900C), color(#E8B470));
}

void draw() {
  background(80);
  for (int i = 0; i < numButtons.length; i = i + 1) {
    numButtons[i].display();
    numButtons[i].hover(mouseX, mouseY);
  }
  for (int i = 0; i < opButtons.length; i = i + 1) {
    opButtons[i].display();
    opButtons[i].hover(mouseX, mouseY);
  }
  updateDisplay();
}

void keyPressed() {
  println("key:" + key);
  println("key" + keyCode);
  if (keyCode == 49 || keyCode == 97) {
    handleEvent("1", true);
  } else if (keyCode == 50 || keyCode == 98) {
    handleEvent("2", true);
  } else if (keyCode == 51 || keyCode == 99) {
    handleEvent("3", true);
  } else if (keyCode == 52 || keyCode == 100) {
    handleEvent("4", true);
  } else if (keyCode == 53 || keyCode == 101) {
    handleEvent("5", true);
  } else if (keyCode == 54 || keyCode == 102) {
    handleEvent("6", true);
  } else if (keyCode == 55 || keyCode == 103) {
    handleEvent("7", true);
  } else if (keyCode == 56 || keyCode == 104) {
    handleEvent("8", true);
  } else if (keyCode == 57 || keyCode == 105) {
    handleEvent("9", true);
  } else if (keyCode == 48 || keyCode == 96) {
    handleEvent("0", true);
  } else if (keyCode == 67) {
    handleEvent("C", false);
  } else if (keyCode == 46 || keyCode == 110) {
    handleEvent(".", false);
  } else if (keyCode == 107) {
    handleEvent("+", false);
  } else if (keyCode == 109) {
    handleEvent("-", false);
  } else if (keyCode == 111) {
    handleEvent("÷", false);
  } else if (keyCode == 106) {
    handleEvent("*", false);
  }
}

void handleEvent(String val, boolean num) {
  if (num == true && dVal.length() < 25) {
    if (dVal.equals("0.0")) {
      dVal = val;
    } else {
      dVal += val;
    }
    if (left == true) {
      l = float(dVal);
    } else {
      r = float(dVal);
    }
  } else if (val.equals("C")) { // All opButtons here
    dVal = "0.0";
    op = ' ';
    l = 0.0;
    r = 0.0;
    result = 0.0;
    left = true;
  } else if (val.equals("+")) {
    op = '+';
    dVal = " ";
    left = false;
  } else if (val.equals("-")) {
    op = '-';
    dVal = " ";
    left = false;
  } else if (val.equals("*")) {
    op = '*';
    dVal = " ";
    left = false;
  } else if (val.equals("÷")) {
    op = '÷';
    dVal = " ";
    left = false;
  } else if (val.equals(".")) {
    if (!dVal.contains(".")) {
      dVal += ".";
    }
  }
}

void mouseReleased() {
  for (int i = 0; i < numButtons.length; i = i + 1) {
    if (numButtons[i].on) {
      handleEvent(str(numButtons[i].val), true);
    }
  }
  for (int i = 0; i < opButtons.length; i = i + 1) {
    if (opButtons[i].on && opButtons[i].val == 'C') {
      handleEvent("C", false);
    } else  if (opButtons[i].on && opButtons[i].val == '+') {
      handleEvent("+", false);
    } else  if (opButtons[i].on && opButtons[i].val == '-') {
      handleEvent("-", false);
    } else  if (opButtons[i].on && opButtons[i].val == '=') {
      performCalculation();
    } else  if (opButtons[i].on && opButtons[i].val == 'x') {
      handleEvent("*", false);
    } else  if (opButtons[i].on && opButtons[i].val == '÷') {
      handleEvent("÷", false);
    } else  if (opButtons[i].on && opButtons[i].val == '±') {
      if (left == true) {
        l = l * -1;
        dVal = str(l);
      } else {
        r = r * -1;
        dVal = str(r);
      }
    } else  if (opButtons[i].on && opButtons[i].val == 'S') {
      if (left == true) {
        l = sq(l);
        dVal = str(l);
      } else {
        r = sq(r);
        dVal = str(r);
      }
    } else  if (opButtons[i].on && opButtons[i].val == '%') {
      if (left == true) {
        l = l / 100;
        dVal = str(l);
      } else {
        r = r / 100;
        dVal = str(r);
      }
    } else  if (opButtons[i].on && opButtons[i].val == '√') {
      if (left == true) {
        l = sqrt(l);
        dVal = str(l);
      } else {
        r = sqrt(r);
        dVal = str(r);
      }
    } else  if (opButtons[i].on && opButtons[i].val == 'π') {
      op = 'π';
      dVal = " ";
      left = false;
    } else  if (opButtons[i].on && opButtons[i].val == 'e') {
      op = 'e';
      dVal = " ";
      left = false;
    } else  if (opButtons[i].on && opButtons[i].val == '.') {
      handleEvent(".", false);
    }
  }
  println("l:" + l + " r:" + r + " op:" + op + " left:" + left + " result:" + result);
}

void updateDisplay() {
  fill(0);
  rect(240, 90, 400, 100, 8);
  fill(255);
  textAlign(RIGHT, BOTTOM);
  if (dVal.length()<15) {
    textSize(40);
  } else if (dVal.length()<16) {
    textSize(38);
  } else if (dVal.length()<17) {
    textSize(36);
  } else if (dVal.length()<18) {
    textSize(34);
  } else if (dVal.length()<19) {
    textSize(32);
  } else if (dVal.length()<20) {
    textSize(30);
  } else {
    textSize(28);
  }
  text(dVal, width-70, 130);
}

void performCalculation() {
  if (op == '+') {
    result = l + r;
  } else if (op == '-') {
    result = l - r;
  } else if (op == 'X') {
    result = l * r;
  } else if (op == '÷') {
    result = l / r;
  } else if (op == 'π') {
    result = l * PI;
  } else if (op == 'e') {
    result = l * pow(10, r);
  }
  dVal = str(result);
  l = result;
  left = true;
}
