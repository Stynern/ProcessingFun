
int tCount = 3;
ArrayList<Tornado> tList = new ArrayList<Tornado>();
float[] noiseList = new float[tCount];
float offx = random(100);
float offz = random(100);
boolean record = false;
 
void setup() {
  frameRate(30);
  size(900, 900, P3D);
  colorMode(HSB, 255);
  strokeWeight(8);
  
  for (int i = 0; i < tCount; i++) {
    //Tornado: height, hue, x, z, rotation speed
    int direction = floor(random(2)) == 0 ? -1 : 1;
    Tornado t = new Tornado(floor(random(250, 350)), random(255), random(-600,600), random(-600,600), direction*random(0.04, 0.06));
    t.generate();
    tList.add(t);
    noiseList[i] = random(100);
  }  
}

void draw() {
  background(0);
  camera(000.0, -500, 1500.0, 
         000.0, 000.0, 000.0, 
         0.0, 1.0, 0.0);

  for (int i = 0; i < tCount; i++) {
    tList.get(i).display(noise(noiseList[i])-0.5);
    noiseList[i] += 0.02;
  }
  
  if(record) {
    saveFrame("frames/####.png");
  }    
}

void mouseClicked() {
  record = !record;
}
