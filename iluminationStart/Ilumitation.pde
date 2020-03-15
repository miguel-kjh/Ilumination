public class Ilumination{
  private PVector eye;
  private PVector center;
  private PVector vectorColor;
  private int concentration;
  private Lamp lamp;
  
  
  public Ilumination(){
    this.eye              = camera.getEye();
    this. center          = camera.getCenter();
    this.vectorColor      = new PVector(255,255,255);
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
      pointLight(vectorColor.x, vectorColor.y, vectorColor.z,loc.x,loc.y,loc.z - zoom);
    } else {
      pointLight(vectorColor.x, vectorColor.y, vectorColor.z,loc.x,loc.y,loc.z + zoom);
    }
    lamp.createLamp();
  }
  
  public void increaseConcentration(int increase){
    concentration += increase;
  }
  
  public void changeLamp(){
    lamp.rotateLamp();
    vectorColor.x = random(50,255);
    vectorColor.y = random(50,255);
    vectorColor.z = random(50,255);
  }
}

public class Lamp {
  private PVector localitation;
  private PShape  pshape;
  private float initialZ;
  private final String texturePath = "texture/descarga.jpeg";
  private int countClic            = 0;

  
  public Lamp(float x,float y, float z, int dimension){
    localitation = new PVector(x,y,z);
    pshape       = createShape(SPHERE, dimension);
    pshape.setTexture(loadImage(texturePath));
    pshape.setStroke(false);
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
        localitation.x = width;
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
        localitation.x = 0;
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
