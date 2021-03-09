void keyReleased() {
  for (int i = 0; i < typesAmount; i++) {
    types[i] = new Type(i);
  }
  for (int i = 0; i < particles.length; i++) { 
  particles[i].randomType();
  }
}
