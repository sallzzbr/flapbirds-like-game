FlappingObject flapFlap = new FlappingObject();
final static ArrayList<Obstacles> obstacles = new ArrayList();

void setup(){
  size(600, 400);
  ellipseMode(CENTER);
  rectMode(CENTER);
  obstacles.add( new Obstacles(int(random(0, 400)))); 
}

void draw(){
  obstacles.size();
  background(0);
  flapFlap.run();
  for (Obstacles b: obstacles)   b.run();
  addNewObstacles();
  collision();
}

void addNewObstacles(){
  if ( obstacles.size() < 5){
    for(int i = 0; i < obstacles.size(); i++){
      if (obstacles.get(i).obX <= 2){
        obstacles.add( new Obstacles(int(random(0, 400))));
        obstacles.get(i).obY = int(random(0, 400)); 
        println(obstacles.size());
      }
    }
  } else {
    for(int i = 0; i < obstacles.size(); i++){
      if (obstacles.get(i).obX <= 2){
        obstacles.get(i).obY = int(random(0, 400)); 
        println(obstacles.size());
      }
    }
  }
}

 void collision(){
   for(int i = 0; i < obstacles.size(); i++){
     if(obstacles.get(i).obX - 30 <= 310 && obstacles.get(i).obX + 30 >= 290 && obstacles.get(i).obY - 10 <= flapFlap.ballY + 10 && obstacles.get(i).obY + 10 >= flapFlap.ballY - 10){
       exit();
     } 
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
    }
  }
