ArrayList<Circulo> circulos;
Fondo f;
void setup() {
  size(400, 600);
  f = new Fondo();
  colorMode(HSB, 360, 100, 100);
  background(0);
  circulos = new ArrayList<Circulo>();
  frameRate(20);
}



void draw() {

  nuevoCirculo();
  for (Circulo c : circulos) {
    c.dibujar(360,0);
  }
  f.dibujarMargen();
}
void nuevoCirculo() {
  float x = random(width);
  float y = random(height);

  boolean valido = true;
  for (Circulo c : circulos) {
    float d = dist(x, y, c.x, c.y);
    if (d - 10 < c.r) {
      valido = false;
      break;
    }
  }
  if (valido && mousePressed) {
    circulos.add(new Circulo (x, y));
  }
}
