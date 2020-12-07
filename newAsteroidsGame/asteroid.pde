public class Asteroid extends GameObject {
  public Asteroid (int size, int lives) {
    super(size, lives); 
    location = new PVector(random(width), random(height)); 
    velocity = new PVector(1, 0); 
    velocity.rotate(random(TWO_PI));
  }

  public void act() {
    super.act(); 
    if (player.getInvulnerable() == false && dist(location.x, location.y, player.getPosX(), player.getPosY())<(size+(player.size/2))/2) {
      lives--; 
      player.setLives(player.getLives()-1);
      player.setInvulnerable(true);
    }
    for (int i = 0; i<goodbullet.size(); i++) {

      if (dist(location.x, location.y, goodbullet.get(i).getPosX(), goodbullet.get(i).getPosY()) < size/2) { 
        goodbullet.get(i).setLives(goodbullet.get(i).getLives()-1); 
        lives--;
        if (size>25) {
          Asteroid temp = new Asteroid(size/2, 1); 
          Asteroid temp2 = new Asteroid(size/2, 1); 

          temp.setPosX(location.x);
          temp.setPosY(location.y); 

          temp2.setPosX(location.x);
          temp2.setPosY(location.y); 
          asteroid.add(temp); 
          asteroid.add(temp2);
        }
        score++; 
        if (score>=100) {
          mode = GAMEOVER;
        }
        for (int j = 0; j<50; j++) {
          Fire temp = new Fire(location, new PVector(random(-1, 1), random(-1, 1))); 
          temp.isBlue(); 
          //temp.setVelocity(1); 
          asteroid.add(temp);
        }
        break;
      }
    }

    if (location.x+size<0 && velocity.x < 1) location.x = width+size; 
    if (location.x-size>width && velocity.x >1) location.x = -size; 
    if (location.y+size<0 && velocity.y<1) location.y = height+size; 
    if (location.y-size>height && velocity.y>1) location.y = -size;
  }

  public void show() {
    fill(#14213d);  
    stroke(3); 
    circle(location.x, location.y, size);
    ////translate(location.x, location.y); 
    //location = new PVector(random(width), random(height)); 
    //velocity = new PVector(1, 0); 
    //velocity.rotate(random(TWO_PI));
  }
}
