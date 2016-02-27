public class Circulo extends Figura {
  private int estado;
  public Circulo() {
    estado=0;
  } 
  ///---METODO PARA PINTAR---///
  //pintar para pintar el circulo.
  public void pintar() {
    fill(getRojo(), getVerde(), getAzul(), 100);
    ellipse(getPosX(), getPosY(), getAncho(), getAncho());
  }
}

