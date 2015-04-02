
import oscP5.*;
import netP5.*;
  
OscP5 oscP5;
NetAddress myRemoteLocation;


Paddle p1, p2;
Ball ball1;
int score = 0;

int localPlayer = 0;
boolean sentFirst = false;
boolean begin = false;
int direction = 1;

void setup() {
  size(500, 500);
  //scale(4);
  
  oscP5 = new OscP5(this,44067);
  myRemoteLocation = new NetAddress("127.0.0.1",44068);
  
  p1 = new Paddle();
  p2 = new Paddle();
  ball1 = new Ball();
  
  textSize(50);
  
}

void draw() {
  if (begin){
  receiveOSC();
  
  fill(millis()%255);
  text(score, width/2-150, height/2);

  
  //if (millis() % 2 == 0){
   // background(255,01);
   fill(255,100);
   noStroke();
   rect(0,0,width,height);
   stroke(0);
   fill(0);
  //}
  p1.drawPaddle();
  //p1.movePaddle(1);

  p2.drawPaddle();
  //p2.movePaddle(-1);

  ball1.drawBall();
  
  sendOSC();
  }
  }

void keyPressed(){
  if (!begin){
   println("I am player 1");
  begin = true; 
    ball1.moveBall(p1, p2);
    sendOSC();
  }
 if (keyCode == UP){
  p1.movePaddle(-25);
 } else if (keyCode == DOWN){
  p1.movePaddle(25); 
 } else if (keyCode == LEFT){
  p2.movePaddle(-25); 
 } else if (keyCode == RIGHT){
  p2.movePaddle(25); 
 }
 
 if (keyCode == ENTER){
   begin = true;
  ball1.resetPos(); 
 }
  
}

