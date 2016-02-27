public class Coco {
  /**atributos de mi objeto coco, tal como sus
   posiciones iniciales en X y Y, su existencia y la imagen a ser pintara 
   */
  private int posX;
  private int posY;
  private int dano;
  private boolean ver, disparado;
  private PImage bala;
  /**inicializacion de las variables definidas anteriormente
   existencia y posiciones X y Y.*/
  public Coco() {
    posX=230; //posicion inicial igual a la del personaje en X para que salga desde el personaje
     // posicion inicial igual a la del personaje en Y para que salga desde el personaje
    bala=loadImage("bala coco.png"); // cargar la imagen de la bala coco
    dano=1; // cantidad de vidas iniciales
    ver=false; // inicia como no visible. al disparar se hara visible.
    disparado=false;// define si la bala salio o no.
  }
  public void pintar() {
    mover();
    // metodo para pintar la bala, si ver que representa si existe o no, es true entonces se pinta de lo contrario no
    if (ver==true&&disparado==true) {
    image(bala, posX, posY);
    }
  }
  public void mover() {
    //hace que la bala avance
    posX+=10;
    if (posX>=1000) {
      ver=false;
      disparado=false;
      posX = 200;
    }
  }
  public int getPosX() {
    return posX;
  }
  public int getPosY() {
    return posY;
  }
  public int getDano() {
    return dano;
  }

  public void setVer(boolean nVer) {
    ver=nVer;
  }
  public boolean getDisparado() {
    return disparado;
  }
  public void setDisparado(boolean nDisp) {
    disparado=nDisp;
  }
  public void setPosX(int nX) {
    posX = nX;
  }

  public void setPosY(int nY) {
    posY = nY;
  }

}
