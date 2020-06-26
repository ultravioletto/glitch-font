GlitchP5 glitchP5;



int fontSize ;
PFont myFont;
char[] glyphs={'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '!', '?', '€', '$', '&', '+', '-', '.', ','};
int counterGlyphs;
boolean saveSequence=false;
boolean blackAndWithe=true;
void settings() {
  size(1500, 1500);
}

void setup() {
  setupCP5();
  fontSize=(int)(height/1.2);
  counterGlyphs=0;

  glitchP5 = new GlitchP5(this); // initiate the glitchP5 instance;
//println(PFont.list());

  myFont = createFont("Gotham-Bold.otf", fontSize);
  textFont(myFont);

    colorMode(HSB);



  noStroke();
  fill(255);
  textAlign(CENTER, CENTER);
 // initSound();
}
float angle=0;
void draw() {
  background(0);
  text(glyphs[counterGlyphs], width/2, height/2);

  /* draw a moving rerctangle
   float h=map(sin(angle),-1,1,10,width-100);
   rectMode(CENTER);
   rect(width/2,height/2,200,h);
   angle+=0.01;
   
   */
     if(frameCount%40==0) doGlitch();

  glitchP5.run();
  if (saveSequence) { 

    if (frameCount%20==0) saveFrame("saved/"+"saved_"+glyphs[counterGlyphs]+"_######.png");
  }
}

void saveMe() {
  save("saveSingleFrame/"+counterGlyphs+"frame"+timestamp()+".png");
}

void mousePressed(){
saveMe();
}


void keyPressed() {
  if (key=='a') {
    doGlitch();
  }
  if (key=='s') saveMe();
  
 //   if (key=='o') saveControlP5();



  if (key=='d')   advanceCounterGlyphs();
}

void advanceCounterGlyphs() {
  if (counterGlyphs<glyphs.length-1) {
    counterGlyphs++;
  } else {
    counterGlyphs=0;
  }
}
