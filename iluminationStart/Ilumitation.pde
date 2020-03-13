public class Ilumination{
  private PVector eye;
  private PVector center;
  private int concentration;
  private Lamp lamp;
  
  
  public Ilumination(){
    this.eye              = camera.getEye();
    this. center          = camera.getCenter();
    this.concentration    = 5;
    this.lamp             = new Lamp(midWidth,midHeight,midHeight/tan(PI*30.0/180.0) + 150,45);
  }
  
  public void setLantern(){
    ambientLight(0.2,0.2,0.2);
    lightSpecular(1,1,1);
    spotLight(255,255,255,eye.x,eye.y,eye.z,center.x,center.y,center.z,cos(radians(12.5)),concentration);
    lamp.createLamp();
  }
  
  public void setBasicIlimination(){
    PVector loc = lamp.getLocalitaion();
    int zoom = 200;
    if(loc.z > 0){
      pointLight(247, 247, 100,loc.x,loc.y,loc.z - zoom);
      //directionalLight(255,255,255,loc.x,loc.y,loc.z - zoom);
    } else {
      pointLight(247, 247, 100,loc.x,loc.y,loc.z + zoom);
      //directionalLight(255,255,255,loc.x,loc.y,loc.z + zoom);
    }
    lamp.createLamp();
  }
  
  public void increaseConcentration(int increase){
    concentration += increase;
  }
  
  public void changeLamp(){
    lamp.rotateLamp();
  }
}

public class Lamp {
  private PVector localitation;
  private PShape  pshape;
  private float initialZ;
  private final String texturePath = "texture/ligth.jpg";
  private int countClic            = 0;

  
  public Lamp(float x,float y, float z, int dimension){
    localitation = new PVector(x,y,z);
    pshape       = createShape(SPHERE, dimension);
    pshape.setTexture(loadImage(texturePath));
    initialZ     = z;
  }
  
  public void createLamp(){
    pushMatrix();
    translate(localitation.x,localitation.y,localitation.z);
    shape(pshape);
    popMatrix();
  }
  
  public PVector getLocalitaion(){
    return localitation;
  }
  
  public void rotateLamp(){
    switch(countClic){
      case 0: 
        localitation.x = initialZ;
        localitation.z = 0;
        countClic++;
        break;
      case 1:
        localitation.z = -this.initialZ;
        localitation.x = midWidth;
        countClic++;
        break;
      case 2:
        localitation.z = 0;
        localitation.x = -initialZ;
        countClic++;
        break;
      case 3:
        localitation.x = midWidth;
        localitation.z = this.initialZ;
        countClic = 0;
        break;
    }
  
  }
  
}
