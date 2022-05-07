ArrayList<Circulo> circulos;
PGraphics Color;
int duracion = 0;
PImage fondo, mascara;
Fondo f;
void setup() {
  size(400, 600);
  f = new Fondo();
  colorMode(HSB, 360, 100, 100);
  circulos = new ArrayList<Circulo>();
  Color = createGraphics(400, 600);
  frameRate(40);
  //imageMode(CENTER);
  //fondo = createImage( 380, 580, RGB );
  //mascara = loadImage( "mascara.jpg" );
  //fondo.mask( mascara );
  //image( fondo, width/2, height/2);
    Color.beginDraw();
    int x = int(random(0,300));
    int y = int(random(0,300));
    
    for(int i = 0; i < 10; i++){
    Color.ellipse(x, y, 50, 50);
    }
    Color.endDraw();
}




void draw() {
  background(0);

  println(duracion, "mousePressed está =", mousePressed);

  Color.beginDraw();
  //Color.ellipse(Color.width/2, Color.height/2, random(Color.width), random(Color.height));
  Color.endDraw();
  tint(255);
  image(Color, 0, 0);


  nuevoCirculo();
  for (Circulo c : circulos) {
    c.dibujar(0, 0);
  }
  f.dibujarMargen();
}



void nuevoCirculo() {
  float x = random(width);
  float y = random(height);


  boolean valido = true;
  for (Circulo c : circulos) {
    float d = dist(x, y, c.x, c.y);
    if (d - 3 < c.r) {
      valido = false;
    }
    if (duracion > 200) {
      noLoop();
    }
  }

  if (valido && mousePressed) {
    duracion++;
    circulos.add(new Circulo (x, y));
  }
}
