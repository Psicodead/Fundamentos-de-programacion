int posX;
int posY;
int colores[] = new int[100];
int indice;

void setup() {
  size(200, 200);
  indice=0;
  for (int i=0;i<99;i++) {
    colores[i]=0;
  }
  stroke(2);
  stroke(255);
}
void draw() {
  
  background(255);
  posX=0;
  posY=0;
  for (int j=0; j<10; j++) {
    for (int k=0; k<10;k++) {
      fill(colores[k + (j*10)]);
      rect(posX, posY, 20, 20);
      posX+=20;
    }
    if(posX<=200){
      posX=0;
  }
  posY+=20;
}
}
void mousePressed() {
  colores[indice]+=60;
  indice++;
    if(indice>99){
    indice=0;}
}

