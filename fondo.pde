class Fondo{
  
  Fondo(){
    
    
  }
  
  void dibujarMargen() {
    pushStyle();
    fill(360);
    noStroke();
    //margen izquierdo
    rect(0, 0, 20, 600);
    //margen derecho
    rect(380, 0, 20, 600);
    //margen arriba
    rect(0, 0, 400, 20);
    //margen abajo
    rect(0, 580, 400, 20);
    popStyle();
  }
  
  
}
