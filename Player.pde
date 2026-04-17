class Player {
  int x, y, w, h;
  float speedX, speedY, maxSpeed;

  PImage[] leftImages;
  PImage[] rightImages;
  PImage[] upImages;
  PImage[] downImages;
  PImage[] restImages;

  int imageCount, restImageCount;
  int frame;

  Player() {
    x = width / 2;
    y = height / 2;
    w = 50;
    h = 50;
    maxSpeed = 20;
    speedX = 0;
    speedY = 0;

    imageCount = 4;

    leftImages = new PImage[imageCount];
    rightImages = new PImage[imageCount];
    upImages = new PImage[imageCount];
    downImages = new PImage[imageCount];
    restImages = new PImage[imageCount];


    for (int i = 0; i < imageCount; i++) {
      leftImages[i] = loadImage("tile" + nf(i+12, 3) + ".png");
      leftImages[i].resize(w, h);
    }

    for (int i = 0; i < imageCount; i++) {
      rightImages[i] = loadImage("tile" + nf(i+4, 3) + ".png");
      rightImages[i].resize(w, h);
    }

    for (int i = 0; i < imageCount; i++) {
      upImages[i] = loadImage("tile" + nf(i+8, 3) + ".png");
      upImages[i].resize(w, h);
    }

    for (int i = 0; i < imageCount; i++) {
      downImages[i] = loadImage("tile" + nf(i, 3) + ".png");
      downImages[i].resize(w, h);
    }

    for (int i = 0; i < imageCount; i++) {
      restImages[i] = loadImage("tile" + nf(i+20, 3) + ".png");
      restImages[i].resize(w, h);
    }
  }

  void update() {
    if (left) {
      speedY = 0;
      speedX = -maxSpeed;
    }
    if (right) {
      speedY = 0;
      speedX = maxSpeed;
    }
    if ((!left && !right) || (left && right)) {
      speedX = 0;
    }
    if (up) {
      speedY = -maxSpeed;
      speedX = 0;
    }
    if (down) {
      speedY = maxSpeed;
      speedX = 0;
    }
    if ((!up && !down) || (up && down)) {
      speedY = 0;
    }

    checkBounds();

    x += speedX;
    y += speedY;
  }

  void display() {
    if (left) {
      frame = (frame+1) % imageCount;
      image(leftImages[frame], x, y);
    }
    if (right) {
      frame = (frame+1) % imageCount;
      image(rightImages[frame], x, y);
    }
    if (up) {
      frame = (frame+1) % imageCount;
      image(upImages[frame], x, y);
    }
    if (down) {
      frame = (frame+1) % imageCount;
      image(downImages[frame], x, y);
    }
    if ((!left && !right && !up && !down)) {
      frame = (frame+1) % imageCount;
      image(restImages[frame], x, y);
    }
  }

  void checkBounds() {
    if (x > width - w) {
      x = width - w;
    }
    if (x < 1) {
      x = -1;
    }
    if (y > height - h) {
      y = height - h;
    }
    if (y < 1) {
      y = -1;
    }
  }
}
