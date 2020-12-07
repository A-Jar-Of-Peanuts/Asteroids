class Bullet extends GameObject {
  public Bullet(PVector location, PVector direction) {
    super(10, 1); 
    super.location = location; 
    velocity = new PVector(direction.x, direction.y); 
    velocity.setMag(5);
  }

  public void show() {
    strokeWeight(3); 
    stroke(0);
    //fill(0); 
    circle(location.x, location.y, 10);
  }

  public void act() {
    super.act();
    if (offScreen()) {
      lives = 0;
    }
  }

  //public boolean isEvil() {
  //  return isEvil; 
  //}
}
