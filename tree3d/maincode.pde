class maincode {
  void drawPage() {
    pg.beginDraw();
    pg.background(255);
    pg.endDraw();
  }
  void display() {
    background(150);
    song.play();
    
 //changing sky color(getting brighter&darker depending on the time )
  if(theta>0&&theta<PI/2){
fill(r,g,b);rect(0,0,width,height/2);r=r+0.2;g=g+0.2;b=b+0.2; }
if(theta>=PI/2&&theta<3*PI/2){
fill(r,g,b);rect(0,0,width,height/2);r=r-0.2;g=g-0.2;b=b-0.2;}
if(theta>=3*PI/2&&theta<2*PI){
fill(r,g,b);rect(0,0,width,height/2);r=r+0.2;g=g+0.2;b=b+0.2;}

//changing sky color when raining or snowing
    if (rain == true || snow== true) {
      fill(80, 100);
      rect(0, 0, width, height/2);
    }

//making stars
    if (theta>PI&&theta<2*PI) {
      for (int i = 0; i <100; i++) {
        fill(starc[i], random(200, 255));
        noStroke();
        ellipse(starx[i], stary[i],starradius[i],starradius[i]);
      }
   
    }
    if (rain)
    {
      for (int i = 0; i< rainnum; i++)
      {
        myrain[i].displayrain();
        myrain[i].move();
        myrain2[i].displayrain();
        myrain2[i].move2();
      }
      sg = 0;
    }
    if (snow)
    {
      for (int i = 0; i< rainnum; i++)
      {
        myrain[i].displaysnow();
        myrain[i].move();
        myrain2[i].displaysnow();
        myrain2[i].move2();
      }
      sg+=1;
    }
    cloud();
    clock();
    theta+=0.005;
    
if(theta>2*PI) theta=theta-2*PI;

float moonx=radius*cos(theta);
float moony=radius*sin(theta);
float sunx=radius*cos(PI+theta);
float suny=radius*sin(PI+theta);

//sun and moon rise and set depending on time(theta)
noStroke();
fill(255,0,0);
ellipse(sunx+width/2, suny+height/2,50,50);
fill(#FFD400);
ellipse(moonx+width/2,moony+height/2,50,50);

    
//making pink grass
    fill(#ffa7cb);
    rect(0, 400, 800, 400);
    
//making a road(1) - soil   
    beginShape();
    fill(150, 75, 0);
    vertex(0, 630);
    vertex(0, 800);
    vertex(800, 800);
    vertex(800, 630);
    vertex(440, 400);
    vertex(370, 400);
    vertex(0, 630);
    endShape();
//making a road(2)  - sidewalk
    beginShape();
    fill(#ffd4b1);
    vertex(0, 680);
    vertex(0, 800);
    vertex(800, 800);
    vertex(800, 680);
    vertex(430, 400);
    vertex(380, 400);
    vertex(0, 680);
    endShape();

//snow on the ground
    if (snow == true && rain == false) {
      for (int i = 0; i < 1000; i++) {
        fill(sc[i]);
        noStroke();
        ellipseMode(CENTER);
        ellipse(sx[i], sy[i], ss[i], ss[i]);
      }
    }
//buttons(music,rain,snow)
    image(musicbox, 0, 700, 100, 100);
    image(usan, 600, 700, 100, 100);
    image(snowman, 700, 700, 100, 100);
    
//mouse pointer
    fill(0, 0, 0, 0);
    stroke(216, 174, 250, 150);
    ellipse(mouseX, mouseY, 30, 30);
    
    microcheck();
    date();


//placing trees on the side
    translate(width/2, height/2);
    scale(0.5);
    pushMatrix();
    translate(y0+60, x0, z0);
    tr[0].branch(5);
    popMatrix();
    pushMatrix();
    translate(-y0-60, x0, z0);
    tr[0].branch(5);
    popMatrix();

    pushMatrix();
    translate(y1+60, x1, z1);
    tr[1].branch(5);
    popMatrix();
    pushMatrix();
    translate(-y1-60, x1, z1);
    tr[1].branch(5);
    popMatrix();

    pushMatrix();
    translate(y2+60, x2, z2);
    tr[2].branch(5);
    popMatrix();
    pushMatrix();
    translate(-y2-60, x2, z2);
    tr[2].branch(5);
    popMatrix();

    pushMatrix();
    translate(y3+60, x3, z3);
    tr[3].branch(5);
    popMatrix();
    pushMatrix();
    translate(-y3-60, x3, z3);
    tr[3].branch(5);
    popMatrix();

    pushMatrix();
    translate(y4+60, x4, z4);
    tr[4].branch(5);
    popMatrix();
    pushMatrix();
    translate(-y4-60, x4, z4);
    tr[4].branch(5);
    popMatrix();

    pushMatrix();
    translate(y5+60, x5, z5);
    tr[5].branch(5);
    popMatrix();
    pushMatrix();
    translate(-y5-60, x5, z5);
    tr[5].branch(5);
    popMatrix();

//trees moving forward(user-centered)
    x0+=0.2; x1+=0.2; x2+=0.2; x3+=0.2; x4+=0.2; x5+=0.2;
    y0+=0.2; y1+=0.2; y2+=0.2; y3+=0.2; y4+=0.2; y5+=0.2;
//trees getting bigger
    z0+=2; z1+=2; z2+=2; z3+=2; z4+=2; z5+=2;
    
//If the trees go to the end of the screen, it comes back.   
  if(x0>120) {x0=0.01; y0=0.03; z0=0.03;}
  if(x1>120) {x1=0.01; y1=0.03; z1=0.03;}
  if(x2>120) {x2=0.01; y2=0.03; z2=0.03;}
  if(x3>120) {x3=0.01; y3=0.03; z3=0.03;}
  if(x4>120) {x4=0.01; y4=0.03; z4=0.03;}
  if(x5>120) {x5=0.01; y5=0.03; z5=0.03;}
  
  
  }

//The concentration of fine dust
  void microcheck(){
  if (micro<=30) {
        fill(#4F95FC);
        textFont(f0);
        text("BEST", 700, 50);
      } else if (micro>30&&micro<=80) {
        fill(189,236,182);
        textFont(f0);
        text("GOOD", 690,80);
      } else if (micro>80&&micro<=150) {
        fill(#ffb42e);
        textFont(f0);
        text("BAD", 700, 75);
      } else if (micro>150) {
        fill(#ff3131);
        textFont(f0);
        text("WORST", 700, 75);
      }
      textFont(f0);
      text(micro, 720,40);
  }
//the date
void date() {
 int d = day();
 int m = month();
 int y= year();
       fill(136,133,164);
        textFont(f0);
 text("  Today is ..."+" ",140,770);
 text("  "+y+ "." + m + "." + d , 380, 770);
}

//cloud moving
  void cloud() {
    image(img5, cloud1, 90, 300, 130);
    cloud1 = cloud1 + cldspd1;
//When the clouds go to the end of the screen, they bounce and come back
    if (cloud1+300>=width||cloud1<=0) {
      cldspd1=-cldspd1;
    }
    image(img5, cloud2, 60, 200, 100);
    cloud2 = cloud2 + cldspd2;
    if (cloud2+200>=width||cloud2<=0) {
      cldspd2=-cldspd2;
    }
  }
}
