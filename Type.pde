class Type {
  color col;
  PVector[] forces = new PVector[typesAmount];
  Type(int id) {
    col = color(random(50,255),random(50,255),random(50,255));
    for (int i = 0; i < 3; i++ ) {
    }
    
    for (int i = 0; i < forces.length; i++ ) {
      forces[i] = new PVector(random(300, 500), random(-0.002, 0.002));
    }
      forces[id] = new PVector(1, random(0.0001, 0.0001));
    
  }
  
  
  
}
