void clock() {
  //making clock frame
  fill(0,80);
  noStroke();
  ellipse(400, 60, 100, 100);
  fill(255,80);
  ellipse(400, 60, 10, 10);
  stroke(255,80);
  strokeWeight(8);
  strokeCap(ROUND);
  //making second hand, middle hand
  pushMatrix();
  translate(400, 60);
  rotate(theta/2);
  line(0, 0, 0, 30);
  popMatrix();
  pushMatrix();
  translate(400, 60);
  rotate(theta*20);
  line(0, 0, 0, -50);
  popMatrix();
}
