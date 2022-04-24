class Circulo {
  float x, y, tam, r;
  Circulo(float x_, float y_) {
    x = x_;
    y = y_;
    tam = random(35, 40);
    r = tam/2;
  }

  void dibujar(int tono, int sat) {
    fill(tono, sat, 35);
    ellipse(x, y, r*2, r*2);
    fill(tono, sat, 60);
    ellipse(x, y, tam-r/2, tam-r/2);
    fill(tono, sat, 80);
    ellipse(x, y, tam/3, tam/3);
  }
}
