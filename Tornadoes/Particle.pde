class Particle {
  float x;
  float y;
  float z;
  float hue;
  float rotation = 0;
  float rs;
  
  Particle(float x_, float y_, float z_, float hue_, float rotationSpeed) {
    x = x_;
    y = y_;
    z = z_;
    float rand = randomGaussian();
    rand = abs(rand);
    rand = rand % 3;
    
    hue = hue_ + rand*20;
    rs = rotationSpeed + rand*0.02;
  }
  
    void display(float posx,float posz, float off) {
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
