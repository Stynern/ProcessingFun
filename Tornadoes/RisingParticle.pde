class RisingParticle extends Particle {
  Tornado owner;  // the tornado the particle belongs to
  float angle;  // the angular starting position of the particle

  RisingParticle(float x_, float y_, float z_, float hue_, float rotationSpeed, Tornado t, float a) {
    super(x_, y_, z_, hue_, rotationSpeed);
    owner = t;
    angle = a;
  }

  // the display method that TAKES the size of the dots as argument (depth)
  @Override
    void display(float posx, float posz, float off, int depth) {
    strokeWeight(depth);
    pushMatrix();
    translate(posx+off, 0, posz+off);
    rotateY(rotation);

    // Hue, Saturation, Brightness, Alpha
    stroke(hue, 255, 255, 200);

    float r = owner.calculateRadius(y);  // the radius has to be recalculated as the particle rises up
    x = r*cos(angle);
    z = r*sin(angle);
    point(x, y, z);
    popMatrix();
    rotation += rs;
    y = calculateY();
  }

  float calculateY() {
    float risingSpeed = Math.abs(rs*50);  // trying with rising speed based on rotation speed
    float posY = y - risingSpeed;
    
    // if we get higher than the top of the tornado, restart at the bottom
    if (posY < -owner.h )
      return 0;
    else
      return posY;
  }
}
