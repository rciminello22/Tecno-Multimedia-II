ArrayList<Circulo> circulos;
PGraphics grafico;
int duracion = 0;
PImage fondo, mascara;
int alto = 25;
Fondo f;
void setup() {
  size(400, 600);
  f = new Fondo();
  colorMode(HSB, 360, 100, 100);
  circulos = new ArrayList<Circulo>();
  grafico = createGraphics(400, 600);
  frameRate(60);
  //imageMode(CENTER);
  //fondo = createImage( 380, 580, RGB );
  //mascara = loadImage( "mascara.jpg" );
  //fondo.mask( mascara );
  //image( fondo, width/2, height/2);
}




void draw() {
  background(0);

  println(duracion, "mousePressed está =", mousePressed);

  grafico.beginDraw();
  grafico.noStroke();
  grafico.fill( 255, 0, 0 );
  grafico.ellipse(100, 200, alto, alto);
  grafico.fill( 0, 0, 255 );
  grafico.ellipse(300, 400, alto, alto);
  grafico.get();


  grafico.endDraw();
  //tint(255, 40, 300);
  //image(grafico, 0, 0);



  nuevoCirculo();
  if (duracion >= 100) {
    alto++;
  }
  for (Circulo c : circulos) {
    
    c.dibujar();
   
    if(!mousePressed){
    c.dibujar(grafico);
     }
    
  }

  f.dibujarMargen();
}



void nuevoCirculo() {
  float x = random(width);
  float y = random(height);


  boolean valido = true;
  for (Circulo c : circulos) {
    float d = dist(x, y, c.x, c.y);
    if (d - 5 < c.r) {
      valido = false;
    }
    if (duracion > 300) {
      noLoop();
    }
  }

  if (valido && mousePressed) {
    duracion++;
    circulos.add(new Circulo (x, y));
  }
}
