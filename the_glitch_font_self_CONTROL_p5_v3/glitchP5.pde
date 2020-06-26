

import java.util.ArrayList;
import processing.core.PApplet;

public class GlitchP5
{
  PApplet parent;
  GlitchFX glfx;
  ArrayList<TimedGlitcher> timedGlitchers = new ArrayList();



  public GlitchP5(PApplet parent)
  {
    this.parent = parent;
    this.glfx = new GlitchFX(parent);
   
  }

  public void run()
  {
    this.glfx.open();

    for (int i = this.timedGlitchers.size() - 1; i >= 0; i--)
    {

      TimedGlitcher tg = (TimedGlitcher)this.timedGlitchers.get(i);
    

      tg.run();

     
      if (tg.done()) {

        this.timedGlitchers.remove(tg);
      }
    }

    this.glfx.close();
  }

  public void glitch(int x, int y, int spreadX, int spreadY, int diaX, int diaY, int amount, float randomness, int attack, int sustain)
  {
    for (int i = 0; i < amount; i++)
    {

      int att = (int)this.parent.random(attack);
      this.timedGlitchers.add(new TimedGlitcher((int)(x + this.parent.random(-spreadX / 2, spreadX / 2)), 
        (int)(y + this.parent.random(-spreadY / 2, spreadY / 2)), 
        (int)(diaX * randomness), (int)(diaY * randomness), 
        randomness, att, (int)this.parent.random(sustain)));
    }
  }

  public class TimedGlitcher
  {
    int x;
    int y;
    int diaX;
    int diaY;
    int on;
    int timer;
    int startTime;
    float randomness;
    int sX;
    int sY;
    int onset = 0;



    TimedGlitcher(int x, int y, int diaX, int diaY, float randomness, int on, int time)
    {
      this.x = x;
      this.y = y;
      this.diaX = diaX;
      this.diaY = diaY;
      this.randomness = randomness;
      this.on = on;
      this.startTime=time;
      this.timer = time;
      float ran=200.0;
      this.sX = ((int)GlitchP5.this.parent.random(-ran, ran));
      this.sY = ((int)GlitchP5.this.parent.random(-ran, ran));
    }

    void run()
    {

      if (this.onset >= this.on)
      {
        GlitchP5.this.glfx.glitch(this.x, this.y, this.diaX, this.diaY, this.sX, this.sY);
        this.timer -= 1;
      }
      this.onset += 1;
    }

    public  boolean done()
    {
      if (this.timer <= 0) {
        return true;
      }
      return false;
    }
  }
}
