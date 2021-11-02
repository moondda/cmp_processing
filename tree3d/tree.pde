class tree {
//This code is to place trees on the side. 
//recursive function
//A total of 12 trees appear on the screen six on the left and right,
//the tree shape is slightly different because the arrangement of tree branches is random.

  float k=random(1.0);
  float g=random(-0.1, 0.1);
//branch angle
  float p=random(0.2, 0.6);
  float i=0.001;
//depth is the number of branches you stretch out 

  void branch(int depth) {
    if (depth < 12) {
      fill(150, 75, 0);
      stroke(150, 75, 0);
      strokeWeight(1);
      rect(0, 0, 10, -height/20);
      {
        translate(0, -height/20);
        if (g < 0.6) {
          rotate(p);
          scale(0.7);
          pushMatrix();
          branch(depth + 1);
          popMatrix();
          rotate(-2*p);
          pushMatrix();
          branch(depth + 1);
          popMatrix();
        } else {
          branch(depth);
        }
      }
    } else {
      //flower
      noStroke();
      fill(#ffd1dc);
      ellipse(0, 0, random(50, 70), random(30, 50));

      fill(187, 141, 184);
      ellipse(-100, -100, random(30, 50), random(30, 50));

      fill(237, 161, 137);
      ellipse(100, 100, random(30, 50), random(30, 50));
    }
  }
}
