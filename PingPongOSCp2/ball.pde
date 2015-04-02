class Ball {
  PVector pos;
  PVector speed;
  int radius;

  Ball() {
    //speed = new PVector(random(-20, 20), random(-20, 20));
    speed = new PVector(5,5);
    radius = 20; 
    pos = new PVector(width/2, height/2);
  }

  void moveBall(Paddle p1Paddle, Paddle p2Paddle) {
    if ((pos.y < radius/2) || (pos.y > (height- radius/2))) {
      speed.y = -speed.y;
    }
    if (pos.x < 0) {
      score--;
      resetPos();
    } else if (pos.x > width) {
      score++; 
      resetPos();
    }


    if ((dist(p2Paddle.pos.x, p2Paddle.pos.y, pos.x, pos.y) < radius) || (dist(p1Paddle.pos.x, p1Paddle.pos.y, pos.x, pos.y) < radius)) {
      if ((pos.x > p1Paddle.pos.x) && (pos.x < p2Paddle.pos.x)) {
        speed.x = -speed.x;
      }
    }

    pos.add(speed);
  }
  void drawBall() {
    ellipse(pos.x, pos.y, radius, radius);
  }

  void resetPos() {
    println("Score - " + score);
    pos.set(width/2, height/2);
    //float ran = random(10,30) * 
    //speed.set(random(-50, 50), random(-50, 50));
    if (direction > 0){
      direction = -1;
    } else {
      direction = 1;
    }
    speed.set(random(1,5) * direction, random(1,5) * direction);
  }
}

