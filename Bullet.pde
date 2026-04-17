class Bullet {
  float xpos;
  float ypos;
  
  float targetx;
  float targety;
  
  float ang;
  float k;
  
  float a;
  float b;
  
  float diffx;
  float diffy;
  
  float xvel = 1;
  float yvel = 1;
  
  Bullet(float x, float y, float targetx, float targety) {
   
    a = targetx;
    b = targety;
    xpos = x;
    ypos = y;
    
    diffy = (b - ypos);
    diffx = (a - xpos);
    
    if (diffx < 0) {
      xvel *= -1;
      println(xvel);
    }
    if (diffy < 0) {
      yvel *= -1;
    }
    k = (diffy/diffx);
    ang = abs(degrees(atan(k)));
    //println(ang);
    
    xvel*= 30*cos(radians(ang));
    yvel*= 30*sin(radians(ang));
    //println(diffx, diffy);
   
    
     
    //println(targetx);
    //println(targety);
    
    //println(ang);
    //println(x);
    //println(y);
  }
  void display() {
    //fill(255,49,85);
    //println(a);
    //println(b);
    circle(xpos,ypos,10);
  }
  
  void update() {
    if (xpos < 802 && xpos > -2 && ypos > -2 && ypos < 602) {
      xpos += xvel;
      //println(x);
      ypos += yvel;
      display();
    }
  }
  
  
}
