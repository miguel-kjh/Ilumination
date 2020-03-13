public class Scene {
  private ArrayList<IndustrialBoxes> listOfBoxes;
  private int countBoxes;
  
  public Scene(int countBoxes){
    this.countBoxes  = countBoxes;
    this.listOfBoxes = new ArrayList();
    createBox();
  }
  
  private void createBox(){
    int dim    = 100;
    int maxZ   = -5000;
    for(int box = 0; box < countBoxes; box++){
      IndustrialBoxes industrialBoxes;
      do{
         industrialBoxes = new IndustrialBoxes(random(0,width),random(0,height), random(0,maxZ),dim);
      } while(listOfBoxes.contains(industrialBoxes));
      listOfBoxes.add(industrialBoxes);
    }
  }
  
  public void createScene(){
    for(IndustrialBoxes box:listOfBoxes){
      pushMatrix();
      box.createBox();
      popMatrix();
    }
  }
  
}
