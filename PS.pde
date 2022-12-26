class ParticleSystem {
  ArrayList<Particle> particles = new ArrayList<Particle>();
  PVector pos;
  float duration = Gduration;
  float lastime=0;
  ParticleSystem() {
    pos = new PVector(width/2, height/2);
  }
  void addForce(PVector _force){
    for (int i=particles.size()-1; i>0; i--) {
      Particle p = particles.get(i);
      p.accel.add(_force);
    }
  }
  
  void reppel(Repeler R){
    for (int i=particles.size()-1; i>0; i--) {
      Particle p = particles.get(i);
        PVector dir = PVector.sub(p.pos,repeler.pos);
        dir.normalize();
        dir.mult(0.007);
        p.accel.add(dir);
    }
    
  }
    void atract(Repeler R){
    for (int i=particles.size()-1; i>0; i--) {
      Particle p = particles.get(i);
        PVector dir = PVector.sub(p.pos,repeler.pos);
        dir.normalize();
        dir.mult(0.007);
        dir.mult(-1);
        p.accel.add(dir);
    }
  }
  
  
  
  void display() {
    for (int i=particles.size()-1; i>0; i--) {
      Particle p = particles.get(i);
      p.display();
    }
  }

  void update() {
    for (int i=particles.size()-1; i>0; i--) {
      Particle p = particles.get(i);
      p.update();

      if (p.life < 0) {
        particles.remove(p);
      }
    }
    if(millis() - lastime > random(duration)){
      addParticle(); 
      lastime = millis();
    }
  }
  void setPos(float _x,float _y){
     pos.x = _x;
     pos.y = _y;
   }
  void addParticle() {
    Particle p = new Particle(PalabrasTexto[int(random(PalabrasTexto.length))], 
      new PVector(pos.x, pos.y), random(20, 30));
    particles.add(p);
  }
}
