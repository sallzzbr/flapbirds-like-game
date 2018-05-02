import processing.serial.*;

FlappingObject flapFlap = new FlappingObject();
final static ArrayList<Obstacles> obstacles = new ArrayList();
boolean gameStart = false;
boolean gameOver = false;
boolean textFill = true;
int timer = 0;
PFont startMessage;
Serial myPort;
int val;

void setup(){
  frameRate(60);
  size(600, 400);
  ellipseMode(CENTER);
  rectMode(CENTER);
  obstacles.add( new Obstacles(int(random(0, 400)))); 
  startMessage = loadFont("AmericanTypewriter-CondensedLight-100.vlw");
  String portName = Serial.list()[3];//colocar aqui a porta serial
  myPort = new Serial(this, portName, 9600);  
}

void draw(){
  background(0);
  textBlink();
  textFont(startMessage);
  textAlign(CENTER);
  textSize(18);
  if(gameStart){
    gameRun();
  } else {
    redraw();
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
      if (obstacles.get(i).obX - 30 <= -60 && obstacles.get(i).obX - 30 >= -61){
        obstacles.add( new Obstacles(int(random(0, 400))));
        println("foi", obstacles.size());
      }
    }
  } else {
    for(int i = 0; i < obstacles.size(); i++){
      if (obstacles.get(i).obX - 30 <= -60 && obstacles.get(i).obX - 30 >= -61){
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

void pressureController(){
  val = myPort.read();
  if( val == -1){
    flapFlap.gravity = 0.1;
  } else {
    flapFlap.gravity = -0.1 * (val*0.1);
  }   
}

void gameRun() {
  flapFlap.run();
  pressureController();
  for (Obstacles b: obstacles)   b.run();
  addNewObstacles();
  collision();
  text("Tempo:",40,20);
  time();
  text(timer,90,20);
  fill(255);
  gameOver = false;
}

void textBlink(){
  if(frameCount%60 == 1){
    textFill = false;
  } else if(frameCount%60 == 30) {
    textFill = true;
  }
}

void time(){
  if(gameStart){
    if(frameCount%60 == 1) {
      timer = timer + 1;
    }
  }
  if (gameOver){
    timer = 0;
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
