import peasy.*;
int DIM = 32; // para la densidad de la mandala
PeasyCam cam;
ArrayList <PVector> mandlebulb = new ArrayList<PVector>();



void setup() {
  size (600, 600, P3D);
  windowMove (1200, 100);
  cam= new PeasyCam (this, 500); //camara

  for (int i = 0; i < DIM; i++) {
    for (int j = 0; j< DIM; j++) {
      for (int k = 0; k< DIM; k++) {
        float x = map (i, 0, DIM, -1, 1); // controla el ancho
        float y = map (j, 0, DIM, -1, 1);// controla el alto
        float z = map (k, 0, DIM, -1, 1);// controla profundidad


        PVector zeta = new PVector (0, 0, 0);
        int n =8;
        int maxiterations = 10;
        int iteration = 0;
        while (true) {

          Spherical c = spherical (zeta.x, zeta.y, zeta.z);
          float newx = pow(c.r, n) * sin(c.theta*n) * cos(c.phi*n);
          float newy = pow(c.r, n) * sin(c.theta*n) * sin(c.phi*n);
          float newz = pow(c.r, n) * cos(c.theta*n);

          zeta.x = newx + x;
          zeta.y = newy + y;
          zeta.z = newz + z;
          iteration++;

           if (c.r >2) {
           break;
           
           }


          if ( iteration > maxiterations) {
            mandlebulb.add(new PVector(x*100, y*100, z*100));
            break;
          }
        }

        //stroke(255);
        //point();
      }
    }
  }
}


class Spherical {
  float r, theta, phi;
  Spherical (float r, float theta, float phi) {
    this.r = r;
    this .theta= theta;
    this .phi = phi;
  }
}




Spherical spherical (float x, float y, float z) {
  float r = sqrt(x*x + y*y + z*z );
  float theta= atan2(sqrt(x*x + y*y), z);
  float phi= atan2(y, x);
  return new Spherical (r, theta, phi);
}

void draw() {
  background (0) ;

  for (PVector v : mandlebulb) {
    stroke(255);
    //rotate(PI/3.0);
    point(v.x, v.y, v.z);
  }
}
