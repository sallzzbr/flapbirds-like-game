FlappingObject flapFlap = new FlappingObject();
final static ArrayList<Obstacles> obstacles = new ArrayList();
boolean gameStart = false;
boolean gameOver = false;
boolean textFill = true;
PFont startMessage;

void setup(){
  frameRate(60);
  size(600, 400);
  ellipseMode(CENTER);
  rectMode(CENTER);
  obstacles.add( new Obstacles(int(random(0, 400)))); 
  startMessage = loadFont("AmericanTypewriter-CondensedLight-100.vlw");
}

void draw(){
  background(0);
  textBlink();
  if(gameStart){
    gameRun();
  } else {
    redraw();
    textFont(startMessage);
    textAlign(CENTER);
    textSize(18);
    if(gameOver){
      text("Press Down to restart!",300,200);
    } else {
      text("Press Down to start!",300,200);
    }
    if(textFill){
      fill(0);
    } else {
      fill(255);
    }
  }
}

void addNewObstacles(){
  if ( obstacles.size() < 5){
    for(int i = 0; i < obstacles.size(); i++){
      if (obstacles.get(i).obX - 30 <= -60){
        obstacles.add( new Obstacles(int(random(0, 400))));
        println(obstacles.size());
      }
    }
  } else {
    for(int i = 0; i < obstacles.size(); i++){
      if (obstacles.get(i).obX - 30 <= -60){
        println(obstacles.size());
      }
    }
  }
}

 void collision(){
   for(int i = 0; i < obstacles.size(); i++){
     if(obstacles.get(i).obX - 30 <= 310 && obstacles.get(i).obX + 30 >= 290 && obstacles.get(i).obY - 10 <= flapFlap.ballY + 10 && obstacles.get(i).obY + 10 >= flapFlap.ballY - 10){
       gameOver = true;
       gameStart = false;
     } 
   }
}

void gameRun() {
  flapFlap.run();
  for (Obstacles b: obstacles)   b.run();
  addNewObstacles();
  collision();
}

void textBlink(){
  if(frameCount%60 == 1){
    textFill = false;
  } else if(frameCount%60 == 30) {
    textFill = true;
  }
}

void keyPressed() {
  if (key == CODED) { 
    if (keyCode == UP) {
       flapFlap.upB = true;
    } 
  }
}
 
  void  keyReleased () {
    if (key == CODED) {
      if (keyCode == UP) {
        flapFlap.upB = false;
      } 
      if (keyCode == DOWN) {
        gameStart = true;
        if(obstacles.size() >= 1){
          obstacles.clear();
          obstacles.add( new Obstacles(int(random(0, 400))));
        }
      } 
    }
  }
