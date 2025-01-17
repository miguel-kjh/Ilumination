enum Direction{
  NEGATIVE,
  POSITIVE
}

public class CameraController {
  private PVector eye, initialEye;
  private PVector center,initialCenter;
  private PVector cameraUp,initialCameraUp;
  private float yaw,pitch,roll;
  
  private final float initialYaw      = -90;
  private final float initialPitch    = 0;
  private final float speed           = 5;
  private final float increaseAngules = 2;
  
  public CameraController(PVector eye, PVector center,PVector cameraUp){
    this.eye             = eye;
    this.initialEye      = eye.copy();
    this.center          = center;
    this.initialCenter   = center.copy();
    this.cameraUp        = cameraUp;
    this.initialCameraUp = cameraUp.copy();
    this.yaw             = initialYaw;
    this.pitch           = initialPitch;
  }
  
  public void setCamera(){
    camera(eye.x, eye.y, eye.z, eye.x+center.x, eye.y+center.y, eye.z+center.z, cameraUp.x, cameraUp.y, cameraUp.z);
  }
  
  public void moveEyeX(Direction direction){
    PVector aux = center.cross(cameraUp).normalize().mult(speed);
    if(direction == Direction.NEGATIVE) {
      eye.x += aux.x;
      eye.y += aux.y;
      eye.z += aux.z;
    } else {
      eye.x -= aux.x;
      eye.y -= aux.y;
      eye.z -= aux.z;
    }
  }
  
  private void updateDirectorVector(){
    center.x = cos(radians(yaw)) * cos(radians(pitch));
    center.y = sin(radians(pitch));
    center.z = sin(radians(yaw)) * cos(radians(pitch));
    center.normalize();
  }
  
  public void moveCenterX(Direction direction){
    if(direction == Direction.NEGATIVE){
      yaw += increaseAngules;
    } else {
      yaw -= increaseAngules;
    }
    if(abs(yaw) >= 360) yaw = 0;
    updateDirectorVector();
    
    
  }
  
  public void moveCenterY(Direction direction){
    if(direction == Direction.NEGATIVE){
      pitch += increaseAngules;
    } else {
      pitch -= increaseAngules;
    }
    if (pitch >= 89) pitch = 89;
    if (pitch <= -89) pitch = -89;
    updateDirectorVector();
  }
  
  public void moveZoom(Direction direction){
    PVector aux = new PVector(center.x*speed, center.y*speed, center.z*speed);
    if(direction == Direction.NEGATIVE) {
      eye.x += aux.x;
      eye.y += aux.y;
      eye.z += aux.z;
    } else {
      eye.x -= aux.x;
      eye.y -= aux.y;
      eye.z -= aux.z;
    }
  }
  
  public void resetCamera(){
    
    yaw     = initialYaw;
    pitch   = initialPitch;
    
    cameraUp.set(initialCameraUp.x,initialCameraUp.y,initialCameraUp.z);
    center.set(initialCenter.x,initialCenter.y,initialCenter.z);
    eye.set(initialEye.x,initialEye.y,initialEye.z);
  }
  
  public PVector getEye(){
    return eye;
  }
  
  public PVector getCenter(){
    return center;
  }
  
}
