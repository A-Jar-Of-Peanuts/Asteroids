ArrayList<GameObject> asteroid; 
ArrayList<Bullet> goodbullet; 
ArrayList<Bullet> evilbullet; 
boolean akey, wkey, dkey, skey, space; 
boolean isUFO = false; 
//Spaceship ship; 
Player player; 
int pasttimea; 
int pasttimeu;
int mode; 
int GAME = 0; 
int GAMEOVER = 1; 
int PAUSE = 2;
int INTRO = 3; 
int score = 0; 

public void setup() {
  size(800, 800); 
  akey = wkey = dkey = skey = space = false; 
  asteroid = new ArrayList<GameObject>(); 
  goodbullet = new ArrayList<Bullet>(); 
  evilbullet = new ArrayList<Bullet>(); 
  player = new Player(50, width/5, height/5, 3); 
  pasttimea = 0;
  pasttimeu = 0;
  //for(int i = 0; i<10; i++) {
  //  ob.add(new Asteroid(50, 1)); 
  //}
  asteroid.add(new Asteroid(100, 1));
  mode = INTRO;
}

public void draw() {
  if (mode == GAME) {
    background(255); 
    rectMode(CENTER); 
    fill(255, 0, 0);
    stroke(0);
    strokeWeight(3);
    rect(width, 0, 200, 100); 
    textSize(30); 
    fill(0); 
    text("PAUSE", width-100, 30);
    textSize(50); 
    text("Lives: " + player.getLives(), 0, 50);
    text("Score: " + score, 0, 100); 
    
    pasttimea++; 
    pasttimeu++; 

    if (pasttimea>=500) { 
      //System.out.println("new asteroid"); 
      pasttimea = 0;
      asteroid.add(new Asteroid(100, 1));
    }

    if (!isUFO && pasttimeu>=1000) {
      pasttimeu = 0;
      asteroid.add(new UFO(30, 1));
      isUFO = true;
    }

    player.act(); 
    player.show();

    for (int i = 0; i<asteroid.size(); i++) {
      if (asteroid.get(i).lives>0) {  
        asteroid.get(i).act(); 
        asteroid.get(i).show();
      } else {
        if (asteroid.get(i) instanceof UFO) {
          isUFO = false; 
          pasttimeu = millis();
        }
        asteroid.remove(i);
      }
    }

    for (int i = 0; i<goodbullet.size(); i++) {
      if (goodbullet.get(i).lives>0) {
        fill(100, 100, 0); 
        goodbullet.get(i).act(); 
        goodbullet.get(i).show();
      } else {
        goodbullet.remove(i);
      }
    }

    for (int i = 0; i<evilbullet.size(); i++) {
      if (evilbullet.get(i).lives>0) {
        fill(0, 100, 100); 
        evilbullet.get(i).act(); 
        evilbullet.get(i).show();
      } else {
        evilbullet.remove(i);
      }
    }
  } else if (mode == GAMEOVER) {
    //System.out.println(player.getLives()); 
    if (player.getLives() <=0) {
      background(255, 0, 0);
      fill(0); 
      textSize(30); 
      text("YOU LOSE", 0, 30);
    } else {
      fill(0); 
      textSize(30); 
      background(0, 255, 0);
      text("YOU WIN", 0, 30);
    }
  } else if (mode == INTRO) {
    background(0);
    fill(255); 
    textSize(30); 
    text("ASTEROID GAME", 0, 30);
    text("PRESS ENTER TO START", width/2, height/2);
  } else if (mode == PAUSE) {
    background(100, 100, 100); 
    fill(255); 
    textSize(30); 
    text("PAUSE", 0, 30); 
    text("PRESS ENTER TO RESUME", width/2, height/2);
  }
}
