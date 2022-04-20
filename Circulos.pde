
class Circulo {
  float x, y, tam, r;
  Circulo() {
    tam = random(35, 40);
    r = tam/2;
  }

  Circulo(float x, float y) {
    this.x = x;
    this.y = y;
    tam = random(35, 40);
    r = tam/2;
  }


  void dibujar(int tono) {
    fill(tono, 65, 35);
    ellipse(x, y, tam, tam);
    fill(tono, 70, 50);
    ellipse(x, y, tam-r/2, tam-r/2);
    fill(tono, 100, 60);
    ellipse(x, y, tam/3, tam/3);
  }
}
