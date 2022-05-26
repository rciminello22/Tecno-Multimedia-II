import oscP5.*;

//=======================================
//      variables de calibración

float MIN_RUIDO = 90;

float MIN_AMP = 70;
float MAX_AMP = 100;

float f = 0.9;

float MIN_PITCH = 45;
float MAX_PITCH = 65;

boolean monitor = true;
boolean HaySonido = false;
boolean agudo = false;
boolean grave = false;
//=======================================

OscP5 osc; // declaracion del objeto osc

float amp, pitch;
int ruido;

GestorSenial gestorAmp, gestorPitch;

ArrayList<Circulo> circulos;
PGraphics grafico;
int maximo = 0;
PImage fondo, mascara;
int alto = 0;
int tinte;
float posx = random(random(0, 50), random(width-100, width));
float posy = random(random(0, 50), random(height-100, height));
boolean LimiteDeCirculos = false;

Fondo F;

void setup() {
  
  size(400, 600);
  osc = new OscP5(this, 12345);
  F = new Fondo();
  gestorAmp = new GestorSenial(MIN_AMP, MAX_AMP, f);
  gestorPitch = new GestorSenial(MIN_PITCH, MAX_PITCH, f);
  colorMode(HSB, 360, 100, 100);
  circulos = new ArrayList<Circulo>();
  grafico = createGraphics(400, 600);
  
}




void draw() {
  background(0);
  HaySonido = amp > MIN_AMP;
  agudo = pitch > MAX_PITCH;
  grave =  pitch > MIN_PITCH && pitch < MAX_PITCH;


  println(maximo);

  gestorPitch.actualizar(pitch);

  //println("alto:", alto);
  if (LimiteDeCirculos) {
    if (HaySonido && ruido < MIN_RUIDO) {
      alto+=5;
    } else alto-=3;
    if (alto <= -1) {
      alto=0;
    } else if (ruido > MIN_RUIDO) {
      alto=0;
    }
  }

  if (agudo) {
    tinte = color(200, 100, 100);
  } 
  if (grave) {
    tinte = color(360, 100, 100);
  }

  grafico.beginDraw();
  grafico.background(0);
  grafico.fill(tinte);
  grafico.ellipse(posx, posy, alto, alto);
  grafico.endDraw();


  if ( !LimiteDeCirculos ) {

    nuevoCirculo();
  }

  for (Circulo c : circulos) {

    c.dibujar();
    c.dibujar(grafico);
    c.temblar();
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
      if (maximo >= 180) {
        LimiteDeCirculos = true;
      }
    }
  }

  if (valido && HaySonido) {
    maximo++;
    circulos.add(new Circulo (x, y));
  }
}

void oscEvent (OscMessage m) {

  if (m.addrPattern().equals("/amp")) {

    amp = m.get(0).floatValue();
    //println("amp:",amp);
    //println(HaySonido);
  }

  if (m.addrPattern().equals("/pitch")) {

    pitch = m.get(0).floatValue();
    //println("pitch:", pitch);
  }

  if (m.addrPattern().equals("/ruido")) {

    ruido = m.get(0).intValue();
    println(ruido);
  }
}
