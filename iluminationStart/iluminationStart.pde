CameraController camera;
float midWidth,midHeight,axisZomm;
KeyController keyController;
Scene scene;
boolean enter;
Ilumination ilumination;

void setup(){
  size(800,800, P3D);
  midWidth      = width/2.0;
  midHeight     = height/2.0;
  axisZomm      = -300;
  enter         = false;
  scene         = new Scene(5);
  keyController = new KeyController();
  camera        = new CameraController(
    new PVector(midWidth,midHeight,midHeight/tan(PI*30.0/180.0)),
    new PVector(0,0,-1),
    new PVector(0,1,0)
    );
  ilumination = new Ilumination();
  
}

void draw(){
  background(0.1,0.1,0.1,1);
  setLighting();
  scene.createScene();
  camera.setCamera();
  keyController.moveScreen();
  
}

void setLighting(){
  if(enter){
    ilumination.setLantern();
  } else {
    ilumination.setBasicIlimination();
  }
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
