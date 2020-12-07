class Player extends Spaceship {

  private boolean invulnerable; 
  private int frames; 

  public Player(int size, float posX, float posY, int lives) {
    super(size, lives); 
    location = new PVector(posX, posY);
    invulnerable = false; 
    frames = 0;
  }

  public void act() {
    super.act(); 

    if (invulnerable) {
      fill(100, 100, 0); 
      frames++; 
      if (frames >= 60) {
        invulnerable = false;
        frames = 0;
      }
    } else {
      fill(255); 
      for (int i = 0; i<evilbullet.size(); i++) {    
        if (dist(location.x, location.y, evilbullet.get(i).getPosX(), evilbullet.get(i).getPosY()) < size/2) { 
          evilbullet.get(i).setLives(evilbullet.get(i).getLives()-1); 
          lives--;
          invulnerable = true; 
          break;
        }
      }
    }

    if (space) {
      if (millis()-pastTime > 100) {
        goodbullet.add(new Bullet(location.copy(), direction.copy()));
        pastTime = millis();
      }
    }

    if (akey) direction.rotate(-radians(5)); 

    if (dkey) direction.rotate(radians(5)); 

    if (wkey) { 
      asteroid.add(new Fire(location.copy(), direction.copy())); 
      velocity.add(direction);
      velocity.setMag(.5);
    }
    if (skey) {
      velocity.sub(direction);
      velocity.setMag(.5);
    }

    if (location.x<0) location.x = width; 
    if (location.x>width) location.x = 0; 
    if (location.y<0) location.y = height; 
    if (location.y>height) location.y = 0;

    if (lives == 0) { 
      mode = GAMEOVER;
    }
  }
  public void setInvulnerable(boolean b) {
    invulnerable = b;
  }

  public boolean getInvulnerable() {
    return invulnerable;
  }
}
