// AYUDA DE JOSE BOLAÑOS CON LAS CONDICION DE LOS ESCUDOS.

//imageMode(CENTER);
public class Logica {
  private PFont fuente; // la fuente que utilizare
  private int nivel;
  private PImage corazon; // muestra cuantas vidas quedan.
  private int pantalla; // indice de mi arreglo pantalla. permite cambio de pantalla
  private PImage inicio;// imagen pantalla de inicio
  private PImage instrucciones;// imagen pantalla de instrucciones
  private PImage fondo; // fondo pantalla de juego.
  private PImage resumen;// imagen pantalla de resumen (puntaje final)
  private PImage gameOver;// pantalla al perder
  //balas//
  private Poder podersito; // objeto para obtener el poder especial
  private Coco bala; // coco o bala personaje
  private Especial especial; // poder especial
  private Escudo escudoA; // escudo uno
  private Escudo escudoB;// escudo dos
  private BalaFresa balaF; // fresa
  private BalaBanano balaB; // banano
  private BalaMango balaM; // mango
  private BalaPina balaP; // pina
  private BalaSandia balasS[]; //balas sandia
  ///
  private Personaje lanzador;
  private int contaEsp;
  //// enemigos////
  private int contaSand; //aparecer sandia en un tiempo
  private Banano bana;
  private Fresa fresita;
  private Pina pina;
  private Mango mango;
  private Sandia sandia;
  /////////////////
  private int puntaje;// contador de puntaje


    public Logica () {
    //imagenes pantallas//
    inicio=loadImage("pantallaprincipal.jpg");
    instrucciones=loadImage("instrucciones.png");
    gameOver=loadImage("gameover.png");
    resumen=loadImage("resumen.jpg");
    ///
    nivel=1; //nivel inicial solo es un numero no hace nada solo aparecer
    fuente= loadFont("Consolas-Bold-48.vlw");
    fondo= loadImage("escenario.png"); // pantalla de fondo sobre la cual se juega.
    puntaje=0;
    lanzador= new Personaje();
    pantalla=0; // contador de pantalla permite cambiar de la pnatalla inicial a introducicon y a las otras pantallas
    //escudos//
    escudoA= new Escudo(400, 200);// crea un escudo 
    escudoB= new Escudo(400, 400);// crea el otro escudo
    ////enemigos///////// 
    // declaro a los enemigos como null para que si al morir no solo se dejen de pitnar sino que dejen de existir, no tener problemas con un error
    fresita= null;
    bana= null;
    pina= null;
    mango= null;
    sandia= null;
    podersito=null;

    //corazon// muestra la cantidad de sangre restante.
    corazon=loadImage("corazones.png");
    ////////balas////////
    ///coco///
    bala=new Coco();
    ///especial///
    especial=new Especial();
    /////fresa////
    balaF= new BalaFresa() ;
    ////banano////
    balaB= new BalaBanano();
    ////mango////
    balaM= new BalaMango();
    ////pina////
    balaP= new BalaPina();
    ///sandia///
    balasS=new BalaSandia[3];
    for (int i=0; i<3;i++) {
      balasS[i]=new BalaSandia();
    }
  }
  //metodo ejecutor
  public void ejecutar() {
    switch(pantalla) {
    case 0:
      image(inicio, 500, 300);  // pantalla inicio
      if (frameCount%200==0) {
        pantalla=1;
        frameCount=0;
      }
      break;
    case 1:
      image(instrucciones, 500, 300);  // pantalla instrucciones
      // cambia al dar click en area sensible
      frameCount=0;
      break;
    case 2:  // pantalla de juego
      ////pinta el fondo/////
      image(fondo, 500, 300);
      ///contador sandia///
      contaSand++;
      // contador especial
      if (lanzador.getArma()==true) {
        contaEsp++;
      }
      //PODER//

      //para que aparesca el podersito a coger, para obtenerlo toca matarlo
      if (podersito==null&&frameCount%850==0) {
        podersito= new Poder();

        if (podersito.getVer()==false) {
          podersito.setVer(true);
        }
      }
      if (podersito!=null) {
        podersito.pintar();
        podersito.mover();

        if (podersito.getPosY()<=-150) {  
          podersito.obtener();       
          podersito=null;
        }
      }

      //desactivar el poder especial despues de un tiempo
      if (lanzador.getArma()==true&&contaEsp%300==0) {
        lanzador.setArma(false);
      }
      if (lanzador!=null) {
        /////bala////
        if (lanzador.getArma()==false) {
          //pintar coco
          if (bala.getDisparado()==true) {
            bala.pintar();
          }
        }
        else if (lanzador.getArma()==true) {
          especial.pintar(); //pinta mi especial en posicion coordinada con el personaje.
          especial.setPosY(lanzador.getPosY()); // SIEMPRE SE PINTA EN EL Y DEL PERSONAJE MIENTRAS ESTE ACTIVO
        }
      }

      //--ESCUDOS--//
      escudoA.pintarA();
      escudoB.pintarB();
      //--colision escudos--//
      //bala freas vs escudoA
      if (fresita!=null) {
        if (dist(balaF.getPosX(), balaF.getPosY(), escudoA.getPosX(), escudoA.getPosY())<=100&&escudoA.getAlfa()>0) {// evalua distancia entre bala y escudo
          balaF.setPosX(fresita.getPosX()); 
          escudoA.setAlfa(escudoA.getAlfa()-30);
        }
      }
      //bala banana vs escudoA
      if (bana!=null) {
        if (dist(balaB.getPosX(), balaB.getPosY(), escudoA.getPosX(), escudoA.getPosY())<=100&&escudoA.getAlfa()>0) {// evalua distancia entre bala y escudo
          balaB.setPosX(bana.getPosX()); 
          escudoA.setAlfa(escudoA.getAlfa()-30);
        }
      }
      //bala pina vs escudoA
      if (pina!=null) {
        if (dist(balaP.getPosX(), balaP.getPosY(), escudoA.getPosX(), escudoA.getPosY())<=100&&escudoA.getAlfa()>0) {// evalua distancia entre bala y escudo
          balaF.setPosX(pina.getPosX()); 
          escudoA.setAlfa(escudoA.getAlfa()-30);
        }
      }
      //bala mango vs escudoA
      if (mango!=null) {
        if (dist(balaM.getPosX(), balaM.getPosY(), escudoA.getPosX(), escudoA.getPosY())<=100&&escudoA.getAlfa()>0) { // evalua distancia entre bala y escudo
          balaM.setPosX(mango.getPosX()); 
          escudoA.setAlfa(escudoA.getAlfa()-30);
        }
      }
      //balas sandia vs escudoA
      if (sandia!=null) {
        for (int i=0; i<3;i++) { //repetitiva para evaluar la distancia de todas las balas de sandia
          if (dist(balasS[i].getPosX(), balasS[i].getPosY(), escudoA.getPosX(), escudoA.getPosY())<=100&&escudoA.getAlfa()>0) {
            balasS[i].setPosX(sandia.getPosX()); 
            escudoA.setAlfa(escudoA.getAlfa()-30);
          }
        }
      }
      //bala freas vs escudoB
      if (fresita!=null) {
        if (dist(balaF.getPosX(), balaB.getPosY(), escudoB.getPosX(), escudoB.getPosY())<=100&&escudoB.getAlfa()>0) {// evalua distancia entre bala y escudo
          balaF.setPosX(fresita.getPosX()); 
          escudoB.setAlfa(escudoB.getAlfa()-30);
        }
      }
      //bala banana vs escudoB
      if (bana!=null) {
        if (dist(balaB.getPosX(), balaB.getPosY(), escudoB.getPosX(), escudoB.getPosY())<=100&&escudoB.getAlfa()>0) {// evalua distancia entre bala y escudo
          balaB.setPosX(bana.getPosX()); 
          escudoB.setAlfa(escudoB.getAlfa()-30);
        }
      }
      //bala pina vs escudoB
      if (pina!=null) {
        if (dist(balaP.getPosX(), balaP.getPosY(), escudoB.getPosX(), escudoB.getPosY())<=100&&escudoB.getAlfa()>0) {// evalua distancia entre bala y escudo
          balaF.setPosX(pina.getPosX()); 
          escudoB.setAlfa(escudoB.getAlfa()-30);
        }
      }
      //bala mango vs escudoB
      if (mango!=null) {
        if (dist(balaM.getPosX(), balaM.getPosY(), escudoB.getPosX(), escudoB.getPosY())<=100&&escudoB.getAlfa()>0) { // evalua distancia entre bala y escudo
          balaM.setPosX(mango.getPosX()); 
          escudoB.setAlfa(escudoB.getAlfa()-30);
        }
      }
      //balas sandia vs escudoB
      if (sandia!=null) {
        for (int i=0; i<3;i++) { //repetitiva para evaluar la distancia de todas las balas de sandia
          if (dist(balasS[i].getPosX(), balasS[i].getPosY(), escudoB.getPosX(), escudoB.getPosY())<=100&&escudoB.getAlfa()>0) {
            balasS[i].setPosX(sandia.getPosX()); 
            escudoB.setAlfa(escudoB.getAlfa()-30);
          }
        }
      }
      //bala coco vs escudoA
      if (lanzador!=null) {
        if (dist(bala.getPosX(), bala.getPosY(), escudoB.getPosX(), escudoA.getPosY())<=50&&escudoA.getAlfa()>0) { // evalua distancia entre bala y escudo
          escudoA.setAlfa(escudoA.getAlfa()-30);
          bala.setVer(false);
          bala.setDisparado(false);
          bala.setPosX(-100);
        }
      }
      //bala coco vs escudoB
      if (lanzador!=null) {
        if (dist(bala.getPosX(), bala.getPosY(), escudoB.getPosX(), escudoB.getPosY())<=50&&escudoB.getAlfa()>0) { // evalua distancia entre bala y escudo
          escudoB.setAlfa(escudoB.getAlfa()-30);
          bala.setVer(false);
          bala.setDisparado(false);
          bala.setPosX(-100);
        }
      }
      //-------ENEMIGOS----------//
      ////enemigo fresa////
      if (fresita==null&&frameCount%120==0) {
        fresita= new Fresa();
        balaF.setPosX(fresita.getPosX());
        balaF.setPosY(fresita.getPosY());
        if (fresita.getVer()==false) {
          fresita.setVer(true);
        }
      }
      if (fresita!=null) {
        fresita.pintar();
        fresita.mover(); 
        // bala de la fresa disparar
        if (fresita.getVer()==true) {
          if (frameCount%80==0) {
            if (balaF.getDisparado()==false) {
              balaF= new BalaFresa();
              balaF.setDisparado(true); 
              balaF.setVer(true);
              balaF.setPosY(fresita.getPosY());
              balaF.setPosX(fresita.getPosX());
            }
          }     
          if (balaF.getDisparado()==true) {
            balaF.pintar();
            balaF.morir();// sirve para cuando llega al limite
          }
        }
        if (fresita.getPosX()<=0) {
          fresita.morir();       
          fresita=null;
        }
      }
      ////enemigo banano//////
      if (bana==null&&frameCount%(int)random(100, 200)==0) {
        bana= new Banano();
        balaB.setPosX(bana.getPosX());
        balaB.setPosY(bana.getPosY());
        if (bana.getVer()==false) {
          bana.setVer(true);
        }
      }
      if (bana!=null) {
        bana.pintar();
        bana.mover();
        // bala del banano disparar
        if (bana.getVer()==true) {
          if (frameCount%30==0) {
            if (balaB.getDisparado()==false) {
              balaB= new BalaBanano();
              balaB.setDisparado(true); 
              balaB.setVer(true);
              balaB.setPosY(bana.getPosY());
              balaB.setPosX(bana.getPosX());
            }
          }     
          if (balaB.getDisparado()==true) {
            balaB.pintar();
            balaB.morir(); // sirve para cuando llega al limite
          }
        }
        if (bana.getPosX()<=-150) {
          bana.morir();
          balaB.morir();
          bana=null;
        }
      }
      ////enemigo pina////
      if (pina==null&&frameCount%(int)random(180, 250)==0) {
        pina= new Pina();
        balaP.setPosX(pina.getPosX());
        balaP.setPosY(pina.getPosY());
        if (pina.getVer()==false) {
          pina.setVer(true);
        }
      }
      if (pina!=null) {
        pina.pintar();
        pina.mover();
        // bala de la pina disparar
        if (pina.getVer()==true) {
          if (frameCount%10==0) {
            if (balaP.getDisparado()==false) {
              balaP= new BalaPina();
              balaP.setDisparado(true); 
              balaP.setVer(true);
              balaP.setPosY(pina.getPosY());
              balaP.setPosX(pina.getPosX());
            }
          }     
          if (balaP.getDisparado()==true) {
            balaP.pintar();
            balaP.morir();// sirve para cuando llega al limite
          }
        }
        if (pina.getPosX()<=-100) {
          pina.morir();
          pina=null;
        }
      }
      ////enemigo mango////
      if (mango==null&&frameCount%143==0) {
        mango= new Mango();
        balaM.setPosX(mango.getPosX());
        balaM.setPosY(mango.getPosY());
        if (mango.getVer()==false) {
          mango.setVer(true);
        }
      }
      if (mango!=null) {
        mango.pintar();
        mango.mover();
        // bala del mango disparar
        if (mango.getVer()==true) {
          if (frameCount%60==0) {
            if (balaM.getDisparado()==false) {
              balaM= new BalaMango();
              balaM.setDisparado(true); 
              balaM.setVer(true);
              balaM.setPosY(mango.getPosY());
              balaM.setPosX(mango.getPosX());
            }
          }     
          if (balaM.getDisparado()==true) {
            balaM.pintar();
            balaM.morir(); // sirve para cuando llega al limite
          }
        }
        if (mango.getPosX()<0) {
          mango.morir();
          mango=null;
        }
      }
      ////////////////
      ////enemigo sandia////
      println(contaSand);
      if (contaSand%480==0&&sandia==null) {
        contaSand=0;
        sandia= new Sandia();
        for (int i=0; i<3; i++) {
          balasS[i].setPosX(sandia.getPosX());
          balasS[i].setPosY(sandia.getPosY());
        }
        if (sandia.getVer()==false) {
          sandia.setVer(true);
        }
      }
      if (sandia!=null) {
        sandia.pintar();
        sandia.mover();
        // balas de la sandia disparar, dispara 3 al tiempo
        ///bala 1///
        if (sandia.getVer()==true) {
          if (frameCount%60==0) {
            if (balasS[0].getDisparado()==false) {
              balasS[0]= new BalaSandia();
              balasS[0].setDisparado(true); 
              balasS[0].setVer(true);
              balasS[0].setPosY(sandia.getPosY()-20);
              balasS[0].setPosX(sandia.getPosX());
            }
          }     
          if (balasS[0].getDisparado()==true) {
            balasS[0].pintar();
            balasS[0].morir(); // sirve para cuando llega al limite
          }
        }
        ///bala 2///
        if (sandia.getVer()==true) {
          if (frameCount%60==0) {
            if (balasS[1].getDisparado()==false) {
              balasS[1]= new BalaSandia();
              balasS[1].setDisparado(true); 
              balasS[1].setVer(true);
              balasS[1].setPosY(sandia.getPosY()+55);
              balasS[1].setPosX(sandia.getPosX());
            }
          }     
          if (balasS[1].getDisparado()==true) {
            balasS[1].pintar();
            balasS[1].morir();// sirve para cuando llega al limite
          }
        }
        ///bala 3///
        if (sandia.getVer()==true) {
          if (frameCount%60==0) {
            if (balasS[2].getDisparado()==false) {
              balasS[2]= new BalaSandia();
              balasS[2].setDisparado(true); 
              balasS[2].setVer(true);
              balasS[2].setPosY(sandia.getPosY()-85);
              balasS[2].setPosX(sandia.getPosX());
            }
          }     
          if (balasS[2].getDisparado()==true) {
            balasS[2].pintar();
            balasS[2].morir();// sirve para cuando llega al limite
          }
        }
        if (sandia.getPosY()<=-200) {      
          sandia.morir();
          sandia=null;
          contaSand=0;
        }
      }
      ////////////////
      ///pintar lanzador////
      if (lanzador!=null) {
        lanzador.pintar();
      }
      /////

      //---COLISIONES------//////////  en esta parte se evaluaran las distancia entre las balas y los diferentes personajes para matarlos o bajar vida

      //ESPECIAL VS ENEMIGOS// // el especial no afecta al enemigo mayor, la sandia, para darle un poco de dificultad al juego.
      //fresa
      if (lanzador.getArma()==true) {
        if (fresita!=null) {
          if (especial.getPosY()-fresita.getPosY()<=100&&especial.getPosY()-fresita.getPosY()>=-100) { // mata entre esos dos valores
            fresita.morir();
            balaF.setPosX(1500); // ALEJARLO CUANDO MATE AL ENEMIGO Y NO QUEDE LA BALA AHI DONDE DESAPARECIO.
            balaF.morir(); 
            fresita= null;
            puntaje+=100;
          }
        }
      }
      //mango
      if (lanzador.getArma()==true) {
        if (mango!=null) {
          if (especial.getPosY()-mango.getPosY()<=100) {
            mango.morir();
            balaM.setPosX(1500); // ALEJARLO CUANDO MATE AL ENEMIGO Y NO QUEDE LA BALA AHI DONDE DESAPARECIO.
            balaM.morir(); 
            mango= null;
            puntaje+=100;
          }
        }
      }
      // banano
      if (lanzador.getArma()==true) {
        if (bana!=null) {
          if (especial.getPosY()-bana.getPosY()<=100) {
            bana.morir();
            balaB.setPosX(1500); // ALEJARLO CUANDO MATE AL ENEMIGO Y NO QUEDE LA BALA AHI DONDE DESAPARECIO.
            balaB.morir(); 
            bana= null;
            puntaje+=200;
          }
        }
      }
      //  pina
      if (lanzador.getArma()==true) {
        if (pina!=null) {
          if (especial.getPosY()-pina.getPosY()<=100) {
            pina.morir();
            balaP.setPosX(1500); // ALEJARLO CUANDO MATE AL ENEMIGO Y NO QUEDE LA BALA AHI DONDE DESAPARECIO.
            balaP.morir(); 
            pina= null;
            puntaje+=100;
          }
        }
      }

      //COCO vs ENEMIGOS//
      // PODER// para coger el poder, destruir el logo
      if (podersito!=null) { 
        if (dist(bala.getPosX(), bala.getPosY(), podersito.getPosX(), podersito.getPosY())<=60) {
          podersito.setVer(true);
          lanzador.setArma(true);
          podersito=null;
        }
      }
      // FRESA //
      if (fresita!=null) {  // necesario en todos los casos para que mientras fresita no exista no pase nada y no mande error
        if (dist(bala.getPosX(), bala.getPosY(), fresita.getPosX(), fresita.getPosY())<=67) {
          fresita.morir();
          balaF.setPosX(1500); // ALEJARLO CUANDO MATE AL ENEMIGO Y NO QUEDE LA BALA AHI DONDE DESAPARECIO.
          balaF.morir();
          bala.setVer(false);
          bala.setDisparado(false); 
          bala.setPosX(-100); // que no este en pantalla
          fresita= null;
          puntaje+=100;
        }
      }
      // BANANO //
      if (bana!=null) {  // necesario en todos los casos para que mientras fresita no exista no pase nada y no mande error
        if (dist(bala.getPosX(), bala.getPosY(), bana.getPosX(), bana.getPosY())<=90) {
          bana.morir();
          balaB.setPosX(1500); // ALEJARLO CUANDO MATE AL ENEMIGO Y NO QUEDE LA BALA AHI DONDE DESAPARECIO.
          balaB.morir();
          bala.setVer(false);
          bala.setDisparado(false);
          bala.setPosX(-100); // que no este en pantalla
          bana= null;
          puntaje+=200;
        }
      }
      // MANGO //
      if (mango!=null) {  // necesario en todos los casos para que mientras fresita no exista no pase nada y no mande error
        if (dist(bala.getPosX(), bala.getPosY(), mango.getPosX(), mango.getPosY())<=70) {
          mango.morir();
          balaM.setPosX(1500); // ALEJARLO CUANDO MATE AL ENEMIGO Y NO QUEDE LA BALA AHI DONDE DESAPARECIO.
          balaM.morir();
          bala.setVer(false);
          bala.setDisparado(false);
          bala.setPosX(-100); // que no este en pantalla
          mango= null;
          puntaje+=100;
        }
      }
      // PINA //
      if (pina!=null) {  // necesario en todos los casos para que mientras fresita no exista no pase nada y no mande error
        if (dist(bala.getPosX(), bala.getPosY(), pina.getPosX(), pina.getPosY())<=90) {
          pina.morir();
          balaP.setPosX(1500); // ALEJARLO CUANDO MATE AL ENEMIGO Y NO QUEDE LA BALA AHI DONDE DESAPARECIO.
          balaP.morir();
          bala.setVer(false);
          bala.setDisparado(false);
          bala.setPosX(-100); // que no este en pantalla
          pina= null;
          puntaje+=100;
        }
      }
      // SANDIA//
      if (sandia!=null) {  // necesario en todos los casos para que mientras fresita no exista no pase nada y no mande error
        if (dist(bala.getPosX(), bala.getPosY(), sandia.getPosX(), sandia.getPosY())<=90) {
          sandia.setVida(sandia.getVida()-1);
          if (sandia.getVida()==0) {
            sandia.morir();
            for (int i=0; i<3;i++) {
              balasS[i].setPosX(1500); // ALEJARLO CUANDO MATE AL ENEMIGO Y NO QUEDE LA BALA AHI DONDE DESAPARECIO.
            }
            contaSand=0;
            sandia= null;
            puntaje+=1000;
          }
          bala.setVer(false);
          bala.setDisparado(false);
          bala.setPosX(-100); // que no este en pantalla
        }
      }
      // PERSONAJE //
      /**las balas desaparecen al tocar al personaje y se resetean, la sangre del personaje se reduce en 1 
       y cuando la sangre llegue a 0 la vida se disminuye en 1 y se resetean los valores del personaje
       cuando vida llegue a 0 aparece gameover. */
      // bala del mango
      if (lanzador!=null) {
        if (lanzador.getSangre()==0) {
          lanzador.morir();
          pantalla=3; // pantalla de game over
        }
        if (dist(balaM.getPosX(), balaM.getPosY(), lanzador.getPosX(), lanzador.getPosY())<=70&&balaM.getPosX()>135) {  
          balaM.morir();
          balaM.setPosX(mango.getPosX()); 
          lanzador.setSangre(lanzador.getSangre()-1);
        }
        // bala de la fresa
        if (dist(balaF.getPosX(), balaF.getPosY(), lanzador.getPosX(), lanzador.getPosY())<=70&&balaF.getPosX()>135) {
          balaF.morir();
          balaF.setPosX(fresita.getPosX());
          lanzador.setSangre(lanzador.getSangre()-1);
        }
        // bala de la pina
        if (dist(balaP.getPosX(), balaP.getPosY(), lanzador.getPosX(), lanzador.getPosY())<=70&&balaP.getPosX()>135) {
          balaP.morir();
          balaP.setPosX(pina.getPosX());   
          lanzador.setSangre(lanzador.getSangre()-1);
        }
        // bala del banano
        if (dist(balaB.getPosX(), balaB.getPosY(), lanzador.getPosX(), lanzador.getPosY())<=70&&balaB.getPosX()>135) {     
          balaB.morir();
          balaB.setPosX(bana.getPosX());   
          lanzador.setSangre(lanzador.getSangre()-1);
        }
        // bala de la sandia. si la sandia te toca mueres.
        for (int i=0; i<3; i++) {
          if (dist(balasS[i].getPosX(), balasS[i].getPosY(), lanzador.getPosX(), lanzador.getPosY())<=70&&balasS[i].getPosX()>135) {     
            balasS[i].morir();
            balasS[i].setPosX(sandia.getPosX());   
            lanzador.setSangre(lanzador.getSangre()-2);
          }
        }
      }
      // CAMBIO DE NIVEL//
      if (frameCount>1800) {
        nivel=2;
        // frame count para que el letrero sea visible solo durante unos segundos.
        if (frameCount<2000) {
          textFont(fuente, 44); //
          text("Nv:"+nivel, 400, 300); // muestra en pantalla el nivel
        }
        // aumento la velocidad de todas las balas y todos los enemigos teniendo en cuenta si existen o no existen
        if (balaP!=null) {
          balaP.setVel(10);
        }
        if ( balaM!=null) {
          balaM.setVel(11);
        }
        if (balaF!=null) {
          balaF.setVel(13);
        }
        if (balaB!=null) {
          balaB.setVel(10);
        }
        for (int i=0;i<3;i++) {
          if (balasS[i]!=null) {
            balasS[i].setVel(10);
          }
        }
        if (mango!=null) {
          mango.setVel(3);
        }
        if (bana!=null) {
          bana.setVel(2);
        }
        if (pina!=null) {
          pina.setVel(6);
        }
        if (fresita!=null) {
          fresita.setVel(4);
        }
      }
      if (frameCount==1800) {  // ganar vida al cambiar de nivel
        lanzador.setSangre(lanzador.getSangre()+1);
      }
      if (frameCount==3600) {  // ganar.
        pantalla=4;
      }
      println(frameCount);
      //Texto del puntaje//
      textFont(fuente, 44); //escojo una fuente
      text("Puntaje:"+puntaje, 400, 580);
      /////////////////////
      // pintar corazones que representan la sangre
      for (int i =0; i<lanzador.getSangre(); i++) {
        image(corazon, 25, (i*40)+30);
      }
      break;
    case 3:
      image(gameOver, 500, 300);  // pantalla perder
      // cambia al dar click en area sensible
      break;
    case 4: 
      image(resumen, 500, 300);  // pantalla inicio
      textFont(fuente,72);
      text("FELICITACIONES", 400, 200);
      text("HAS GANADO",400,270);
      text("PUNTAJE:"+puntaje, 400, 360);
      // cambia al dar click en area sensible
    }
  }
  public void tecla() {

    if (keyCode==UP&&lanzador.getPosY()>0) {
      lanzador.moverArriba();
    }
    if (keyCode==DOWN&&lanzador.getPosY()<600) {
      lanzador.moverAbajo();
    }
    if (key ==' ') {
      if (bala.getDisparado()==false) {  
        bala= new Coco(); 
        bala.setVer(true);
        bala.setDisparado(true);  
        bala.setPosY(lanzador.getPosY());
      }
    }
  }
  public void click(int mX, int mY) {
    if (pantalla==1) {
      if (dist(mX, mY, 900, 525)<50) { // avanzar al jeugo 
        pantalla=2;
      }
    }
    else
      if (pantalla==3) { // pantalla gameover 
        if (dist(mX, mY, 950, 575)<50) {  // salir del juego
          exit();
        }
      }
  }
}

