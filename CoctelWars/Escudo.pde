public class Escudo {
  private int posX;
  private int posY;
 private int  alfa; // sugerencia de jose bolanos.
  private PImage escudoA;
  private PImage escudoB;

  public Escudo(int x, int y) { 
    posX=x;
    posY=y;
    alfa= 255;
    escudoA= loadImage ("sombrillaUno.png");
    escudoB=loadImage("sombrillaDos.png");
  }
  public void pintarA() {
    tint(255, 255, 255, alfa);
    image(escudoA, posX, posY,90,90);
    noTint();
  }
  public void pintarB() {
    tint(255, 255, 255, alfa);
    image(escudoB, posX, posY,90,90);
    noTint();
  }
  
  public int getPosX() {
    return posX;
  }

  public int getPosY() {
    return posY;
  }
 
  public int getAlfa() {
    return alfa;
  }
 
  public void setAlfa(int a) {
    alfa=a;
  }
}
