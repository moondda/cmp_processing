class ending {
  void drawPage() {

    pg.beginDraw();
    pg.image(escreen,0,0,800,800);
    pg.textAlign(CENTER);
    pg.textSize(30);
    pg.textFont(f);
    //credit
    pg.text("This program is made by\n Jang YuTae\nMoon DaHyun\nJung Hyeyeon ", 
    width/2, 250);
    pg.endDraw();
  }
}
