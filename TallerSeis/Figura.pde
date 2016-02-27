public abstract class Figura {
  ////--instancia de mi clase padre, figura.--////
  //-posiciones de mi vector-//
  private PVector location;
  // velocidad de mi vector, magnitud de aumento de location//
  private PVector vel;
  // aceleracion de mi vector, magnitud de aumento de vel//
  private PVector aceleracion;
  // velocidad maxima//
  private float limite;
  // vector o punto al cual se dirigira
  private PVector destino;
  //-dimensiones-//
  private int ancho; // ancho y alto de mis objetos
  //-estado-//
  private int estado; // estado de movimiento, persigue al mouse o el centro
  //-color-//
  private int rojo;
  private int verde;
  private int azul;

  //constructor
  public Figura() {
    // inicializo mis vectores
    location = new PVector(random(width), random(height)); // aparecer en posicion random
    vel = new PVector(0, 0);// velocidad inicial 0
    limite = 8; // velocidad maxima de mi objeto es 8
    destino= new PVector(width/2, height/2); // destino es el centro
    // inicializo colores y ancho//
    ancho= (int)random(40, 100);
    rojo=(int)random(0, 255);
    verde=(int)random(0, 255);
    azul=(int)random(0, 255);
    estado=0;
  }
  
  //METODO MOVER--// mover es para que mis objetos vayan al centro
  public void mover() {
    PVector dir = PVector.sub(destino, location);
    // normalizar mi direccion
      dir.normalize();
    // escalar mi direccion
      dir.mult(0.5);
    //setear mi aceleracion
      aceleracion = dir;
    //vel se actualiza por acceleracion y mi location por vel
      vel.add(aceleracion);
    vel.limit(limite); // limite de mi velocidad
    location.add(vel); // setea mi poscicion,
  }
  
  ///METODO MOVER DOS/// persiguen al mouse
  public void moverDos() { // metodo mover para el estado dos (estado=1)
    PVector destinoDos= new PVector(mouseX,mouseY); //nuevo destino que se actualiza constantemente, el mouse.
    PVector dir = PVector.sub(destinoDos, location);
    // normalizar mi direccion
      dir.normalize();
    // escalar mi direccion
      dir.mult(1);
    //setear mi aceleracion
      aceleracion = dir;
    //vel se actualiza por acceleracion y mi location por vel
      vel.add(aceleracion);
    vel.limit(limite); // limite de mi velocidad
    location.add(vel);
  }
  //////////
  //METODO PARA EXPLOTAR//
  public void resetear() { // metodo que hace que todo se mueva hacia afuera, como una gran explosion, y es llamado en el resetear del logica, que los eliminara a penas salgan de pantalla.
    PVector dir = PVector.sub(location, destino);
    // normalizar mi direccion
      dir.normalize();
    // escalar mi direccion
      dir.mult(5);
    //setear mi aceleracion
      aceleracion = dir;
    //vel se actualiza por acceleracion y mi location por vel
      vel.add(aceleracion);
    vel.limit(100); // limite de mi velocidad
    location.add(vel); // setea mi poscicion,
  }
  ///---METODO CAMBIO COLOR---///
  /// metodo para cambiar el color hasta que sea blanco, solo sucese si se esta moviendo hacia el centro.
  public void cambioColor() {
    if (getRojo()<255) {
      setRojo(getRojo()+2);
    }
    if (getVerde()<255) {
      setVerde(getVerde()+2);
    }
    if (getAzul()<255) {
      setAzul(getAzul()+2);
    }
  }
  //--metodo abstracto pintar--// es abstracto ps se modificara por sobreescritura
  public abstract void pintar();
  //-gets y sets de posiciones y colores-// que me permitiran que los hijos los vean y modifiquen
  //posiciones//
  public float getPosX() {
    return location.x;
  }
  public float getPosY() {
    return location.y;
  }
  public void setPosX(float nX) {
    location.x=nX;
  }
  public void setPosY(float nY) {
    location.y=nY;
  }

  //dimensiones// no cuenta con sets pues no se modificaran
  public int getAncho() {
    return ancho;
  }

  //colores//
  public int getRojo() {
    return rojo;
  }
  public int getVerde() {
    return verde;
  }
  public int getAzul() {
    return azul;
  }
  public void setRojo(int nR) {
    rojo=nR;
  }
  public void setVerde(int nV) {
    verde=nV;
  }
  public void setAzul(int nA) {
    azul=nA;
  }
  public int getEstado(){
    return estado;
  }
  public void setEstado(int nE){
    estado=nE;
  }
}
