
int tCount = 3;
ArrayList<Tornado> tList = new ArrayList<Tornado>();
float[] noiseList = new float[tCount];
float offx = random(100);
float offz = random(100);
boolean record = false;

int floorXmin = -1000;
int floorXmax = 1000;
int floorZmin = -1000;
int floorZmax = 1000;

float cameraAngle = 0;
float cameraDistance = 2000;

void setup() {
  frameRate(30);
  size(900, 900, P3D);
  colorMode(HSB);

  for (int i = 0; i < tCount; i++) {
    int direction = floor(random(2)) == 0 ? -1 : 1;
    float x = random(floorXmin, floorXmax);
    float z = random(floorZmin, floorZmax);
    //Tornado: height, hue, x, z, rotation speed, floor sizes
    Tornado t = new Tornado(300, random(360), x, z, direction*random(0.04, 0.06), floorXmin, floorXmax, floorZmin, floorZmax);
    t.generate();
    tList.add(t);
    noiseList[i] = random(100);
  }
}

void draw() {
  background(0);
  float camX = cameraDistance*cos(cameraAngle);
  float camY = -1000;
  float camZ = cameraDistance*sin(cameraAngle);
  camera(camX, camY, camZ, 
    000.0, 000.0, 000.0, 
    0.0, 1.0, 0.0);
  cameraAngle += 0.005;

  noStroke();
  fill(51);
  beginShape();
  vertex(floorXmin-200, 0, floorZmin-200);
  vertex(floorXmin-200, 0, floorZmax+200);
  vertex(floorXmax+200, 0, floorZmax+200);
  vertex(floorXmax+200, 0, floorZmin-200);
  endShape();


  //tPos.add(new PVector(x, z));
  for (int i = 0; i < tCount; i++) {
    ArrayList<PVector> tPos = new ArrayList<PVector>();
    for (int j = 0; j < tCount; j++) {
      if (j != i) {
        tPos.add(new PVector(tList.get(j).x, tList.get(j).z));
      }
    }

    float wiggle = noise(noiseList[i])-0.5;
    tList.get(i).move(30*wiggle, tPos);
    tList.get(i).display(wiggle, camX, camY, camZ);
    noiseList[i] += 0.02;
  }

  if (record) {
    saveFrame("frames/####.png");
  }
}

void mouseClicked() {
  record = !record;
}
