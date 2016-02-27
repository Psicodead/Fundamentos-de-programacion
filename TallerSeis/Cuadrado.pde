public class Cuadrado extends Figura {
  private int estado;
  public Cuadrado() {
    estado=0;
  }

  ///---METODOS PINTAR---///
  public void pintar() {
    fill(getRojo(), getVerde(), getAzul(), 100);
    rect(getPosX(), getPosY(), getAncho(), getAncho());
  }
  
}

