class Fire extends GameObject {
  private int opacity; 
  private boolean blue = false; 
  public Fire(PVector location, PVector direction) {
    super(1, 1); 
    super.location = new PVector(location.x, location.y); 
    velocity = new PVector(direction.x, direction.y);
    opacity = 255; 
    velocity.rotate(radians(180)+random(-0.5, 0.5)); 
    velocity.setMag(5);
  }

  public void show() {
    noStroke(); 
    if (blue) {
      fill(#14213d, opacity);
    } else {
      fill(#f28482, opacity);
    }
    circle(location.x, location.y, 10);
  }

  public void act() {
    super.act(); 
    opacity -=5; 
    if (opacity <= 0) {
      lives = 0;
    } else if (offScreen()) {
      lives = 0;
    }
  }

  public void setVelocity(int mag) {
    velocity.setMag(mag);
  }
  
  public void isBlue() {
    blue = !blue; 
    velocity.setMag(random(.1, 2)); 
  }
}
