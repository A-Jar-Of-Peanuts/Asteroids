class UFO extends Spaceship {
  int dir; 
  public UFO (int size, int lives) {
    super(size, lives); 
    int side = (int)random(4); 
    float posX = 0;
    float posY = 0; 
    switch(side) {
    case 0: 
      dir = 0; 
      posX = 0; 
      posY = random(height); 
      break;
    case 1:
      dir = 1;
      posX = random(width); 
      posY = height; 
      break; 
    case 2:
      dir = 2; 
      posX = width; 
      posY = random(height); 
      break;
    case 3: 
      dir = 3; 
      posX = random(width); 
      posY = 0;
    }
    location = new PVector(posX, posY);
  }

  public void act() {
    super.act(); 
    fill(0); 
    if (millis()-pastTime > 5000) {
      PVector temp = new PVector(direction.copy().x + random(-100, 100), direction.copy().y  + random(-100, 100)); 
      evilbullet.add(new Bullet(location.copy(), temp));
      pastTime = millis();
    }

    for (int i = 0; i<goodbullet.size(); i++) {    
      if (dist(location.x, location.y, goodbullet.get(i).getPosX(), goodbullet.get(i).getPosY()) < size/2) { 
        goodbullet.get(i).setLives(goodbullet.get(i).getLives()-1); 
        lives--;
        break;
      }
    }

    float x = (getPosX()-player.getPosX()); 
    float y = (getPosY()-player.getPosY()); 

    direction.x = -x; 
    direction.y = -y; 

    switch(dir) {
    case 0:
      velocity.x = 1; 
      velocity.y = 0;
      break; 
    case 1:
      velocity.x = 0;
      velocity.y = -1; 
      break;
    case 2:
      velocity.x = -1;
      velocity.y = 0;
      break;
    case 3:
      velocity.x = 0; 
      velocity.y = 1; 
      break;
    }
    
    if (location.x+size<0 && velocity.x < 1) lives--;
    if (location.x-size>width && velocity.x >1) lives--;
    if (location.y+size<0 && velocity.y<1) lives--;
    if (location.y-size>height && velocity.y>1) lives--;
  }
}
