void keyPressed() {
  if (mode == GAME) {
    switch(key) {
    case 'w':
      wkey = true; 
      break; 
    case 'a':
      akey = true; 
      break; 
    case 's': 
      skey = true; 
      break; 
    case 'd': 
      dkey = true; 
      break;   
    case ' ':
      space = true; 
      break;
    }
  } else if (mode == INTRO) {
    if (keyCode == ENTER) {
      mode = GAME;
    }
  } else if (mode == GAMEOVER) {
    if (keyCode == ENTER) {
      mode = INTRO; 
      asteroid = new ArrayList<GameObject>(); 
      goodbullet = new ArrayList<Bullet>(); 
      evilbullet = new ArrayList<Bullet>(); 
      player = new Player(50, width/5, height/5, 3);
      wkey = akey = skey = dkey = space = false; 
      pasttimea = millis(); 
      pasttimeu = millis();
      asteroid.add(new Asteroid(100, 1));
      score = 0; 
    }
  }
}
void keyReleased() {
  if (mode == GAME) {
    switch(key) {
    case 'w':
      wkey = false; 
      break; 
    case 'a':
      akey = false; 
      break; 
    case 's': 
      skey = false; 
      break; 
    case 'd': 
      dkey = false; 
      break;  
    case ' ':
      space = false; 
      break;
    }
  } else if(mode == PAUSE) {
    if(keyCode == ENTER) {
      //int temp = millis()-pausetime; 
      //pasttimea += temp; 
      //pasttimeu += temp; 
      //pausetime = 0; 
      mode = GAME; 
    }
  }
}

void mouseReleased() {
  if(mode == GAME) {
    if(mouseX>width-200 && mouseX<width && mouseY>0 && mouseY<100) {
      mode = PAUSE; 
    }
  }
}
