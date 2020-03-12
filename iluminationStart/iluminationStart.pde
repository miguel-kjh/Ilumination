CameraController camera;
float midWidth,midHeight,axisZomm;
KeyController keyController;
Scene scene;
int zoom;
boolean enter;

void setup(){
  size(800,800, P3D);
  midWidth      = width/2.0;
  midHeight     = height/2.0;
  axisZomm      = -300;
  enter         = false;
  zoom          = 10;
  scene         = new Scene(5);
  keyController = new KeyController();
  camera        = new CameraController(
    new PVector(midWidth,midHeight,midHeight/tan(PI*30.0/180.0)),
    new PVector(0,0,-1),
    new PVector(0,1,0)
    );
}

void draw(){
  background(0.1,0.1,0.1,1);
  PVector eye = camera.getEye();
  PVector center = camera.getCenter();
  if(enter){
    ambientLight(0.2,0.2,0.2);
    //directionalLight(255,255,255,eye.x,eye.y,eye.z);
    lightSpecular(1,1,1);
    //pointLight(255,255,255,eye.x,eye.y,eye.z);
    spotLight(255,255,255,eye.x,eye.y,eye.z,center.x,center.y,center.z,cos(radians(12.5)),zoom);
  } else {
    pointLight(255,255,255,midWidth,midHeight,midHeight/tan(PI*30.0/180.0) + 500);
  }
  pushMatrix();
  translate(midWidth,midHeight,midHeight/tan(PI*30.0/180.0) + 500);
  sphere(50);
  popMatrix();
  scene.createScene();
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

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  int plus = 10;
  if(e < 0){
    zoom -= plus;
  } else {
    zoom += plus;
  }  
}
