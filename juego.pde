PImage bebe1, bebe2, bebe3, cuchara, cucharallena;
String estado = "enojado";
int r = 50;
int posx = 250;
int posy = 285;
int tiempo = 0;
boolean comida = false;

void setup() {
  noCursor();
  size(500, 600);
  imageMode(CENTER);
  bebe1 = loadImage("bebe1.png");
  bebe2 = loadImage("bebe2.png");
  bebe3 = loadImage("bebe3.png");
  cuchara = loadImage("cuchara.png");
  cucharallena = loadImage("cucharallena.png");
}

void draw() {
  background(255, 240, 165);
  if (estado=="normal") {
    image(bebe1, width/2, height/2, width, height);
  }
  if (estado=="lleno") {
    image(bebe2, width/2, height/2, width, height);
    tiempo+=1;
  }
  if (estado=="enojado") {
    image(bebe3, width/2, height/2, width, height);
  }

  if (!comida) {
    image (cuchara, mouseX, mouseY, 200, 150);
  }
    if (comida) {
    image (cucharallena, mouseX, mouseY, 200, 150);
  }

  if (mousePressed && comida) {
    if (mouseX > 200 && mouseX < 300 && mouseY > 260 && mouseY < 312) {
      estado="lleno";
      comida = false;
    }
  } 
  if (tiempo==30) {
    estado="enojado";
    tiempo=0;
  }
  println(tiempo);
}

void mouseDragged() {

  if (mouseX > 180 && mouseX < 300 && mouseY > 500 && mouseY < 550) {
    comida = true;
  }
}
