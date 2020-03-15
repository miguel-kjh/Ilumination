//import gifAnimation.*;


CameraController camera;
float midWidth,midHeight,axisZomm;
KeyController keyController;
Scene scene;
boolean enter;
Ilumination ilumination;
/*GifMaker gif;
int countFrame     = 0;
final int maxFrame = 10;*/



void setup(){
  size(800,800, P3D);
  midWidth      = width/2.0;
  midHeight     = height/2.0;
  axisZomm      = -300;
  enter         = false;
  scene         = new Scene();
  keyController = new KeyController();
  camera        = new CameraController(
    new PVector(midWidth,midHeight,midHeight/tan(PI*30.0/180.0)),
    new PVector(0,0,-1),
    new PVector(0,1,0)
    );
  ilumination = new Ilumination();
  /*gif = new GifMaker(this,"animation.gif");
  gif.setRepeat(0);*/
}

void draw(){
  background(0.1,0.1,0.1,1);
  hint(ENABLE_DEPTH_TEST);
  pushMatrix();
  camera.setCamera();
  keyController.moveScreen();
  setLighting();
  scene.createScene();
  popMatrix();
  hint(DISABLE_DEPTH_TEST);
  paintText();
  //setFrame();
}

/*void setFrame(){
  if(countFrame == maxFrame){
      gif.addFrame();
      countFrame = 0;
  }
  countFrame++;
}*/

void setLighting(){
  if(enter){
    ilumination.setLantern();
  } else {
    ilumination.setBasicIlimination();
  }
}

void paintText(){
  fill(255,255,255);
  textSize(15);
  text("A,D,W,S move the ship",midWidth*0.01,midHeight*0.05);
  text("Clic to rotate the lamp",midWidth*0.01,midHeight*0.15);
  text("keyArrow for rotate on the shaft",midWidth*0.01,midHeight*0.25);
  text("F to reset",midWidth*0.01,midHeight*0.35);
  text("Enter to turn on the flashlight",midWidth*0.01,midHeight*0.45);
  text("Move the mouse wheel to adjust the flashlight",midWidth*0.01,midHeight*0.55);
}

void keyPressed(){
  keyController.updateKeysPressed();
  if(keyCode == ENTER){
    enter = !enter;
  }
}

void keyReleased(){
  keyController.updateKeysReleased();
}

void mouseClicked(){
  ilumination.changeLamp();
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  int plus = 10;
  if(e < 0){
    ilumination.increaseConcentration(-plus);
  } else {
    ilumination.increaseConcentration(plus);
  }  
}
