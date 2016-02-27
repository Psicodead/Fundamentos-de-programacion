Logica app;

void setup(){
  size(1000,600);
  app=new Logica();
}
void draw(){
  background(255);
  app.ejecutar();
      
}
void keyPressed () {
app.tecla ();
}

void mousePressed(){
  app.click(mouseX,mouseY);
}
  
