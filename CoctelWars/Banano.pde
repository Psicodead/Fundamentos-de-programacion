public class Banano {
  /**atributos de mi objeto banano, tal como sus
   posiciones iniciales en X y Y, si existe o no, la imagen a ser pintara 
   , el banano muere al ser tocada por un coco*/
  private int posX;
  private int posY;
  private int vel;

  private boolean ver;
  private PImage banano;

  public Banano() {
    posX=1050;  //posicion inicial en X, fuera de la pantalla
    posY=(int)random(0, 600); //posicion incial randomica en Y
    banano=loadImage("banano.png"); // cargar la imagen del banano
    ver= false; //existencia del enemigo banano.
    vel=1;
  }
  public void pintar() {
    // metodo para pintar el banano, si ver que representa si existe o no, es true entonces se pinta de lo contrario no
    if (ver==true) {
      image(banano, posX, posY);
    }
  }
  public void mover() {
    posX-=vel;
  }
  public void disparar() {
  }
  public void morir() {
    posX=1100;
    ver=false;
  }
  public int getPosX() {
    //retorna la posicion X del banano
    return posX;
  }
  public int getPosY() {
    //retorna la posicion Y del banano
    return posY;
  }
  public void setVer(boolean nVer) {
    //modifica existencia banano
    ver=nVer;
  }
  public boolean getVer() {
    return ver;
  }
  public void setVel(int nVel) {
    //modifica velocidad banano
    vel=nVel;
  }
}

