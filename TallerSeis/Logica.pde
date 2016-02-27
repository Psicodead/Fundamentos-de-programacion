public class Logica {
  private int pantalla; // pantalla de instrucciones o de aplicacion
  private boolean estadoClick; // se dio click sobre un objeto o no
  private PImage instruccion; // variable que guarda la imagen de la pantalla instruccion
  private ArrayList<Figura> figuritas; //arraylist de la clase padre.
  private Figura tem; // varible temporal que casteare mas tarde, es general puesse encuentra en todo
  private boolean reset; // variable que me activara o no el metodo reset de mis figuritas.
  //--CONSTRUCTOR DE LOGICA--//
  public Logica() {
    //imagen de la pantalla de instrucciones y el valor inicial de pantalla
    instruccion= loadImage("instruccion.jpg");
    pantalla=0;
    // figuras sin borde
    noStroke();
    rectMode(CENTER);
    ellipseMode(CENTER);
    //arraylist de figuras
    figuritas=new ArrayList<Figura>();
    for (int i=0;i<figuritas.size();i++) {
      Figura tem=(Figura) figuritas.get(i); // inicializo temporal como un objeto Figura
    }
  }
  ////////////

  ////--METODO EJECUTAR--////
  public void ejecutar() {
    switch(pantalla) {
    case 0: //pantalla de instrucciones
      image(instruccion, 0, 0);
      break;
    case 1:
      for (int i=0;i<figuritas.size();i++) { // for para el pintar
        ///---CONDICIONES PARA CASTEO---/////
        if (figuritas.get(i)instanceof Cuadrado) { // si es una instancia de cuadrado entonces lo casteo como cuadrado
          tem=(Cuadrado) figuritas.get(i);
        }
        if (figuritas.get(i)instanceof Circulo) {  // si es una instancia de circulo entonces lo casteo como circulo
          tem=(Circulo) figuritas.get(i);
        }
        ////////////////////////////////
        tem.pintar(); //pintar mi figurita         
        if(reset==false){ // para poder diferenciar el "mover tipo reset" del mover normal, entoncs si es falso se realiza el mover normal, y si es true se van hacia afuera.
        switch(tem.getEstado()) {
        case 0:
          tem.mover(); // mover mi figurita hacia el centro
          tem.cambioColor(); // cambiar el color de mis figuritas
          break;
        case 1:
          tem.moverDos(); // mover mi figurita hacia el centro
          // doble for para evaluar todos los que esten en estado uno, con todos 
          for (int j=0;j<figuritas.size();j++) {
            Figura tempA= (Figura) figuritas.get(j);
            for (int k=0; k<figuritas.size();k++) {
              Figura tempB= (Figura) figuritas.get(k);
              if (j!=k) {
                if(tempA.getEstado()==1){
                if (dist(tempA.getPosX(), tempA.getPosY(), tempB.getPosX(), tempB.getPosY())<tempA.getAncho()) {
                  if(tempB instanceof Circulo){
                  tempB.setEstado(1);
                  }
                }
                }
              }
            }
          }
          break;
        }
        }
        if(reset==true){
            tem.resetear();
            if(tem.getPosY()>(height+tem.getAncho()) ||tem.getPosY()<(0-tem.getAncho())||tem.getPosX()>(width+tem.getAncho()) ||tem.getPosX()<(0-tem.getAncho()) ){
            figuritas.remove(i);
            }
            if(figuritas.size()==0){
              reset=false;
            }
          }
      }
      break;
    }
  }

  //--metodo de validacion del click--//
  public void click(int mX, int mY) {
    switch(pantalla) {
    case 0:
      if (dist(mX, mY, 1085, 595)<35) {
        pantalla=1; //cambio de pantalla si se da click sobre el triangulo de play
      }
      break;
    case 1: 
      estadoClick=false; // falso no se dio sobre objeto, true si se dio sobre objeto, siempre es falso pero se modifica al tocar la bolita
      for (int i=0;i<figuritas.size();i++) {
        if (figuritas.get(i)instanceof Cuadrado) { 
          tem=(Cuadrado) figuritas.get(i);
        }
        if (figuritas.get(i)instanceof Circulo) { 
          tem=(Circulo) figuritas.get(i);
        }
        if (dist(tem.getPosX(), tem.getPosY(), mX, mY)<tem.getAncho()) {  // se da click o no dentro de un circulo?,
          estadoClick=true;
          tem.setEstado(tem.getEstado()+1);
          if (tem.getEstado()>=2) {
            tem.setEstado(0);
          }
        }
      }
      if (!estadoClick&&reset==false) { // se da click fuera y no se esta reseteando
        float selector =random(-2.9, 2.9);// variable que se encuentra entre -2.9 y 2.9 con la cual se decide si se agrega un cuadrado o un circulo
        if (selector>0) {
          figuritas.add(new Circulo()); // agrega figuritas
        }
        else if (selector<0) {
          figuritas.add(new Cuadrado());
        }
      } 
      break;
    }
  }
  public void tecla(char a){ // cuando se oprime la tecla defina (r) se resetea, el &&figuritas.size, es para que no se trabe al oprimir r cuandon no hay nada que resetear
    if(key==a&&figuritas.size()!=0){
      reset=true;
    }
  }
}

