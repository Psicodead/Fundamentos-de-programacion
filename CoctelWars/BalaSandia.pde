public class BalaSandia {
  /**atributos de mi objeto bala, tal como sus
   posiciones iniciales en X y Y, su existencia y la imagen a ser pintara 
   */
  private int posX;
  private int posY;
  private int dano;
  private int vel;
  private boolean ver, disparado;
  private PImage bala;
  /**inicializacion de las variables definidas anteriormente
   existencia y posiciones X y Y.*/
  public BalaSandia() {
    posX=0; //posicion inicial igual a la del enemigo sandia en X para que salga desde el.
   posY=0;  //posicion inicial igual a la del enemigo sandia en Y para que salga desde el.
    bala=loadImage("bala sandia.png"); // cargar la imagen de la bala sandia
    dano=1; // cantidad de vidas iniciales
    ver=false; // inicia como no visible. al disparar se hara visible.
    disparado=false;// define si la bala salio o no.
    vel=5;// velocidad de disparo
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
    posX-=vel;
  }
  public void morir(){
    if (posX<=0) {
      ver=false;
      disparado=false;
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
 public void setVel(int nVel) {
    //modifica velocidad banano
    vel=nVel;
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
