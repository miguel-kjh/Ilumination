public class Scene {
  private ArrayList<IndustrialBoxes> listOfBoxes;
  
  public Scene(){
    this.listOfBoxes = new ArrayList();
    createBox();
  }
  
  private void createBox(){
    int dim    = 50;
    listOfBoxes.add(new IndustrialBoxes(midWidth,midHeight, -100,dim));
    listOfBoxes.add(new IndustrialBoxes(midWidth+20,midHeight+20, -300,dim));
    listOfBoxes.add(new IndustrialBoxes(midWidth-200,midHeight+10, -200,dim));
    
    listOfBoxes.add(new IndustrialBoxes(midWidth,midHeight, -100,dim));
    listOfBoxes.add(new IndustrialBoxes(midWidth-50,midHeight-50, -300,dim));
    listOfBoxes.add(new IndustrialBoxes(midWidth+200,midHeight-10, -200,dim));
    
    listOfBoxes.add(new IndustrialBoxes(midWidth,midHeight, -400,dim));
    listOfBoxes.add(new IndustrialBoxes(midWidth-100,midHeight+100, -300,dim));
    listOfBoxes.add(new IndustrialBoxes(midWidth-300,midHeight+19, -400,dim));
    
    
    listOfBoxes.add(new IndustrialBoxes(midWidth,0, -100,dim));
    listOfBoxes.add(new IndustrialBoxes(midWidth,height, -100,dim));
  }
  
  public void createScene(){
    for(IndustrialBoxes box:listOfBoxes){
      pushMatrix();
      box.createBox();
      popMatrix();
    }
  }
  
}
