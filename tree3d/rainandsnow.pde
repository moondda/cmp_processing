class RainandSnow
//rain and snow has same move function but different display

{
  float xpos;
  float ypos;
  float speed;
  float h;
  float snowsize;
  float gravity;

  RainandSnow(float xpos, float ypos) {
    this.xpos = xpos;
    this.ypos = ypos;
    //the speed of rain&snow is random
    speed = random(2, 3);
    //the place(height) where ran&snow start is random
    h = random(10, 20);
    snowsize=random(3, 10);
  }

  void displayrain() {
    stroke(#00BFE3,127);
    strokeWeight(2);
    line(xpos, ypos, xpos, ypos+h);
  }

  void displaysnow() {
    fill(255, 255, 255);
    noStroke();
    ellipse(xpos, ypos, snowsize, snowsize);
  }

  void move() {
    //the rain&snow speed change depending on the gravity
    ypos += (speed + gravity);
    gravity += 0.2;
    //When it rains or snows on the floor, it comes back to the clouds
    if (ypos > height/2) {
      ypos = 140;
      xpos = random(cloud1+10, cloud1+280);
      gravity = 0;
    }
  }
  void move2() {
    ypos += (speed + gravity);
    gravity += 0.2;
    if (ypos > height/2) {
      ypos = 110;
      xpos = random(cloud2+10, cloud2+180);
      gravity = 0;
    }
  }
}
