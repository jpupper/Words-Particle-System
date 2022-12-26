class Particle {

  String palabra;
  PVector pos;
  PVector speed;
  PVector accel;
  float speedlimit ;
  color col;
  float maxspeed ;


  float size_start;
  float size_end;

  float size;

  float life ;
  float angle_start;
  float angle_end;
  float Aangle;

  //PVector positions 

  ArrayList<PVector> Positions = new ArrayList<PVector>();
  Particle(String _palabra, PVector _pos, float _size) {
    palabra = _palabra;
    for (int i=0; i<palabra.length(); i++) {
      Positions.add(new PVector(random(-width/2, width/2), random(-height/2, -height/2)));
    }
    pos = _pos;
    size = _size;
    size_start = random(20, 30);
    size_end = random(5, 10);
    life = 255 ;
    float stspeed = 1;
    float acelforce = AceleracionInicial;
    speed = new PVector(random(-stspeed, stspeed), random(-stspeed, stspeed));
    accel = new PVector(random(-acelforce, acelforce), random(-acelforce, acelforce));
    col = color(255);
    angle_start = 0;
    angle_end = random(-PI/8, PI/8);
    speedlimit = speedLimit;
  }
  void display() {
    //textSize(FontSiz);



    fill(col, life);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(Aangle);
    float sepx =0;
    //text(palabra, 0, 0);
    if (Modoletras) {
      for (int i=0; i<palabra.length(); i++) {
        PVector pf = new PVector(0, 0);
        float li = 0;
        if (life < lifeToLetter) {
          li = map(life, lifeToLetter, 0, 0, 1);
        }
        pf = PVector.lerp(new PVector(0, 0), Positions.get(i), li);
        text(palabra.charAt(i), pf.x+sepx, pf.y);
        sepx += textWidth(palabra.charAt(i));
      }
    } else {
      text(palabra, 0, 0);
    }
    popMatrix();
  }

  void update() {

    Aangle = map(life, 255, 0, angle_start, angle_end);
    size = map(life, 255, 0, size_start, size_end);
    life -= Vida;

    speed.add(accel);

    speed.limit(speedlimit);
    pos.add(speed);

    //checkEdges();
  }
  void checkEdges() {


    //Collide :
    /*if (pos.x > width) {
     speed.x*=-1;
     pos.x = width;
     }
     if (pos.x < 0) {
     speed.x*=-1;
     pos.x = 0;
     }
     if (pos.y > height) {
     speed.y*=-1;
     pos.y = height;
     }
     if (pos.y < 0) {
     speed.y*=-1;
     pos.y = 0;
     }*/

    if (pos.x > width) {
      //speed.x*=-1;
      pos.x = 0;
    }
    if (pos.x < 0) {
      //speed.x*=-1;
      pos.x = width;
    }
    if (pos.y > height) {
      // speed.y*=-1;
      pos.y = 0;
    }
    if (pos.y < 0) {
      //   speed.y*=-1;
      pos.y = height;
    }
  }
}
