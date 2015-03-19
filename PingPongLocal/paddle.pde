int playerCount = 0;
class Paddle {
  int playerNumber;
  PVector pos = new PVector();;
  boolean direction; //true up, false down
  int paddleHeight;
  int paddleOffset;

  Paddle() {
    playerNumber = playerCount;
    pos.y = height/2;
    paddleHeight = height/8;
    paddleOffset = 100;

    if (playerCount > 1) {
      println("*WARNING* MORE THAN 2 PLAYERS, RESETTING COUNT");
      playerCount = 0;
    } else if (playerCount == 0) {
      pos.x = paddleOffset;
    } else if (playerCount == 1) {
      pos.x = width - paddleOffset;
    }


    playerCount++;
  }

  void drawPaddle() {
    strokeWeight(50);
    line(pos.x, pos.y, pos.x, pos.y - paddleHeight);
  }

  void movePaddle(int move) {
    pos.y += move;
  }
}


