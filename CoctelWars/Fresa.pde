public class Fresa {
  /**atributos de mi objeto pfresa, tal como sus
   posiciones iniciales en X y Y, si existe o no, la imagen a ser pintara 
   , la fresa muere al ser tocada por un coco*/
  private int posX;
  private int posY;
  private int vel;
  //private balasFresa; // dudaaaaa
  private boolean ver;
  private PImage fresa;
  
  /**inicializacion de las variables definidas anteriormente
   vida posiciones X y Y, y existencia.*/
  public Fresa() {
    posX=1050;  //posicion inicial en X, fuera de la pantalla
    posY=(int)random(0, 600); //posicion incial randomica en Y
      fresa=loadImage("fresa.png"); // cargar la imagen de la fresa
    ver= false; //existencia del enemigo fresa.
    vel=2;
  }
  public void pintar() {
     // metodo para pintar la fresa, si ver que representa si existe o no, es true entonces se pinta de lo contrario no
    if (ver==true) {
    image(fresa, posX, posY);
    }
  }
  public void mover(){
    posX-=vel; 
  }
  public void disparar(){
  }
  public void morir(){
    posX=1050;
    ver=false;
  }
   public int getPosX() {
    //retorna la posicion X de la fresa
    return posX; 
  }
  public int getPosY() {
    //retorna la posicion Y de la fresa
    return posY;
  }
  public void setVer(boolean nVer) {
    //modifica existencia personaje
    ver=nVer;
  }
  public boolean getVer(){
    return ver;
  }
  public void setVel(int nVel) {
    //modifica velocidad fresa
    vel=nVel;
  }
}
    

