import processing.sound.*;
SoundFile buttonSound, gameMusic, shootingSound, gameOverSound;

boolean left, right, up, down;
Player p;

int stage;

int spawnObj;
ArrayList<Zombie> Objs = new ArrayList<Zombie>();
ArrayList<Zombie> removal = new ArrayList<Zombie>();
boolean gameOver;
int level = 1;

ArrayList<Bullet> Bullets = new ArrayList<Bullet>();
ArrayList<Bullet> bulletremoval = new ArrayList<Bullet>();

int highScore = 0;
int score = 1000;

PImage levelIMG;
PFont font1;
void setup() {
  size(800, 600);
  background(0);
  
  buttonSound = new SoundFile(this, "button.mp3");
  gameMusic = new SoundFile(this, "background.mp3");
  shootingSound = new SoundFile(this, "shooting.mp3");
  gameOverSound = new SoundFile(this, "gameover.mp3");
  
  gameMusic.play();
  
  font1 = loadFont("ComicSansMS-Bold-48.vlw");
  textFont(font1, 36);
  textAlign(CENTER, CENTER);
  levelIMG = loadImage("backgroundfinal.png");
  levelIMG.resize(800,600);
  p = new Player();

  left = false;
  right = false;
  up = false;
  down = false;
  
  
  stage = 1;
}



    
 

void draw() {
  
  if (stage == 1) {
  background(levelIMG);
  text("ZOMBIE SHOOTER", width/2, height/2-40);
  textSize(20);
    text("Press any key to play", width/2, height/2 + 60);
    textSize(30);
    if (keyPressed == true){
      stage = 2;
    }
      
    }

  if (stage ==2){

  background(levelIMG);
  frameRate(15);
  fill(255);
  textAlign(CENTER);
  text("Score: " + score, width/2, 50);
  textAlign(RIGHT);
  text("High: " + highScore, 790, 50);
  textAlign(LEFT);
  
  fill(255);
  textSize(20);
  text("PRESS P TO PAUSE", width/2, height - 80);
  textSize(30);
  
  if (score >= 100) {
    level = 2;
    fill(#03FF47);
  }
  if (score >= 300) {
    level = 3;
    fill(#D9EA21);
  }
  if (score >= 600) {
    level = 4;
    fill(#E38F10);
  }
  if (score >= 1000) {
    level = 5;
    fill(#BF0202);
  }
  text("Level: " + level, 10, 50);
  fill(255);
  
  if (gameOver != true) {
    
    gameOverSound.stop();

    p.update();
    p.display();
    
    spawnObj = int(random(18 - level*2));
    if (spawnObj == 1) {
      Objs.add(new Zombie(1));
    } 
    for (int i = 0; i < Objs.size(); i++) {
      Zombie o = Objs.get(i);
      o.move(p.x,p.y);
      o.display();
      if (o.xpos > 800 + o.r || o.ypos > 600 + o.r || o.xpos < -50 || o.ypos < -50) {
        removal.add(o);
        score += 1;
        

      }
      if (o.didCollide(p.x, p.y, p.w, p.h) == true) {
        gameOver = true;
        //gameMusic.stop();
        gameOverSound.play();

        break;
      }
    }
    for (int j = 0; j < removal.size(); j++) {
      Objs.remove(removal.get(j));
    }
  }
  
  
  //GAME OVER SCREEN
  else {
    p.maxSpeed = 0;
    
    for (int i = 0; i < Objs.size(); i++) {
      Objs.remove(Objs.get(i));
    }
    
    if (score > highScore) {
      highScore = score;
    }
    background(levelIMG);
    textAlign(CENTER);
    text("Game Over", width/2, height/2 - 80);
    text("High Score: " + highScore , width/2, height/2- 40);
    text("Click anywhere to play again", width/2, height/2 + 40);
    if(mousePressed) {
      p.maxSpeed = 20;
      score = 0;
      level = 1;
      p.x = width/2;
      p.y = height/2;
      gameOver = false;
      
    }
  }
  for (int i = 0; i < Bullets.size(); i++) {
     Bullet b = Bullets.get(i);
     b.update();
     
     for (int j = 0; j < Objs.size(); j++) {
       Zombie o = Objs.get(j);
       if (o.didCollideBullet(int(b.xpos),int(b.ypos))) {
         bulletremoval.add(b);
         removal.add(o);
       }
         
         
     }
     for (int k = 0; k < removal.size(); k++) {
       Objs.remove(removal.get(k));
     }
     for (int l = 0; l < bulletremoval.size(); l++) {
       Bullets.remove(bulletremoval.get(l));
     }
  }
  }
}

void mousePressed() {
  Bullets.add(new Bullet(p.x + p.w/2,p.y + 0.7*p.h,mouseX,mouseY));
  shootingSound.play();
}


void keyPressed() {
  switch(keyCode) {
  case 37: // left
    left = true;
    break;
  case 65: // left
    left = true;
    break;
  case 38: // up
    up = true;
    break;
  case 87: // up
    up = true;
    break;
  case 39: // right
    right = true;
    break;
  case 68: // right
    right = true;
    break;
  case 40: // down
    down = true;
    break;
  case 83: // down
    down = true;
    break;
  }
  
  final int k = keyCode;

  if (k == 'P' && gameOver != true){
    if (looping) {
      noLoop();
      
      background(levelIMG);
      
    textAlign(CENTER);
    fill(255);
    text("PRESS P TO CONTINUE", width/2, height/2 - 80);
    
    buttonSound.play();
    
    }else{
      loop();
    }
  
  
  }
}

void keyReleased() {
  switch(keyCode) {
  case 37: // left
    left = false;
    break;
  case 65: // left
    left = false;
    break;
  case 38: // up
    up = false;
    break;
  case 87: // up
    up = false;
    break;
  case 39: // right
    right = false;
    break;
  case 68: // right
    right = false;
    break;
  case 40: // down
    down = false;
    break;
  case 83: // down
    down = false;
    break;
  }
}
