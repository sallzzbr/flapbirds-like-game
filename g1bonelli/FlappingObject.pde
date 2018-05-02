class FlappingObject {
  
  float ballY;
  float speed;
  float gravity;
  boolean upB;
  
  FlappingObject() {
    upB = false;
    ballY = 200;
    speed = 0;
    gravity = 0.1;
  }
  
  void run(){
    display();
    gravity();
  }
  
  void display(){
    ellipse(300, ballY, 20, 20);
  }
  
  void gravity(){
    ballY = ballY + speed;
    speed = speed + gravity;
    
    //if (upB) {
    //  gravity = -0.1;
    //} else {
    //  gravity = 0.1;
    //}
    
    if (ballY > height) {
      speed = speed * -0.95;
      ballY = height;
    } else if (ballY <= 10) {
      speed = speed * -0.95;
      ballY = 10;
    }
    
  }
  
}
