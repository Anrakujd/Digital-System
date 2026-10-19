class JKF{
  int x;
  int y;
  int w;
  float h;
  boolean inputJ;
  boolean inputK;
  boolean inputClk;
  boolean Q = false;
  boolean clk_sebelumnya = false;
 
 JKF(int posX, int posY, int lebar){
   x = posX;
   y = posY;
   w = lebar;
   h = lebar;  
 }
 
 void display(){
  fill(255);
  stroke(0);
  strokeWeight(2);
  rect(x, y, w, h);
  fill(0);
  textSize(w/4);
  text("J-K", x+w/3, y+h/1.75);
  textSize(w/6);
  text("Clk", x+w/14, y+h/1.9);
  text("J", x+w/14, y+h/4);
  text("K", x+w/14, y+h/1.2);
  text("Q", x+w/1.2, y+h/3);
  line(x+w/1.2, y+h/1.7, x+0.9*w, y+h/1.7);
  text("Q", x+w/1.2, y+h/1.35);
  line(x+w, y+h/1.5, x+1.2*w, y+h/1.5);
  line(x+w, y+h/3.5, x+1.2*w, y+h/3.5);
  line(x, y+h/1.25, x-0.2*w, y+h/1.25);
  line(x, y+h/2, x-0.2*w, y+h/2);
  line(x, y+h/5, x-0.2*w, y+h/5);
 }
  
 void setInputJ(boolean value){
   inputJ = value;
 }
 
 void setInputK(boolean value){
   inputK = value;
 }
 
 void setInputClk(boolean value){
   inputClk = value;
 }
 
 void update(){
  // Deteksi rising edge: LOW -> HIGH
  if (clk_sebelumnya && !inputClk) {

    if (!inputJ && !inputK) {
      // Hold: Q tidak berubah
    }
    else if (!inputJ && inputK) {
      // Reset
      Q = false;
    }
    else if (inputJ && !inputK) {
      // Set
      Q = true;
    }
    else {
      // J = 1 dan K = 1: Toggle
      Q = !Q;
    }
 }
 clk_sebelumnya = inputClk;
 }
 
 boolean Qout(){
  return Q; 
 }
  
}
