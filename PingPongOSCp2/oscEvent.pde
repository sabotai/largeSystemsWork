/* incoming osc message are forwarded to the oscEvent method. */
void oscEvent(OscMessage theOscMessage) {
  if (begin == false){
    begin = true;
    localPlayer = 1;
    println("I am player 2");
    
  } 
  
  Paddle yourPaddle;
  if (localPlayer == 0){
    yourPaddle = p2;
  } else {
    yourPaddle = p1; 
  }
  
  
  if (localPlayer == 0){
    
  if(theOscMessage.checkAddrPattern("/player/position")==true) {
    
      p2.pos.x = theOscMessage.get(0).floatValue();  // get the first osc argument
      p2.pos.y = theOscMessage.get(1).floatValue(); // get the second osc argument
      println("received player position of : " + p2.pos.x + ", " + p2.pos.y);
  } else if (theOscMessage.checkAddrPattern("/ball/position")==true){
    
      ball1.pos.x = theOscMessage.get(0).floatValue();  // get the first osc argument
      ball1.pos.y = theOscMessage.get(1).floatValue(); // get the second osc argument
      println("received ball position of : " + ball1.pos.x + ", " + ball1.pos.y);
    
  ball1.moveBall(p1, p2);
  } else {
     println("receiving other : " + theOscMessage); 
  }
  
  } else if (localPlayer == 1){
    
    
  if(theOscMessage.checkAddrPattern("/player/position")==true) {
    
      p1.pos.x = theOscMessage.get(0).floatValue();  // get the first osc argument
      p1.pos.y = theOscMessage.get(1).floatValue(); // get the second osc argument
      println("received player position of : " + p2.pos.x + ", " + p2.pos.y);
  } else if (theOscMessage.checkAddrPattern("/ball/position")==true){
    
      ball1.pos.x = theOscMessage.get(0).floatValue();  // get the first osc argument
      ball1.pos.y = theOscMessage.get(1).floatValue(); // get the second osc argument
      println("received ball position of : " + ball1.pos.x + ", " + ball1.pos.y);
    
  ball1.moveBall(p1, p2);
  } else {
     println("receiving other : " + theOscMessage); 
  }
  }
  
  
}
