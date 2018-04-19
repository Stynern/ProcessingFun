class TrailingParticle extends Particle {
  float x0, x1, x3, x4, z0, z1, z3, z4;

  TrailingParticle(float x_, float y_, float z_, float hue_, float rotationSpeed, float angle, float r, int h) {
    super(x_, y_, z_, hue_, rotationSpeed);

    float diff = rotationSpeed*map(y, 0, -h, 0, 1.5);
    x0 = r*cos(angle-2*diff);
    z0 = r*sin(angle-2*diff);
    x1 = r*cos(angle-diff);
    z1 = r*sin(angle-diff);

    x3 = r*cos(angle+diff);
    z3 = r*sin(angle+diff);
    x4 = r*cos(angle+2*diff);
    z4 = r*sin(angle+2*diff);
  }

  // the display method that TAKES the size of the dots as argument (depth)
  @Override
    void display(float posx, float posz, float off, int depth) {
    strokeWeight(1);
    pushMatrix();
    translate(posx+off, 0, posz+off);
    rotateY(rotation);

    // Hue, Saturation, Brightness, Alpha
    stroke(hue, 255, 255, 200);
    noFill();
    beginShape();
    curveVertex(x0, y, z0);
    curveVertex(x1, y, z1);
    curveVertex(x, y, z );
    curveVertex(x3, y, z3);
    curveVertex(x4, y, z4);
    endShape();

    popMatrix();
    rotation += rs;
  }
}
