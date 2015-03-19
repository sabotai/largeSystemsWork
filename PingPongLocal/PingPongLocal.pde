Paddle p1, p2;
Ball ball1;
int score = 0;

void setup() {
  size(1920, 1080);

  p1 = new Paddle();
  p2 = new Paddle();
  ball1 = new Ball();
  
textSize(500);
}

void draw() {
  
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
  ball1.moveBall(p1, p2);
  }

void keyPressed(){
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
  ball1.resetPos(); 
 }
  
}

