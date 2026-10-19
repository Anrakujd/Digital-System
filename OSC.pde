class OSC {
  boolean output = false;
  int waktuSebelumnya = 0;
  int x;
  int y;
  int h;
  String text = "" ;
  int waktu = 1000;    //mili detik 1000 mili detik = 1 detik

  boolean aktif = false;
  boolean inputBaru = true;

  OSC(int posX, int posY, int lebar) {
    x = posX;
    y = posY;
    h = lebar;
    text = str(waktu);
  }

  void timer() { 
    if (millis() - waktuSebelumnya >= waktu) {
      output = !output;
      waktuSebelumnya += waktu;
    }
  }

  boolean getOutputTimer() {
    return output;
  }

  void display() {
    if (aktif) {
      fill(255, 245, 200);
    } else {
      fill(220);
    }
    stroke(0);
    rect(x, y, 3*h, h, h/5, h/5, h/5, h/5);
    fill(0);
    textSize(16);
    textAlign(LEFT, CENTER);
    text("time: ", x+h/5, y+h/2);

    String tampilan = text;
    if (aktif && frameCount % 60 < 30) {
      tampilan += "|";
    }
    text(tampilan, x +h*1.5, y + h/2);
    textAlign(LEFT, BASELINE);
  }

  void mousePressed() {
    if (mouseX >= x && mouseX <= x + 3*h && mouseY >= y && mouseY <= y + h) {
      if (!aktif) {
        inputBaru = true;

        aktif = true;
      } else {
        aktif = false;
      }
    }
  }

  void key() {
    if (!aktif) return;

    if (key == BACKSPACE) {
      if (inputBaru) {
        text = "";
        inputBaru = false;
      } else if (text.length() > 0) {
        text = text.substring(0, text.length() - 1);
      }
    } else if (key == ENTER || key == RETURN) {
      try {
        int nilai = Integer.parseInt(text);

        if (nilai > 0) {
          waktu = nilai;
        }
      }
      catch (NumberFormatException e) {
      }

      text = str(waktu);
      aktif = false;
      inputBaru = true;
    } else if (key >= '0' && key <= '9') {
      if (inputBaru) {
        text = "";
        inputBaru = false;
      }

      if (text.length() < 8) {
        text += key;
      }
    }
  }
}
