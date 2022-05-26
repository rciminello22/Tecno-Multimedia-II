class Circulo {
  float x, y, tam, r, d;
  float alpha = 150;
  int brillo = color(255, alpha);
  int sat = color(200, 100, 100, alpha);
  float l = 0;
  Circulo(float x_, float y_) {
    x = x_;
    y = y_;
    tam = random(25, 42);
    r = tam/2;
    d = random(1, 3);
  }

  void dibujar() {
    strokeWeight(2);
    fill(360);
    ellipse(x+l, y+l, r*2, r*2);
    noFill();
    ellipse(x+l, y+l, tam-r/d, tam-r/d);
    noFill();
    ellipse(x+l, y+l, tam/3.5, tam/3.5);
  }

  void dibujar( PGraphics capa) {
    color esteColor = capa.get(int(x), int(y));
    strokeWeight(2);
    if (brightness(esteColor)>10) {
      fill(esteColor);
      ellipse(x+l, y+l, r*2, r*2);
      fill(esteColor + brillo);
      ellipse(x+l, y+l, tam-r/d, tam-r/d);
      fill(esteColor);
      ellipse(x+l, y+l, tam/3.5, tam/3.5);
    }
  }

  void temblar() {

    if (ruido > MIN_RUIDO && LimiteDeCirculos) {
      l= random(3, 6);
      posx = random(random(0, 50), random(width-100, width));
      posy = random(random(0, 50), random(height-100, height));
    }
  }
}
