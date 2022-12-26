import oscP5.*;
import netP5.*;

PFont font ;

String [] PalabrasTexto = {"Agua", "envase", "retornable", "cobertura", "transparencia", "vapor", "propia", "sudor", "saliva", "mundo", "ombligo", "panza", "feto", "circular", "patada", "cobertura", "piña", "luz", "sombra", "input", "output", "presencia", "cuerpxs", "afectar", "destacar", "regla", "medir", "espiral", "no binarie", "híbrido", "oscilar", "vagar", "babear", "divagar", "rio", "baba", "sol", "caracol", "babosa", "reposa", "contempla", "gomosa", "osa", "ocio", "arrastra", "pasa", "huella", "vida", "tiempo", "sal", "mojar", "nuestro", "cansar", "mismo", "habitar", "carga", "agotar", "agua", "piel", "baba", "trans", "portar", "fluir", "contaminación", "rolar", "política", "gotas", "registro", "sumergir", "luz", "emoción", "cara", "cabeza", "superponer", "espiral", "tecnología", "permanencia", "temporalidad", "espacial", "especial", "especia", "especie", "tejido", "blando", "sumergir", "temblor", "desorientar", "amorfo", "redemoinho", "inmersión", "onda", "espiral", "gota", "magia", "continuidad", "estado", "flotación", "tubo", "llevar(se)"};


// IMPORT THE SPOUT LIBRARY
import spout.*;
ParticleSystem PS;
Repeler repeler;
// DECLARE A SPOUT OBJECT
Spout spout;

boolean debug = false;
boolean dibujarRepeler = false;

//Si esta variable esta en 0 mueve el PS,1 el repeler

OscP5 oscP5;
NetAddress myRemoteLocation;

int moveObject = 0;
void setup() {

  size(1280, 720, P3D);
  font = loadFont("Dialog.plain-48.vlw");
  PS = new ParticleSystem();
  textAlign(CENTER, CENTER);

  spout = new Spout(this);

  spout.setSenderName("Particle System Ps");
  textSize(FontSiz);

  repeler = new Repeler();
 
  //RECIEVE
  oscP5 = new OscP5(this,4045);
   //SEND
  myRemoteLocation = new NetAddress("127.0.0.1",12000);
}


void keyPressed() {
  if (key == 'd') {
    debug = !debug;
  }

  if (key == '1') {
    moveObject = 0;
  }
  if (key == '2') {
    moveObject = 1;
  }
    if (key == 'r') {
    dibujarRepeler = !dibujarRepeler;
  }
}
void draw() {
  background(0);

  textSize(FontSiz);


  PS.display();
  PS.update();

  if (dibujarRepeler) {
    repeler.display();
  }
  repeler.update();
  if (mousePressed) {
    if (moveObject == 0) {
      PS.setPos(mouseX, mouseY);
    }
    if (moveObject == 1) {
      repeler.setPos(mouseX, mouseY);
    }
  }



  //PS.addForce(dir);  
  PS.reppel(repeler);
  //PS.atract(repeler);

  //PS.addForce(new PVector(0.005,0.005));
  // Send at the size of the window    
  spout.sendTexture();
  //  text("palabra",width/2,height/2);

  if (debug) {
    fill(255);
    textSize(10);
    text(frameRate, 40, 20);
  }
}
