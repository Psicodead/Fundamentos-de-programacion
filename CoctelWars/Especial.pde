public class Especial {
 // atributos del poder especial
  private int posX;
  private int posY;
  private int dano;
  private boolean ver;
  private PImage poder;
  
  public Especial(){
    posX=710; //aparece desde el personaje
    dano=4;  // super dano que mata todo
    ver=false;  // permite que se vea el poder
    poder=loadImage("super poder.png");
  }
  public void pintar(){
    image(poder, posX, posY);
  }
  public int getPosX(){
    return posX;
  }
  public int getPosY(){
    return posY;
  }
   public int getDano(){
    return dano;
  }
  public void setPosY(int nY){
    posY=nY;
  }
  public void setVer(boolean nV){
    ver=nV;
  }
}
  
    
    
