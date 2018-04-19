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
  float bWidth;      // the bottom width of the tornado
  float topWidth;    // the top width of the tornado
  float power = 2;   // the value used to calculate the curve of the tornado

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
    bWidth = h/20;
    topWidth = h/3;
  }

  void generate() {
    for (int i = 0; i < h; i++) {
      // distribute the particle more visually evenly across the height using normal distribution
      // that is I force more particules towards the top as it has a larger radius
      float rand = randomGaussian();
      rand = abs(rand);
      rand = rand % 2;
      float y = map(rand, 0, 2, -h, 0);

      float r = calculateRadius(y);
      float angle = random(-PI, PI);
      float px = r*cos(angle);
      float pz = r*sin(angle);
      //particles.add(new Particle(px, y, pz, hue, rotationSpeed));
      particles.add(new RisingParticle(px, y, pz, hue, rotationSpeed, this, angle));
    }
  }
  
  float calculateRadius(float y) {
    float r = (float)Math.pow(map(y, h, 0, topWidth, 0), power);
    float temp = (float)Math.pow(topWidth, power);
    return map(r, 0, temp, 0, topWidth) + bWidth;
  }

  void display(float off, float camX, float camY, float camZ) {
    // calculate the size of the dots to display 
    float depth = map(dist(x, h/2, z, camX, camY, camZ), 1400, 3500, 6, 2);
    for (Particle p : particles) {
      float mult = map(p.y, -h, 0, 20, 200);
      p.display(x, z, off*mult, round(depth));      
    }
    
    // TODO: remove
    //for(int i = 0; i<particles.size(); i++) {
    //  float mult = map(particles.get(i).y, -h, 0, 20, 200);
    //  particles.get(i).testDisplay(x, z, off*mult, round(depth), i == 0);
    //}
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
