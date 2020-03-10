CameraController camera;
float midWidth,midHeight,axisZomm;
KeyController keyController;
boolean enter;

void setup(){
  size(500,500, P3D);
  midWidth  = width/2.0;
  midHeight = height/2.0;
  axisZomm  = -300;
  enter     = false;
  
  keyController = new KeyController();
  camera    = new CameraController(
    new PVector(midWidth,midHeight,midHeight/tan(PI*30.0/180.0)),
    new PVector(0,0,-1),
    new PVector(0,1,0)
    );
}

void draw(){
  background(200);
  PVector eye = camera.getEye();
  PVector center = camera.getCenter();
  if(enter){
    float valX = eye.x/width*255;
    float valY = eye.y/height*255;
    float valZ = eye.z/width*255;
    ambientLight((int)valX,valY,valZ);
    directionalLight(50,200,50,center.x,center.y,center.z);
  } else {
    lights();
  }
  translate(midWidth,midHeight,axisZomm);
  box(100);
  camera.setCamera();
  keyController.moveScreen();
  
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
