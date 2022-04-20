Circulo[] rojo;
Circulo[] azul;
int cantidad=50;
Fondo f;
void setup() {
  size(400, 600);
  rojo = new Circulo[cantidad];
  azul = new Circulo[cantidad];
  f = new Fondo();
  colorMode(HSB, 360, 100, 100);
  background(0);

  for (int i = 0; i < cantidad; i++) {
    rojo[i] = new Circulo(random(width-40), random(height-40));
    azul[i] = new Circulo(random(width-40), random(height-40));
  }
}



void draw() {
  pushMatrix();
  translate(20, 20);
  for (int i = 0; i < cantidad; i++) {
    rojo[i].dibujar(360);
    azul[i].dibujar(200);
  }
  popMatrix();
  f.dibujarMargen();
}
