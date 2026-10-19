//++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++       Universitas Katolik Parahyangan      +++++
//+++++      Program Studi Pendidikan TIK-FKIP     +++++
//+++++    ANIMASI BINARY COUNTER DAN 7 SEGMENTS   +++++
//+++++           Dibuat Oleh : Djukarna           +++++
//+++++               Bandung - 2026               +++++
//++++++++++++++++++++++++++++++++++++++++++++++++++++++
 
JKF jkf1;
JKF jkf2;
JKF jkf3;
JKF jkf4;
OSC osc;
LAMPU lampu;
LAMPU lampu2;
LAMPU lampu3;
LAMPU lampu4;
LAMPU lampu5;
PImage img;
SEVEN_SEGMENT S7;
BCD IC;

void setup() {
  size(1000, 750);
  jkf1 = new JKF(400, 100, 100);
  jkf2 = new JKF(400, 250, 100);
  jkf3 = new JKF(400, 400, 100);
  jkf4 = new JKF(400, 550, 100);
  lampu2 = new LAMPU(150, 200, 50, 50);
  lampu = new LAMPU(650, 105, 50, 50);
  lampu3 = new LAMPU(650, 255, 50, 50);
  lampu4 = new LAMPU(650, 405, 50, 50);
  lampu5 = new LAMPU(650, 555, 50, 50);
  osc = new OSC(100, 100, 50);
  img = loadImage("data/logo.png");
  S7 = new SEVEN_SEGMENT(800, 300, 100);
  IC = new BCD (800, 500, 120);
}

void draw() {
  background(200);
  img.resize(130, 115);
  image(img, 800, 10);
  fill(0, 0, 120);
  textSize(24);
  text("4 Bit Binary Counter Using J-K Flip Flop", 300, 50);
  textSize(18);
  text("Djukarna@2026", 800, 700);

  osc.display();
  osc.timer();

  jkf1.setInputJ(true);
  jkf1.setInputK(true);
  jkf1.setInputClk(osc.getOutputTimer());

  jkf2.setInputJ(true);
  jkf2.setInputK(true);
  jkf2.setInputClk(jkf1.Qout());

  jkf3.setInputJ(true);
  jkf3.setInputK(true);
  jkf3.setInputClk(jkf2.Qout());

  jkf4.setInputJ(true);
  jkf4.setInputK(true);
  jkf4.setInputClk(jkf3.Qout());

  jkf1.display();
  jkf1.update();
  jkf2.display();
  jkf2.update();
  jkf3.display();
  jkf3.update();
  jkf4.display();
  jkf4.update();

  lampu.display(jkf1.Qout());
  lampu3.display(jkf2.Qout());
  lampu4.display(jkf3.Qout());
  lampu5.display(jkf4.Qout());
  lampu2.display(osc.getOutputTimer());

  //garis dan text keterangan
  stroke(0, 0, 200);
  strokeWeight(2);
  textSize(16);
  line(120, 150, 120, 225);
  line(120, 225, 150, 225);
  text("Clock", 150, 95);
  text("5V", 230, 705);
  line(250, 125, 300, 125);
  line(300, 125, 300, 150);
  line(300, 150, 400, 150);
  line(510, 128, 650, 128);
  line(510, 278, 650, 278);
  line(510, 428, 650, 428);
  line(510, 578, 650, 578);

  line(400, 300, 300, 300);
  line(300, 300, 300, 225);
  line(300, 225, 550, 225);
  line(550, 225, 550, 127);

  line(400, 450, 300, 450);
  line(300, 450, 300, 375);
  line(300, 375, 550, 375);
  line(550, 375, 550, 280);

  line(400, 600, 300, 600);
  line(300, 600, 300, 525);
  line(300, 525, 550, 525);
  line(550, 525, 550, 427);

  stroke(255, 0, 0);
  line(350, 120, 350, 700);
  line(350, 700, 250, 700);
  line(350, 120, 390, 120);
  line(350, 180, 390, 180);
  line(350, 270, 390, 270);
  line(350, 330, 390, 330);
  line(350, 420, 390, 420);
  line(350, 480, 390, 480);
  line(350, 570, 390, 570);
  line(350, 630, 390, 630);
  
  S7.display();
  S7.display_a(IC.aout());
  S7.display_b(IC.bout());
  S7.display_c(IC.cout());
  S7.display_d(IC.dout());
  S7.display_e(IC.eout());
  S7.display_f(IC.fout());
  S7.display_g(IC.gout());
  
  IC.display();
  IC.update();
  //set input IC BCD ke saklar
  IC.setInputA(jkf4.Qout());
  IC.setInputB(jkf3.Qout());
  IC.setInputC(jkf2.Qout());
  IC.setInputD(jkf1.Qout());
}

void keyTyped() {
  osc.key();
}

void mousePressed() {
  osc.mousePressed();
}
