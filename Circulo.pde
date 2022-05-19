class Circulo {
  float x, y, tam, r;
  int tono = 360;
  int sat = 360;
  int brillo = 360;
  color p = color(tono, sat, brillo );
  Circulo(float x_, float y_) {
    x = x_;
    y = y_;
    tam = random(25, 42);
    r = tam/2;
  }

  void dibujar(   ) {
    strokeWeight(1);
    fill(360);
    ellipse(x, y, r*2, r*2);
    noFill();
    ellipse(x, y, tam-r/2, tam-r/2);
    noFill();
    ellipse(x, y, tam/3.5, tam/3.5);
  }

  void dibujar( PGraphics capa  ) {
    color esteColor = capa.get(int(x), int(y));
    strokeWeight(1);
    if (brightness(esteColor)>10) {
      fill(esteColor);
      ellipse(x, y, r*2, r*2);
      noFill();
      ellipse(x, y, tam-r/2, tam-r/2);
      noFill();
      ellipse(x, y, tam/3.5, tam/3.5);
    }
  }

}
