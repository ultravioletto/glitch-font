import controlP5.*;

ControlFrame cf;
int timeForColor;



void setupCP5() {
  cf = new ControlFrame(this, 500, 800, "Controls");
  surface.setLocation(0, 0);
  noStroke();
}


class ControlFrame extends PApplet {

  int w, h;
  PApplet parent;
  ControlP5 cp5;
  boolean saveMe=false;
  boolean loadMe=true;
  ControlTimer controlTimerSustain, controlTimerDoColor, controlTimerChangeLetter;
  Textlabel timeSustain, timeDoColor, timeChangeLetter;


  public ControlFrame(PApplet _parent, int _w, int _h, String _name) {
    super();   
    parent = _parent;
    w=_w;
    h=_h;


    PApplet.runSketch(new String[]{this.getClass().getName()}, this);
  }

  public void settings() {
    size(w, h);
  }

  public void setup() {
    surface.setLocation(10, 10);
    cp5 = new ControlP5(this);
    println("DATA IS "+parent.dataPath(""));

    controlTimerSustain = new ControlTimer();
    controlTimerSustain.setSpeedOfTime(1);


    timeSustain = new Textlabel(cp5, "--", 100, 100);
    timeSustain.setPosition(10, height-20);


    controlTimerDoColor = new ControlTimer();
    controlTimerDoColor.setSpeedOfTime(1);
    timeForColor=3;

    timeDoColor = new Textlabel(cp5, "--", 100, 100);
    timeDoColor.setPosition(100, height-20);


    controlTimerChangeLetter = new ControlTimer();
    controlTimerChangeLetter.setSpeedOfTime(1);


    timeChangeLetter = new Textlabel(cp5, "--", 100, 100);
    timeChangeLetter.setPosition(200, height-20);




    cp5.addSlider("glitch_SizeX")
      .plugTo(parent, "glitch_SizeX")
      .setRange(1, parent.width)
      .setValue(50)
      .setPosition(10, 10)
      .setSize(300, 30);


    cp5.addSlider("glitch_SizeY")
      .plugTo(parent, "glitch_SizeY")
      .setRange(1, parent.height)
      .setValue(parent.height)
      .setPosition(10, 50)
      .setSize(300, 30);

    cp5.addSlider("glitch_numberOfGlitches")
      .plugTo(parent, "glitch_numberOfGlitches")
      .setRange(1, 500)
      .setValue(40)
      .setPosition(10, 90)
      .setSize(300, 30);


    cp5.addSlider("glitch_sustain")
      .plugTo(parent, "glitch_sustain")
      .setRange(1, 1000)
      .setValue(200)
      .setPosition(10, 130)
      .setSize(300, 30);

    cp5.addSlider("glitch_num_cicles")
      .plugTo(parent, "glitch_num_cicles")
      .setRange(1, 50)
      .setValue(1)
      .setPosition(10, 170)
      .setSize(300, 30);





    cp5.addSlider("glitch_posX")
      .plugTo(parent, "glitch_posX")
      .setRange(1, parent.width)
      .setValue(10)
      .setPosition(10, 210)
      .setSize(300, 30);

    cp5.addSlider("glitch_randomness_posX")
      .plugTo(parent, "glitch_randomness_posX")
      .setRange(0, parent.width)
      .setValue(parent.width)
      .setPosition(10, 250)
      .setSize(300, 30);


    cp5.addSlider("glitch_posY")
      .plugTo(parent, "glitch_posY")
      .setRange(1, parent.height)
      .setValue(parent.height)
      .setPosition(10, 290)
      .setSize(300, 30);

    cp5.addSlider("glitch_randomness_posY")
      .plugTo(parent, "glitch_randomness_posY")
      .setRange(0, parent.height)
      .setValue(parent.height)
      .setPosition(10, 330)
      .setSize(300, 30);


    cp5.addSlider("glitch_randomness")
      .plugTo(parent, "glitch_randomness")
      .setRange(0, 2)
      .setValue(1)
      .setPosition(10, 370)
      .setSize(300, 30);



    cp5.addToggle("blackAndWithe")
      .setPosition(10, 410)
      .plugTo(parent, "blackAndWithe")
      .setSize(30, 30)
      ;

    cp5.addBang("saveMe")
      .setPosition(80, 410)
      .setSize(30, 30)
      ;

    cp5.addBang("loadMe")
      .setPosition(150, 410)
      .setSize(30, 30)
      ;
    cp5.addToggle("saveSequence")
      .plugTo(parent, "saveSequence")

      .setPosition(10, 480)
      .setSize(30, 30)
      ;
  }

  void draw() {
    background(190);
    timeSustain.setValue(controlTimerSustain.toString());
    timeDoColor.setValue(controlTimerDoColor.toString());
    timeChangeLetter.setValue(controlTimerChangeLetter.toString());


    timeSustain.draw(this);
    timeDoColor.draw(this);
    timeChangeLetter.draw(this);


/*
    if (controlTimerSustain.second()==5) {

      cp5.getController("glitch_sustain").setValue(random(100, 900));
      controlTimerSustain.reset();
    }

    if (controlTimerDoColor.second()==timeForColor) {
      int stateController = (int)cp5.getController("blackAndWithe").getValue()==0 ? 1 : 0;
      if (stateController==1) {
        timeForColor=10;
      } else {
        timeForColor=5;
      }
      cp5.getController("blackAndWithe").setValue(stateController*-1);
      controlTimerDoColor.reset();
    }
*/
    if (controlTimerChangeLetter.second()==10) {

    //  cp5.getController("glitch_numberOfGlitches").setValue(random(20, 100));


      advanceCounterGlyphs();
      controlTimerChangeLetter.reset();
    }


    if (saveMe) {
      cp5.saveProperties(parent.dataPath("data"));
      saveMe=false;
    }
    if (loadMe) {
      println("ssss");

      cp5.loadProperties(parent.dataPath("data"));
      loadMe=false;
    }
  }

  void saveControlP5() {
  }
}
