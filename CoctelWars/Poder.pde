public class Poder {
  /** este es el objeto que permite activar el poder especial
   el cual durara 5 segundos*/
  private int posX;
  private int posY;
  private int vel;
  private boolean ver;
  private PImage poder;

  public Poder() {
    posX=(int)random(400, 800);  //posicion inicial en X, en un lugar random
    posY=650; //posicion incial fuera pantalla
    poder=loadImage("logofinal.png"); // cargar la imagen del poder
    ver= false; //existencia del poder
    vel=3;
  }
  public void pintar() {
    // metodo para pintar el poder, si ver que representa si existe o no, es true entonces se pinta de lo contrario no
    if (ver==true) {
      image(poder, posX, posY);
    }
  }
  public void mover() {
    posY-=vel;
  }
  public void obtener() {
    ver=false;
    posY= 650;
  }
  public int getPosX() {
    return posX;
  }
  public int getPosY() {
    return posY;
  }

  public boolean getVer(){
    return ver;
  }
  public void setVer(boolean nV){
    ver=nV;
  }
}
