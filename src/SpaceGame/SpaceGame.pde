// Drew Crouch | November 28 2022 | SpaceGame
import processing.sound.*;
SoundFile laser, rockSound;
SpaceShip s1;
Timer rockTimer, puTimer;
ArrayList<Rock> rocks = new ArrayList<Rock>();
ArrayList<PowerUp> powerups = new ArrayList<PowerUp>();
Star[] stars = new Star[200];
ArrayList<Laser> lasers = new ArrayList<Laser>();
int score, level, rockCount, laserCount, rocksPassed, rockRate;
boolean play;

void setup() {
  size(800, 800);
  s1 = new SpaceShip();
  rockRate = 500;
  puTimer = new Timer(20000);
  puTimer.start();
  rockTimer = new Timer(rockRate);
  rockTimer = new Timer(int(random(500, 2000)));
  rockTimer.start();
  laser = new SoundFile(this, "laserSound.wav");
  rockSound = new SoundFile(this, "rockExplosion.wav");
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
  }
  score = 0;
  level = 1;
  rockCount = 0;
  laserCount = 0;
  rocksPassed = 0;
  play = false;
}

void draw() {
  if (!play) {
    startScreen();
  } else {
    background(0);
    infoPanel();

    //rendering stars
    for (int i = 0; i<stars.length; i++) {
      stars[i].display();
      stars[i].move();
    }
    noCursor();
    
    //Level Handling
    if(frameCount % 1000 == 10) {
      level+=1;
      rockRate-=10;
    }

    // adding powerups
    if (puTimer.isFinished()) {
      powerups.add(new PowerUp());
      puTimer.start();
      println("PowerUps" + powerups.size());
    }

    //rendering powerups and detecting ship collision
    for (int i = 0; i < powerups.size(); i++) {
      PowerUp pu = powerups.get(i);
      if (pu.intersect(s1)) {
        if (pu.type == 'H') {
          s1.health+=10;
        } else {
          s1.ammo+=50;
        }
        powerups.remove(pu);
      }
      if (pu.reachedBottom()) {
        powerups.remove(pu);
      } else {
        pu.display();
        pu.move();
      }
    }

    // adding rocks
    if (rockTimer.isFinished()) {
      rocks.add(new Rock());
      rockCount++;
      rockTimer.start();
      println("Rocks" + rocks.size());
    }

    //rendering rocks and detecting ship collision
    for (int i = 0; i < rocks.size(); i++) {
      Rock r = rocks.get(i);
      if (s1.intersect(r)) {
        s1.health-=10;
        rockSound.play();
        rocks.remove(r);
      }
      if (r.reachedBottom()) {
        rocksPassed();
        rocksPassed+=1;
        rocks.remove(r);
      } else {
        r.display();
        r.move();
      }
    }

    // Rendering lasers and detect rock collision
    for (int i = 0; i < lasers.size(); i++) {
      Laser l = lasers.get(i);
      for (int j = 0; j < rocks.size(); j++) {
        Rock r = rocks.get(j);
        if (r.intersect(l)) {
          score+=1;
          rockSound.play();
          rocks.remove(r);
          lasers.remove(l);
        }
        if (l.reachedTop()) {
          lasers.remove(l);
        } else {
          l.display();
          l.move();
        }
      }
    }
    s1.display(mouseX, mouseY);
    infoPanel();

    // Game over logic
    if (s1.health<10 || rocksPassed>10) {
      gameOver();
    }
  }
}

void mousePressed() {
  if (play) {
    laser.stop();
    laser.play();
    handleEvent();
  }
}

//Add laser based on event
void handleEvent() {
  if (s1.fire() && s1.turretCount == 1) {
    lasers.add(new Laser(s1.x, s1.y));
    println("Lasers:" + lasers.size());
  } else if (s1.fire() && s1.turretCount == 2) {
    lasers.add(new Laser(s1.x-20, s1.y));
    lasers.add(new Laser(s1.x+20, s1.y));
    println("Lasers:" + lasers.size());
  } else if (s1.fire() && s1.turretCount == 3) {
    lasers.add(new Laser(s1.x+20, s1.y));
    lasers.add(new Laser(s1.x-20, s1.y));
    lasers.add(new Laser(s1.x, s1.y));
    println("Lasers:" + lasers.size());
  } else if (s1.fire() && s1.turretCount == 4) {
    lasers.add(new Laser(s1.x-20, s1.y));
    lasers.add(new Laser(s1.x+20, s1.y));
    lasers.add(new Laser(s1.x+40, s1.y));
    lasers.add(new Laser(s1.x-40, s1.y));
    println("Lasers:" + lasers.size());
  } else if (s1.fire() && s1.turretCount == 5) {
    lasers.add(new Laser(s1.x-20, s1.y));
    lasers.add(new Laser(s1.x+20, s1.y));
    lasers.add(new Laser(s1.x-40, s1.y));
    lasers.add(new Laser(s1.x+40, s1.y));
    lasers.add(new Laser(s1.x, s1.y));
    println("Lasers:" + lasers.size());
  }
}



void infoPanel() {
  noStroke();
  fill(129, 128);
  rectMode(CENTER);
  rect(width/2, 25, width, 50);
  fill(255);
  textSize(25);
  text("SPACEGAME" + " | RocksPassed:" + rocksPassed +
    " | Health:" + s1.health +
    " | Level:" + level +
    " | Score:" + score +
    " | Ammo:" + s1.ammo, width/2, 35);
}

void startScreen() {
  background(0);
  fill(222);
  textSize(30);
  textAlign(CENTER);
  text("Press any key to begin...", width/2, height/2);
  if (mousePressed || keyPressed) {
    play = true;
  }
}

void rocksPassed() {
}

void gameOver() {
  background(0);
  fill(222);
  textSize(30);
  textAlign(CENTER);
  text("Game Over!", width/2, height/2);
  text("Score:" + score, width/2, height/2 + 30 );
  play = false;
  noLoop();
}
