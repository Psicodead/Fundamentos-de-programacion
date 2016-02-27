Logica app;
void setup(){
size(1200,700);
app= new Logica();
}
void draw(){
 background(20);
app. ejecutar();
}
void mousePressed(){
  app.click(mouseX,mouseY);
}
void keyPressed(){
  app.tecla('r');
}

