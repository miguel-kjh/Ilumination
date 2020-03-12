public class IndustrialBoxes {
  private final String texturePath = "texture/container.png";
  private PShape pshape;
  private int dimension;
  private PVector localitation;
  
  public IndustrialBoxes(float x,float y, float z, int dimension){
    this.localitation = new PVector(x,y,z);
    this.dimension    = dimension;
    pshape            = createShape(BOX, this.dimension);
    pshape.setTexture(loadImage(texturePath));
  }
  
  public void createBox(){
    translate(localitation.x,localitation.y,localitation.z);
    shininess(32);
    shape(pshape);
  }
  
  @Override
  public boolean equals(Object obj){  
    
    if (!(obj instanceof IndustrialBoxes)) return false;
    IndustrialBoxes box = (IndustrialBoxes) obj;
    return localitation.equals(box.localitation); 
  } 
  
}
