

import processing.core.PApplet;

public class GlitchFX
{
  PApplet parent;
  int[] area = new int[0];
  int[] area_ = new int[0];
  int lastxPos;
  int lastyPos;
  int lastw;
  int lasth;
  int lastsX;
  int lastsY;
  int[] lastPixels;

  
  GlitchFX(PApplet p)
  {
    this.parent = p;
    this.lastPixels = new int[this.parent.width * this.parent.height];
      

  }
  
  void open()
  {
    this.parent.loadPixels();
     

  }
  
  void close()
  {
    this.parent.updatePixels();
    PApplet.arrayCopy(this.parent.pixels, this.lastPixels);
      

  }
  
  void glitch(int xPos, int yPos, int w, int h, int sX, int sY)
  {
    computeArea(xPos, yPos, w, h, sX, sY);
    
  int shiftr = (int)this.parent.random(16.0F); //16

    if (this.area.length < this.area_.length) {
      for (int j = 0; j < this.area.length; j++) {
        this.parent.pixels[this.area[j]] = this.lastPixels[this.area_[j]];
      }
    } else if(!blackAndWithe){
      for (int j = 0; j < this.area_.length; j++) {
        this.parent.pixels[this.area[j]] += (this.lastPixels[this.area_[j]] << shiftr);
     //   this.parent.pixels[this.area[j]] = (0xFFFFFF - this.parent.pixels[this.area[j]]) | 0xFFFF0000;
      }
    }
  }
  
  void computeArea(int xPos, int yPos, int w, int h, int sX, int sY)
  {
    if ((xPos != this.lastxPos) || (yPos != this.lastyPos) || (w != this.lastw) || (h != this.lasth) || (sX != this.lastsX) || (sY != this.lastsY))
    {
      int startX = PApplet.constrain(xPos - w / 2, 0, this.parent.width - 1);
      int startY = PApplet.constrain(yPos - h / 2, 0, this.parent.height - 1);
      int endX = PApplet.constrain(xPos + w / 2, 0, this.parent.width - 1);
      int endY = PApplet.constrain(yPos + h / 2, 0, this.parent.height - 1);
      
      int startX_ = PApplet.constrain(xPos - w / 2 + sX, 0, this.parent.width - 1);
      int startY_ = PApplet.constrain(yPos - h / 2 + sY, 0, this.parent.height - 1);
      int endX_ = PApplet.constrain(xPos + w / 2 + sX, 0, this.parent.width - 1);
      int endY_ = PApplet.constrain(yPos + h / 2 + sY, 0, this.parent.height - 1);
      
      w = Math.abs(startX - endX);
      h = Math.abs(startY - endY);
      
      this.area = new int[w * h];
      int i = 0;
      for (int y = startY; y < endY; y++) {
        for (int x = startX; x < endX; x++)
        {
          this.area[i] = (this.parent.width * y + x);
          i++;
        }
      }
      w = Math.abs(startX_ - endX_);
      h = Math.abs(startY_ - endY_);
      this.area_ = new int[w * h];
      i = 0;
      for (int y = startY_; y < endY_; y++) {
        for (int x = startX_; x < endX_; x++)
        {
          this.area_[i] = (this.parent.width * y + x);
          i++;
        }
      }
    }
    this.lastxPos = xPos;
    this.lastyPos = yPos;
    this.lastw = w;
    this.lasth = h;
    this.lastsX = sX;
    this.lastsY = sY;
  }
}
