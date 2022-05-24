
class Lagrimas {

  float lvel, tam, posy, posx, x, y; 
  int alpha;

  Lagrimas() {
    posx = random(270, 300);
    posy = random(290, 300);
    x = random(430, 550);
    y = random(290, 300);
    tam = 60;
    alpha = 255;
    lvel=1;
  }


  void mostrarLagrimaIzq() {
    push();
    tint(255, alpha);

    image(lagrimas1, posx, posy, tam, tam);
    posy+=lvel;

    alpha-=5;
    if (posy >= 400) {
      posy = random(290, 310);
      posx = random(250, 310);
      alpha=255;
    }
    pop();
  }

  void mostrarLagrimaDer() {

    push();
    tint(255, alpha);

    image(lagrimas1, x, y, tam, tam);
    y+=lvel;

    alpha-=5;
    if (y >= 400) {

      y = random(290, 310);
      x = random(430, 550);
      alpha=255;
    }
    pop();
    println("y vale", y);
  }
}
