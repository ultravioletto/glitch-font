

void doGlitchNO_CONTROL_P5() {
  
    // trigger a glitch: glitchP5.glitch(  posX,       // 
  //                               posY,       // position on screen(int)
  //          posJitterX,     // 
  //          posJitterY,     // max. position offset(int)
  //          sizeX,       // 
  //          sizeY,       // size (int)
  //          numberOfGlitches,   // number of individual glitches (int)
  //          randomness,     // this is a jitter for size (float)
  //          attack,     // max time (in frames) until indiv. glitch appears (int)
  //          sustain      // max time until it dies off after appearing (int)
  //              );
  
  
  
 int posX=(int)random(width);//int posY=(int)random(height);
  int posY=(int)random(width);



  int posJitterX=width;     // 
  int posJitterY=height;             // max. position offset(int)
  //  int sizeX=(int)random(50,100);                    //
  int sizeX=(int)random(width/5);                    //
   sizeX=(int)random(1,10)*10;                    //
   println("sizeX "+sizeX);
 // int sizeX=500;
  int sizeY=   height;            // size (int)
  int numberOfGlitches=(int)random(20)+1;      // number of individual glitches (int)
  println("numberOfGlitches "+numberOfGlitches);
// numberOfGlitches=200;
  float randomness=1f;         // this is a jitter for size (float)
  int sustain=(int)random(10, 20)*10;            // max time until it dies off after appearing (int)

  int attack=(int)random(sustain/2, sustain);               // max time (in frames) until indiv. glitch appears (int)
  attack=(int)random(1, 5)*20;
  attack=10; //0
  glitchP5.glitch(posX, posY, posJitterX, posJitterY, sizeX, sizeY, numberOfGlitches, randomness, attack, sustain);
}






//////////////////// GLITCH CONTROL P5
int glitch_SizeX;
int glitch_SizeY;

int glitch_posX;
int glitch_posY;

int glitch_randomness_posX;
int glitch_randomness_posY;

int glitch_numberOfGlitches;
int glitch_sustain;


int glitch_num_cicles;

float glitch_randomness;

void doGlitch() {
  
    // trigger a glitch: glitchP5.glitch(  posX,       // 
  //                               posY,       // position on screen(int)
  //          posJitterX,     // 
  //          posJitterY,     // max. position offset(int)
  //          sizeX,       // 
  //          sizeY,       // size (int)
  //          numberOfGlitches,   // number of individual glitches (int)
  //          randomness,     // this is a jitter for size (float)
  //          attack,     // max time (in frames) until indiv. glitch appears (int)
  //          sustain      // max time until it dies off after appearing (int)
  //              );
  
  
  
 int posX=glitch_posX;
 println("posx "+posX);
 
 int posY=glitch_posY;
println("posy "+posY);


  int posJitterX=glitch_randomness_posX;     // 
  int posJitterY=glitch_randomness_posY;             // max. position offset(int)
  int sizeX=glitch_SizeX;                    //
   println("sizeX "+sizeX);
 // int sizeX=500;
  int sizeY=   glitch_SizeY;            // size (int)
  int numberOfGlitches=glitch_numberOfGlitches;      // number of individual glitches (int)
  println("numberOfGlitches "+numberOfGlitches);
  float randomness=glitch_randomness;//1f;         // this is a jitter for size (float)
  int sustain=glitch_sustain;            // max time until it dies off after appearing (int)

  int attack=0;
  glitchP5.glitch(posX, posY, posJitterX, posJitterY, sizeX, sizeY, numberOfGlitches, randomness, attack, sustain);
}
