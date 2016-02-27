public class Personaje {
  /**atributos de mi objeto personaje, tal como sus
   posiciones iniciales en X y Y, su vida, la imagen a ser pintara 
   y el arma que esta activada*/
  private int posX;
  private int posY;
  private int vel;
  private int sangre;
  private int vida;
  private boolean arma;
  private PImage personaje;
  /**inicializacion de las variables definidas anteriormente
   vida posiciones X y Y, y arma.*/
  public Personaje() {
    imageMode(CENTER);
    posX=135; //posicion no fija aun, posicion inicial
    posY=50; // posicion no fija aun
    //
    personaje=loadImage("tanque coco.png"); // cargar la imagen de mi personaje
    arma= false; // si es false significa que el arma seleccionada es el coco, de lo contrario es el ataque especial
    sangre=4; // la sangre del personaje si llega a 0 pierde una vida, si vida llega a 0 GameOver.
    vida=3; // cantidad de vidas iniciales
    vel=60;
  }
  public void pintar() {
    //metodo para dibujar al personaje, llamado a la imagen
    image(personaje, posX, posY);
  }
  public void moverArriba() {
    //metodo para mover el personaje de forma vertical acendente.
    posY-=vel;
  }
  public void moverAbajo() {
    //metodo para mover el personaje de forma vertical descendente
    posY+=vel;
  }

  public void morir() {
    //metodo que hace que los valores se reseteen y el personaje pierda una vida.
    posX= 50;
    posY= 50;
    sangre=4;
    vida--; // reduce las vidas.
  }
  public int getPosX() {
    //retorna la posicion X del personaje
    return posX;
  }
  public int getPosY() {
    //retorna la posicion Y del personaje
    return posY;
  }
  public int getVida() {
    //retorna la vida del personaje
    return vida;
  }
  public int getSangre(){
    //retorna la vida del personaje
    return sangre;
  }
  public void setSangre(int a) {
    //retorna la vida del personaje
    sangre=a;
  }
  public boolean getArma() {
    return arma;
  }
  public void setArma(boolean nArma) {
    //permite modificar en otras clases el arma
    arma=nArma;
  }
  public void setVel(int nVel) {
    //modifica existencia personaje
    vel=nVel;
  }
}

