public class Pina {
  /**atributos de mi objeto Pina, tal como sus
   posiciones iniciales en X y Y, si existe o no, la imagen a ser pintara 
   , el Pina muere al ser tocada por un coco*/
  private int posX;
  private int posY;
  private int vel;

  private boolean ver;
  private PImage pina;
  
public Pina() {
  posX=1050;  //posicion inicial en X, fuera de la pantalla
  posY=(int)random(0, 600); //posicion incial randomica en Y
  pina=loadImage("pina.png"); // cargar la imagen del pina
  ver= false; //existencia del enemigo pina.
  vel=3;
}
public void pintar() {
  // metodo para pintar el pina, si ver que representa si existe o no, es true entonces se pinta de lo contrario no
  if (ver==true) {
    image(pina, posX, posY);
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
  //retorna la posicion X del pina
  return posX;
}
public int getPosY() {
  //retorna la posicion Y del pina
  return posY;
}
public void setVer(boolean nVer) {
  //modifica existencia pina
  ver=nVer;
}
public boolean getVer() {
  return ver;
}
public void setVel(int nVel) {
  //modifica velocidad pina
  vel=nVel;
}
}

