import peasy.*;
int DIM = 32;
PeasyCam cam;

void setup() {
  size (600, 600, P3D);
  windowMove (1200, 100);
  cam= new PeasyCam (this, 500);
}


class Spherical {
  Spherical (float r, float theta, float phi) {
    this.r = r;
    this .theta= theta;
    this .phi = phi;
  }
}




PVector spherical (float x, float y, float z) {
  float r = sqrt(x*x + y*y + z*z );
  float theta= atan2(sqrt(x*x + y*y), z);
  float phi= atan2(y, x);
  return new spherical (r, theta, phi);
}

void draw() {
  background (0) ;

  for (int i = 0; i < DIM; i++) {
    for (int j = 0; j< DIM; j++) {
      for (int k = 0; k< DIM; k++) {
        float x = map (i, 0, DIM, -100, 100);
        float y = map (j, 0, DIM, -100, 100);
        float z = map (k, 0, DIM, -100, 100);


        PVector zeta = new PVector (0, 0, 0);
        int n =8;
        int maxiterations = 10;
        int iteration = 0;
        while (true) {

          PVector c = spherical (x, y, z);
          float newx = pow(r, n) * sin(theta*n) * cos(phi*n);
          float newy = pow(r, n) * sin(theta*n) * sin(phi*n);
          float newz = pow(r, n) * cos(theta*n);

          zeta.x = newx + c.x;
          zeta.y = newy + c.y;
          zeta.z = newz + c.z;
          iteration++;
          if ( iteration > maxiterations) {
            break;
          }
        }
        stroke(255);
        point(x, y, z);
      }
    }
  }
}
