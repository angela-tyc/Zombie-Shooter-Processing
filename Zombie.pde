class Zombie {
  int side;
  int speed;
  
  int xpos;
  int ypos;
  int r;
  
  int xvel;
  int yvel;
  int maxvel = 20;
  
  PImage[] walkImages;
  int imageCount;
  int frame;
  
  //int redval = int(random(255));
  //int greenval = int(random(255));
  //int blueval = int(random(255));
  
  Zombie(int wave) {
    xvel = 0;
    yvel = 0;
    side = int(random(4));
    speed = int(random(10 + 5*wave, 20 + 5*wave));
    r = 30;
    
    if (side == 0) {//top spawn
      ypos = -r;
      xpos = int(random(r, 800-r));
    }
    if (side == 1) {//right side spawn
      xpos = 800+r;
      ypos = int(random(r, 600-r));
    }
    if (side == 2) {//bottom spawn
      ypos = 600+r;
      xpos = int(random(r, 800-r));
    }
    if (side == 3) {//left side spawn
      xpos = -r;
      ypos = int(random(r, 600-r));
    }
    
    imageCount = 4;
    
    walkImages = new PImage[imageCount];
    for (int i = 0; i < imageCount; i++) {
      walkImages[i] = loadImage("skeleton-move_" + i + ".png");
      walkImages[i].resize(60, 60);
    }
    
  }
  
  void display() {
    //strokeWeight(3);
    //fill(redval,greenval,blueval);
    //fill(105);
    //circle(xpos,ypos, r);
    frame = (frame+1) % imageCount;
    image(walkImages[frame], xpos, ypos);
    //rotate(10);
    //circle(xpos + 30,ypos + 30, 10);
  }
  
  void move(int playerx, int playery) {
    if (xpos < playerx) {
      if (xvel + speed/10 > 2) {
        xvel = 2;
      }
      else {
        xvel += speed/10;
      }
    }
    if (xpos > playerx) {
      if (xvel - speed/10 < -2) {
        xvel = -2;
      }
      else {
        xvel -= speed/10;
      }
    }
    if (ypos < playery) {
      if (yvel + speed/10 > 2) {
        yvel = 2;
      }
      else {
        yvel += speed/10;
      }
    }
    if (ypos > playery) {
      if (yvel - speed/10 < -2) {
        yvel = -2;
      }
      else {
      yvel -= speed/10;
      }
    }
    
    xpos += xvel;
    ypos += yvel;
  }
  
  boolean didCollide(int x, int y, int w, int h) {
    //line(xpos,ypos,x + w/2,y + 0.7*h);
    if ((dist(xpos + 30,ypos + 30,x + w/2,y + 0.7*h)) <= r/2 + 12) {
      return true;
    }
    return false;
  }
  boolean didCollideBullet(int x, int y) {
    //line(xpos,ypos,x + w/2,y + 0.7*h);
    if ((dist(xpos + 30,ypos + 30, x, y)) <= r) {
      return true;
    }
    return false;
  }
}
