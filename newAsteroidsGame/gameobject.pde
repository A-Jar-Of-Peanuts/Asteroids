abstract class GameObject {
  public int lives, size; 
  public PVector location, velocity; 

  public GameObject(int size, int lives) {
    this.size = size; 
    this.lives = lives;
  }

  public void act() {
    location.add(velocity);
  }

  public void show() {
  }

  public int getLives() {
    return lives;
  }

  public void setLives(int newLives) {
    lives = newLives;
  }

  public int getSize() {
    return size;
  }

  public float getPosX() {
    return location.x;
  }

  public void setPosX(float x) {
    location.x = x;
  }

  public float getPosY() {
    return location.y;
  }

  public void setPosY(float y) {
    location.y = y;
  }

  public boolean offScreen() {
    return location.x>width || location.x<0 || location.y>height || location.y<0;
  }
}
