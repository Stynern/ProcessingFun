class Tornado {
 ArrayList<Particle> particles = new ArrayList<Particle>();
 int h;  // the height of the tornado, we'll estimate the amount of particules from it
 float hue;
 float x;
 float z;
 float rotationSpeed;
 int xmin;
 int xmax;
 int zmin;
 int zmax;
 int dirx = 1;
 int dirz = 1;
 
 Tornado(int h_, float hue_, float x_, float z_, float rs, int xmin_, int xmax_, int zmin_, int zmax_) {
   h = h_;
   hue = hue_;
   x = x_;
   z = z_;
   rotationSpeed = rs;
   xmin = xmin_;
   xmax = xmax_;
   zmin = zmin_;
   zmax = zmax_;
   
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
 
 void display(float off, float camX, float camY, float camZ) {
   float depth = map(dist(x,h/2,z, camX, camY, camZ), 1400, 3500, 6, 2);
   for (Particle p : particles) {
     float mult = map(p.y, -h, 0, 20, 200);
     p.display(x,z, off*mult, round(depth));
   }
 }
 
 void move(float off, ArrayList<PVector> tPos) {
   if (!canMoveX(off, tPos)) {
     dirx *= -1;
   }
   x += dirx*off;
    
   if (!canMoveZ(off, tPos)) {
     dirz *= -1;
   }
   z += dirz*off;
 }
 
 boolean canMoveX(float off, ArrayList<PVector> tPos) {
   int zone = 2*h/3 + 10;
   if (x+off <= xmin + zone || x+off - zone >= xmax)
     return false;
   for (PVector p : tPos) {
     if (dist(x+off, z, p.x, p.y) <= zone) {
       return false;
     }
   }
   return true;   
 }
 
 boolean canMoveZ(float off, ArrayList<PVector> tPos) {
   int zone = 2*h/3 + 10;
   if (z+off <= zmin + zone || z+off - zone >= zmax)
     return false;
   for (PVector p : tPos) {
     if (dist(off, z+off, p.x, p.y) <= zone) {
       return false;
     }
   }
   return true;   
 }
  
}
