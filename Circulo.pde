class Circulo {
  float x, y, tam, r;
  Circulo(float x_, float y_) {
    x = x_;
    y = y_;
    tam = random(25, 42);
    r = tam/2;
  }

  void dibujar(int tono, int sat) {
    strokeWeight(1);
    //color c = get(Color);
    fill(360);
    ellipse(x, y, r*2, r*2);
    noFill();
    ellipse(x, y, tam-r/2, tam-r/2);
    noFill();
    ellipse(x, y, tam/3.5, tam/3.5);
  }
}
