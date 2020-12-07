class Spaceship extends GameObject {
  public PVector direction; 
  public int pastTime; 
  public Spaceship(int size, int lives) {
    super(size, lives); 
    direction = new PVector(0.1, 0); 
    velocity = new PVector(0, 0);
    pastTime = millis();
  }

  public void show() {
    pushMatrix(); 
    stroke(0); 
    strokeWeight(3); 
    translate(location.x, location.y); 
    rotate(direction.heading()); 
    rect(0, 0, size, size); 
    popMatrix();
  }
}
