final int typesAmount = 5; //amount of different types of particles
final int particleAmount = 300; //amount of total particles. Preformance cost increases factorialy
final float particleSize = 150; //Size of the particles. 
final float friction = 0.8; //The velocity is multiplied by this value every frame. Closer to 1 = less friction
final float gravity = 1; //Coefficient for the force bringing the particles to the center

PVector center;

//initializes the arrays
Particle[] particles = new Particle[particleAmount];
Type[] types = new Type[typesAmount];

void setup() {  
  
  frameRate(60);
  size(900,900);  
  center = new PVector(width/2, height/2);
  
  for (int i = 0; i < typesAmount; i++) {
    types[i] = new Type(i);
  }
  for (int i = 0; i < particles.length; i++) {
    particles[i] = new Particle(int(random(0, typesAmount)));
  }
}

void draw() {

  background(0);
  Physics();
  for (int i = 0; i < particles.length; i++) {
    particles[i].Render();
  }
}

void Physics() {
  for (int i = 0; i < particleAmount; i++) {
    for (int j = 0; j < particleAmount; j++) {
      if (j != i) {
        PVector dir = new PVector(particles[j].pos.x - particles[i].pos.x, particles[j].pos.y - particles[i].pos.y);
        float dist = dist(particles[j].pos.x, particles[j].pos.y, particles[i].pos.x, particles[i].pos.y);
        float force = 0;

        PVector f = types[particles[j].type].forces[particles[i].type];
        float b = f.x;
        float c = f.y;
        float a = particleSize+(20000*c);// + 10;
        if (a < particleSize) { a = particleSize;}

        if (dist <= a) {
          force = 0.0005 * pow((dist-a), 2);
        }


        if (dist > a && dist < b) {

          //force = dist/b;
          force = ((c/b) * abs(dist - a - (b/2)));
          if (dist >= a + b) {
            force = 0;
          }
          //println(dist + " " + a + " " + b + " " + c + " " + force);
        }


        force *= 100;
        dir.normalize();
        dir.mult(force);
        particles[j].vel.add(dir);

        PVector cfDir = new PVector(center.x - particles[j].pos.x, center.y - particles[j].pos.y);
        float   cfDist = dist(particles[j].pos.x, particles[j].pos.y, center.x, center.y);
        cfDir.setMag( cfDist * 0.00001 * gravity);

        particles[j].vel.add(cfDir);
      }
    }
  }
}
