class Tornado {
 ArrayList<Particle> particles = new ArrayList<Particle>();
 int h;  // the height of the tornado, we'll estimate the amount of particules from it
 float hue;
 float x;
 float z;
 float rotationSpeed;
 
 Tornado(int h_, float hue_, float x_, float z_, float rs) {
   h = h_;
   hue = hue_;
   x = x_;
   z = z_;
   rotationSpeed = rs;
 }
 
 void generate() {
   float bWidth = h/20;
   float topWidth = h/3;
   float power = 2;
   
   for (int i = 0; i < h; i++) {
    // distribute the particle more visually evenly across the height using normal distribution
    float rand = randomGaussian();
    rand = abs(rand);
    rand = rand % 2;
    float y = map(rand, 0, 2, -h, 0);
    //float y = -random(h);
    
    float r = (float)Math.pow(map(y, h, 0, topWidth, 0), power);
    float temp = (float)Math.pow(topWidth, power);
    r = map(r, 0, temp, 0, topWidth) + bWidth;
    float angle = random(-PI, PI);
    float px = r*cos(angle);
    float pz = r*sin(angle);
    particles.add(new Particle(px, y, pz, hue, rotationSpeed));
   } 
 }
 
 void display(float off) {
   for (Particle p : particles) {
     float mult = map(p.y, -h, 0, 20, 200);
     p.display(x,z, off*mult);
   }
 }
  
}
