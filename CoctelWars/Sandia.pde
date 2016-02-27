public class Sandia {
  //atributos del enemigo Sandia
  private int posX;
  private int posY;
  private int vel;
  private int vida;
  private boolean ver;
  private PImage sandia;

  /**inicializacion de las variables definidas anteriormente
   vida posiciones X y Y, y existencia.*/
  public Sandia() {
    posX=950;  //posicion inicial en X, fuera de la pantalla
    posY= 750;
    sandia=loadImage("sandia.png"); // cargar la imagen de la fresa
    ver= false; //existencia del enemigo fresa.
    vel=2;
    vida=3;
  }
  public void pintar() {

    // metodo para pintar la sandia, si ver que representa si existe o no, es true entonces se pinta de lo contrario no
    if (ver==true) {
      image(sandia, posX, posY);
    }
  }
  public void mover() {
    posY-=vel;
  }
  public void morir() {
    posY=750;
    ver=false;
    vida=3;
  }
  public int getPosX() {
    //retorna la posicion X de la sandia
    return posX;
  }
  public int getPosY() {
    //retorna la posicion Y de la sandia
    return posY;
  }
  public void setVer(boolean nVer) {
    //modifica existencia de la sandia
    ver=nVer;
  }
  public boolean getVer() {
    return ver;
  }
  public void setVel(int nVel) {
    //modifica velocidad de la sandia
    vel=nVel;
  }
  public void setVida(int a) {
    // modifica la vida
    vida=a;
  }
  public int getVida() {
    return vida;
  }
  public void setPosY(int nY) {
    posY=nY;
  }
}

