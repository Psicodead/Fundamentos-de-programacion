public class Mango {
  /**atributos de mi objeto Mango, tal como sus
   posiciones iniciales en X y Y, si existe o no, la imagen a ser pintara 
   , el Mango muere al ser tocada por un coco*/
  private int posX;
  private int posY;
  private int vel;

  private boolean ver;
  private PImage mango;

  public Mango() {
    posX=1050;  //posicion inicial en X, fuera de la pantalla
    posY=(int)random(0, 600); //posicion incial randomica en Y
    mango=loadImage("mango.png"); // cargar la imagen del mango
    ver= false; //existencia del enemigo mango.
    vel=2;
  }
  public void pintar() {
    // metodo para pintar el mango, si ver que representa si existe o no, es true entonces se pinta de lo contrario no
    if (ver==true) {
      image(mango, posX, posY);
    }
  }
  public void mover() {
    posX-=vel;
  }
  public void morir() {
    posX=1050;
    ver=false;
  }
  public int getPosX() {
    //retorna la posicion X del mango
    return posX;
  }
  public int getPosY() {
    //retorna la posicion Y del mango
    return posY;
  }
  public void setVer(boolean nVer) {
    //modifica existencia mango
    ver=nVer;
  }
  public boolean getVer() {
    return ver;
  }
  public void setVel(int nVel) {
    //modifica velocidad mango
    vel=nVel;
  }
}

