class Repeler {
  PVector pos;
  Repeler() {
    pos = new PVector(width/2, height/2);
  }
  void display() {
    //stroke(255);
    fill(0, 100);
   // ellipse(pos.x, pos.y, 100, 100);
    int cnt = 80;
    for (int i=0; i<cnt; i++) {
      float angle = map(i, 0, cnt, 0, TWO_PI*4.+millis()*0.001)+millis()*0.0001;
      float amps = sin(angle*4.);
      float fase = millis()*0.001;
      float amp = map(i, 0, cnt, 50*amps, 0);
      float xx = sin(angle+fase)*amp+pos.x;
      float yy = cos(angle+fase)*amp+pos.y;
      float w  = map(i, 0, cnt, 2, 5);
      strokeWeight(3);
      stroke(255, 50);
      fill(0, 30);
      ellipse(xx, yy, w, w);
    }
  }

  void update() {
  }

  void setPos(float _x, float _y) {
    pos.x = _x;
    pos.y = _y;
  }
}

/*
arrastrar
 péndulo
 permeabilidad
 poro
 ojo
 pis
 atravesar
 charco
 desborde
 sangre
 giro
 viscoso
 rio
 cascada
 acumulación
 aguas
 estructura liquida
 respirar
 hundirse
 vazamento
 refracción
 conducir
 conectar
 reflejar
 multiforme
 materia
 potencia
 estado
 acariciar
 empapar
 gotear
 deslizar
 resbalar
 humedad y brillo
 rastro
 huella
 patina
 película
 sed
 chorrear
 despacio
 bañar
 nadar
 mojar*/
