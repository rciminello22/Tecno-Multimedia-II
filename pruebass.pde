import oscP5.*;

//=======================================
//      variables de calibración

float umbralDeRuido = 68;
float f = 0.2;

boolean monitor = false;
boolean HaySonido = false;
//=======================================

OscP5 osc; // declaracion del objeto osc

float amp, pitch;

GestorSenial gestorAmp;

ArrayList<Circulo> circulos;
PGraphics grafico;
int maximo = 0;
PImage fondo, mascara;
int alto = 0;
boolean LimiteDeCirculos = false;
String estado = "estado-inicial";
Fondo F;


void setup() {
  size(400, 600);
  osc = new OscP5(this, 12345);
  F = new Fondo();
  gestorAmp = new GestorSenial(umbralDeRuido, 100, f);
  colorMode(HSB, 360, 100, 100);
  circulos = new ArrayList<Circulo>();
  grafico = createGraphics(400, 600);
  frameRate(60);
  /*imageMode(CENTER);
   fondo = createImage( 380, 580, RGB );
   mascara = loadImage( "mascara.jpg" );
   fondo.mask( mascara );
   image( fondo, width/2, height/2);*/
}




void draw() {
  background(0);
  HaySonido = amp > umbralDeRuido;

  println(maximo);

  println("alto:", alto);
  if (LimiteDeCirculos) {
    if (HaySonido) {
      alto+=10;
    } else alto-=5;
    if (alto <= -1){
      alto=0;
  }
} 

grafico.beginDraw();
grafico.background(0);
//grafico.noStroke();
grafico.fill( 360, 0, 0 );
grafico.rect(0,0,alto,height/2,100);
/*grafico.fill( 360, 0, 0 );
grafico.ellipse(0, 0, alto, alto);
grafico.fill( 0, 0, 360 );
grafico.ellipse(400, 300, alto, alto);*/
grafico.endDraw();
//tint(255, 40, 300);
//image(grafico, 0, 0);


if ( !LimiteDeCirculos ) {

  nuevoCirculo();
}

for (Circulo c : circulos) {

  c.dibujar();
  c.dibujar(grafico);
}
F.dibujarMargen();
}


void nuevoCirculo() {

  float x = random(width);
  float y = random(height);


  boolean valido = true;
  for (Circulo c : circulos) {
    float d = dist(x, y, c.x, c.y);
    if (d - 5 < c.r) {
      valido = false;
      if (maximo >= 200) {
        LimiteDeCirculos = true;
      }
    }
  }

  if (valido && mousePressed) {
    maximo++;
    circulos.add(new Circulo (x, y));
  }
}

void oscEvent (OscMessage m) {

  if (m.addrPattern().equals("/amp")) {

    amp = m.get(0).floatValue();
    //println("amp:",amp);
    println(HaySonido);
  }

  if (m.addrPattern().equals("/pitch")) {

    pitch = m.get(0).floatValue();
    println("pitch:", pitch);
  }
}
