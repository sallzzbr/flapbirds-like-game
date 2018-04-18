class Obstacles {
  
  float obY;
  float obX;
  float accel;
  float speed;
  
  Obstacles(int tempY) {
    obX = 630;
    obY = tempY;
    accel = 1.1;
    speed = 1;
  }
  
  void run(){
    display();
    move();
  }
  
  void display(){
    rect(obX, obY, 60, 20);
  }
  
  void move(){
    obX = obX - speed;
    if(obX < 0){
      obX = 630;
      if( speed < 10){
      speed = speed * accel;
      } else {
        speed = random(2, 5);
      }
    }
  }
  
}
