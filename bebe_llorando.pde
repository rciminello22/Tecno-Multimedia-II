
import processing.sound.*;
SoundFile llorar;
SoundFile comer;



PImage bebe1, bebe2, bebe3, bebe4, cuchara, cucharallena, lagrimas1;
String estado = "enojado";
int tiempo = 0;
boolean comida = false;

Ojos bb;
Lagrimas [] lagrimas = new Lagrimas [1];
Lagrimas l;

void setup() {

  //noCursor();
  size(800, 800);

  llorar = new SoundFile(this, "llorandoMolesto.wav");
  comer = new SoundFile(this, "comer.wav");

  bb = new Ojos();
  //l = new Lagrimas();
  for (int i=0; i<lagrimas.length; i++) {
   lagrimas[i] = new Lagrimas ();
   }

  lagrimas1 = loadImage("1.png");
  imageMode(CENTER);
  bebe1 = loadImage("bebeenojado2.png");
  bebe2 = loadImage("bebenormal1.png");
  bebe3 = loadImage("bebeenojado1.png");
  bebe4 = loadImage("bebelleno1.png");
  cuchara = loadImage("cucharavacia.png");
  cucharallena = loadImage("cucharallena.png");



  llorar.play();
  llorar.loop();
}

void draw() {
  background(255, 240, 165);
  //println(mouseX, mouseY);
  bb.movimientoOjoIzq();
  bb.movimientoOjoDer();
  bb.dibujarOjos();
  if (estado=="normal") {
    image(bebe1, width/2, height/2, width, height);
  }
  if (estado=="lleno") {
    image(bebe2, width/2, height/2, width, height);
    tiempo+=1;
    llorar.stop();
  }
  if (tiempo>2) {
    background(255, 240, 165);
    bb.movimientoOjoIzq();
    bb.movimientoOjoDer();
    bb.dibujarOjos();
    image(bebe4, width/2, height/2, width, height);
    if (!comer.isPlaying()) {
      comer.play();
      comer.loop();
    }
  }
  if (estado=="enojado") {
    image(bebe3, width/2, height/2, width, height);
    comer.stop();
    if (!llorar.isPlaying()) {
      llorar.play();
      llorar.loop();
    }
    for (int i=0; i<lagrimas.length; i++) {
     lagrimas[i].mostrarLagrimaIzq();
     lagrimas[i].mostrarLagrimaDer();
     }
    //l.mostrarLagrimas();
  }

  if (!comida) {
    image (cuchara, mouseX, mouseY, 250, 150);
  }
  if (comida) {
    image (cucharallena, mouseX, mouseY, 250, 150);
  }

  if (mousePressed && comida) {
    if (mouseX > 300 && mouseX < 600 && mouseY > 350 && mouseY < 450) {
      estado="lleno";
      comida = false;
    }
  }
  if (tiempo==20) {
    estado="enojado";
    tiempo=0;
  }
  //println(frameRate);
}

void mouseDragged() {

  if (mouseX > 400 && mouseX < 500 && mouseY > 650 && mouseY < 750) {
    comida = true;
  }
}
