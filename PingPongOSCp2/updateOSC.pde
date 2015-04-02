

void sendOSC(){


  
  /* in the following different ways of creating osc messages are shown by example */
  OscMessage myMessage = new OscMessage("/player/position");
  
  if (localPlayer == 0){
  myMessage.add(p1.pos.x); /* add an int to the osc message */
  myMessage.add(p1.pos.y);
  } else {
  myMessage.add(p2.pos.x); /* add an int to the osc message */
  myMessage.add(p2.pos.y);
    
  }
  /* send the message */
  oscP5.send(myMessage, myRemoteLocation); 
  
  
    /* in the following different ways of creating osc messages are shown by example */
  OscMessage myMessage2 = new OscMessage("/ball/position");
  
  myMessage.add(ball1.pos.x); /* add an int to the osc message */
  myMessage.add(ball1.pos.y);

  /* send the message */
  oscP5.send(myMessage2, myRemoteLocation); 
  
  
}
