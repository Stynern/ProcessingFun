class Particle {
  // the position of the particle
  float x;
  float y;
  float z;
  
  float hue;  // the hue of the particle
  float rotation = 0;  // the rotation of the particle
  float rs;  // the rotation speed of the particle

  Particle(float x_, float y_, float z_, float hue_, float rotationSpeed) {
    x = x_;
    y = y_;
    z = z_;

    //  modify the hue and the speed to be slightly offset from the tornadoes values
    float rand = randomGaussian();
    rand = abs(rand);
    rand = rand % 3;

    hue = hue_ + rand*20;
    rs = rotationSpeed + rand*0.02;
  }

  // the display method that TAKES the size of the dots as argument (depth)
  void display(float posx, float posz, float off, int depth) {
    strokeWeight(depth);
    pushMatrix();
    translate(posx+off, 0, posz+off);
    rotateY(rotation);

    // Hue, Saturation, Brightness, Alpha
    stroke(hue, 255, 255, 200);

    point(x, y, z);
    popMatrix();
    rotation += rs;
  }
}
