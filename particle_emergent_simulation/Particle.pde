class Particle {
  int type;
  PVector pos;
  PVector vel;
  color col;
  Particle(int _type) {
    type = _type;
    pos = new PVector(random(0, width), random(0, height));
    //pos = new PVector(width/3+random(-1,1),height/3+random(-1,1));
    vel = new PVector(0, 0);
    col = types[type].col;
  }


  void Render() {

    if (vel.mag() > 15) {
      vel.setMag(15);
    }
    //vel.x = restrict(vel.x,-10,10);
    //vel.y = restrict(vel.y,-10,10);

    pos.add(vel);
    vel.mult(friction);

    pos.x = restrict(pos.x, 0, width);
    pos.y = restrict(pos.y, 0, height);

    noStroke();
    fill(col);
    ellipseMode(CENTER);
    ellipse(pos.x, pos.y, particleSize, particleSize);
  }

  void randomType() {
    type = int(random(0, typesAmount));
    col = types[type].col;
  }
}
