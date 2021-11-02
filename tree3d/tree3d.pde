import processing.sound.*;
import g4p_controls.*;
import java.awt.Font;
import ddf.minim.*;

PGraphics pg;
PFont f,f0;
Font f1, f2;
XML xml;
int micro = 0;
float vol = 0;
Minim minim;
AudioPlayer song;
maincode p1;
ending p2;
//star
float[] starx = new float[100];
float[] stary = new float[100];
float[] starradius =new float[100];
color[] starc = new color[100];
//snow on the foor
float[] sx = new float[10000];
float[] sy = new float[10000];
float[] ss = new float[10000];
float[] sc = new float[10000];

PImage img5;
PImage usan;
PImage snowman;
PImage musicbox;
PImage mscreen;
PImage escreen;

float r=160;
float g=142;
float b=200;
float theta = 0;
float cloud1=10;
float cloud2=500;
float cldspd1 = 0.2;
float cldspd2 = 0.3;
float radius=300;

int cl = 1;
int rainnum = 80;
int page = 0;
int start = 1;

boolean rain = false;
boolean snow = false;

GButton startB, endB, creditB, mainB;
tree tr[]=new tree[7];
RainandSnow myrain[] = new RainandSnow[rainnum];
RainandSnow myrain2[] = new RainandSnow[rainnum];

void setup() {
  size(800, 800, P3D);
  pg = createGraphics(width, height, P3D); 
  f =createFont("BookmanOldStyle", 20);
  f0=createFont("Ravie",30);
  f1 = new Font("AgencyFB", Font.BOLD, 20);
  f2 = new Font("Arial", Font.ITALIC, 15);
  p1 = new maincode();
  p2 = new ending();
  G4P.setCtrlMode(GControlMode.CENTER);

//making buttons on the start screen
  startB = new GButton(this, width/2, 300, 300, 50, "Start");
  endB = new GButton(this, width/2, 500, 300, 50, "Exit");
  creditB = new GButton(this, width/2, 400, 300, 50, "Credit");
  mainB = new GButton(this, 50, 25, 100, 50, "Go Main");
  startB.setFont(f1);
  endB.setFont(f1);
  creditB.setFont(f1);
  mainB.setFont(f2);

  musicbox = loadImage("musicboxx.png");
  img5= loadImage("1029cloud.png");
  usan=loadImage("uuusan.png");
  snowman=loadImage("sssnowman.png");
  mscreen=loadImage("main.jpg");
  escreen=loadImage("ending.jpg");
  
  minim = new Minim(this);
  song = minim.loadFile("bgm.mp3");
  song.setGain(vol);
  song.play();
  song.loop();

  tr[0]=new tree();
  tr[1]=new tree();
  tr[2]=new tree();
  tr[3]=new tree();
  tr[4]=new tree();
  tr[5]=new tree();

  for (int i = 0; i < rainnum; i++)
  {
    myrain[i] = new RainandSnow(random(cloud1+10, cloud1+200), random(100, height));
    myrain2[i] = new RainandSnow(random(cloud2+10, cloud2+200), random(100, height));
  }
  //getting fine dust api
  xml = loadXML("http://apis.data.go.kr/B552584/ArpltnInforInqireSvc/getMsrstnAcctoRltmMesureDnsty?serviceKey=Du0UB6dzM0J1jWD18VKRFyKqGrD%2BUpFGH%2F8X0ccJ7wOZVsaZoHeLmuauSxke2XWk723zV5pNLQ06omg97FgqIw%3D%3D&returnType=xml&numOfRows=100&pageNo=1&stationName=%EA%B4%91%EA%B5%90%EB%8F%99&dataTerm=DAILY&ver=1.0");
  XML[]children = xml.getChildren("body");
  for (int i=0; i< children.length; i++) {
    XML Element = children[i].getChild("items").getChild("item").getChild("pm10Value");
    String pm10 = Element.getContent();
    micro=Integer.parseInt(pm10);
  }

  smooth();
}

void draw() {

  image(pg, 0, 0);


  if (page == 1) {
    p1.drawPage();
    p1.display();
    creditB.setVisible(false);
    endB.setVisible(false);
    startB.setVisible(false);
    mainB.setVisible(true);
  } else if (page == 2) {
    p2.drawPage();
    creditB.setVisible(false);
    endB.setVisible(false);
    startB.setVisible(false);
    mainB.setVisible(true);
  } else {
    pg.beginDraw();
    pg.image(mscreen, 0, 0, 800, 800);
    pg.textFont(f0);
    pg.textSize(100);
    pg.text("Healing", 20, 150);
    pg.text("Stroll", 150, 250);
    pg.endDraw();
    mainB.setVisible(false);
    creditB.setVisible(true);
    endB.setVisible(true);
    startB.setVisible(true);
  }
}
public void handleButtonEvents(GButton button, GEvent event) {
  if (button == creditB) {
    page = 2;
  } else if ( button == startB) {
    page = 1;
  } else if ( button == mainB) {
    page = 0;
  } else if ( button == endB) {
    exit();
  }
}
int i = 0;
boolean on = false;
void mousePressed() {
  //music on&off
  if ( on==false && mousePressed &&(mouseX>0 &&mouseX<100)&&(mouseY>700&&mouseY<800)) {
    song.mute();
    musicbox.filter(INVERT);
    on = true;
  } else if (song.isPlaying() && mousePressed&&(mouseX>0 &&mouseX<100)&&(mouseY>700&&mouseY<800)) {
    song.unmute();
    musicbox.filter(INVERT);
    on = false;
  }
  //drawing stars at night
  if (mouseButton == LEFT&&(mouseX>0&&mouseX<800&&mouseY>0&&mouseY<400)&& (theta>PI&&theta<2*PI)) {
    starx[i] = mouseX;
    stary[i] = mouseY;
    starradius[i] = random(5, 15);
    starc[i] = color(random(100, 255), random(100, 255), random(100, 255));
    i++;
  }
  //erasing stars
  else if ( mouseButton == RIGHT &&(mouseX>0&&mouseX<800&&mouseY>0&&mouseY<400)&& (theta>PI&theta<2*PI)) {
    for (int j =0; j<100; j++) {
      starradius[j] = 0;
    }
  }
  //snow on the ground
  else if ( snow == true&&rain ==false && mouseButton == RIGHT && ((mouseX>700)&&(mouseX<800)&&(mouseY>700)&&(mouseY<800))) {
    for (int n = 0; n<3000; n++) {
      sx[n] = random(width);
      sy[n] = random(400, height);
      ss[n] = random(3, 10);
      sc[n] = random(220, 250);
    }
  }
}
void mouseClicked() {
  //rain and snow falling using button
  if ((mouseX>600)&&(mouseX<700)&&(mouseY>700)&&(mouseY<800)) rain = !rain;
  if (mouseButton==LEFT&&(mouseX>700)&&(mouseX<800)&&(mouseY>700)&&(mouseY<800)) snow = !snow;
}

void keyPressed() {
  //adjusting music volume
 if(keyCode == UP){
   song.shiftGain(vol,5,1000);
   vol +=5;
 } else if (keyCode==DOWN){
   song.shiftGain(vol,-5,1000);
   vol-=5;
 }
}

float x0 = 0;
float x1 =23.6;
float x2 = 42;
float x3 = 64;
float x4 = 84;
float x5=108;

float y0 = 0;
float y1 = 23.6;
float y2 =42;
float y3=64;
float y4=84;
float y5=108;

float z0= 0.03;
float z1=236;
float z2=420;
float z3=640;
float z4=840;
float z5=1080;
