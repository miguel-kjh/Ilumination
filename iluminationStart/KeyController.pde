public class KeyController{
  private boolean[] keyPosibles;
  
  public KeyController(){
    keyPosibles = new boolean[9];
  }
  
  public void updateKeysPressed(){
      if(key == 'a' || key == 'A'){
        keyPosibles[0] = true; 
      }
      if(key == 'd' || key == 'D'){
        keyPosibles[1] = true; 
      }
      if(key == 'f' || key == 'F'){
        keyPosibles[2] = true;
      }
      if(keyCode == UP ){
        keyPosibles[3] = true;
      }
      if(keyCode == DOWN ){
        keyPosibles[4] = true;
      }
      if(keyCode == RIGHT ){
        keyPosibles[5] = true;
      }
      if(keyCode == LEFT ){
        keyPosibles[6] = true;
      }
      if(key == 'w' || key == 'W'){
        keyPosibles[7] = true;
      }
      if(key == 's' || key == 'S'){
        keyPosibles[8] = true;
      }
  }
  
  public void updateKeysReleased(){
      if(key == 'a' || key == 'A'){
        keyPosibles[0] = false; 
      }
      if(key == 'd' || key == 'D'){
        keyPosibles[1] = false; 

      }
      if(key == 'f' || key == 'F'){
        keyPosibles[2] = false;
      }
      if(keyCode == UP ){
        keyPosibles[3] = false;
      }
      if(keyCode == DOWN ){
        keyPosibles[4] = false;
      }
      if(keyCode == RIGHT ){
        keyPosibles[5] = false;
      }
      if(keyCode == LEFT ){
        keyPosibles[6] = false;
      }
      if(key == 'w' || key == 'W'){
        keyPosibles[7] = false;
      }
      if(key == 's' || key == 'S'){
        keyPosibles[8] = false;
      }
  }
  
  public void moveScreen(){
    for(int i = 0; i < keyPosibles.length; i++){
          if(!keyPosibles[i]) continue;
          switch(i) {
            case 0:
              camera.moveEyeX(Direction.POSITIVE);
              break;
            case 1:
              camera.moveEyeX(Direction.NEGATIVE);
              break;
            case 2:
              camera.resetCamera();
              break;
            case 3:
              camera.moveCenterY(Direction.POSITIVE);
              break;
            case 4:
              camera.moveCenterY(Direction.NEGATIVE);
              break;
            case 5:
              camera.moveCenterX(Direction.NEGATIVE); 
              break;
            case 6:
              camera.moveCenterX(Direction.POSITIVE);
              break;
            case 7:
              camera.moveZoom(Direction.NEGATIVE);
              break;
            case 8:
              camera.moveZoom(Direction.POSITIVE);
              break;
            default:
              break;
          }
    }
  }
  
}
