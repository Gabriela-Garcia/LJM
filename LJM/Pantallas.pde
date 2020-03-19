class Pantalla
{
  int x;
  int y;
  String text;
  PFont font, font2;
  int identificador;
  PImage fondo, fondo2;
  
  Pantalla ( int ide )
  {
    identificador=ide;
    InicVal(ide);
   
  }
  void InicVal (int ide)
  {
    switch (ide)
    {
      case 1:
          x = 0;
          y = 0;
          font = loadFont ("LJMT.vlw");
          fill (255);
          fondo = loadImage("cancha.jpg");
          fondo.resize(640,800);
          image (fondo, 0,0);
          break;
     case 2:
        
        font2 = loadFont ("ljmt28.vlw");
        textFont(font2);
        fondo2 = loadImage("cansha.jpg");
        fondo2.resize(640,800);
   
      break;
           
    }
  }
  void DisplayPantalla ()
  {
    switch (identificador)
    {
      case 1:
            image (fondo, 0,0);
            textFont(font);
            text("LITTLE JAM", 170, 200);
            fill (255);
             font2 = loadFont ("ljmt28.vlw");
            textFont(font2);
            text ("Press ANY key to continue", 150,250);
      break;
      case 2:
            
            image (fondo2, 0,0);
             font2 = loadFont ("ljmt28.vlw");
             textFont (font2);
            text (">>Lanza la pelota haciendo click sobre ella", 100,90);
            text (">>Arrastra hacia donde quieras lanzarla)",100,110);
            fill (255);
            text ("Disfruta de ver cómo rebota", 100, 680);
      break;

    }
  }
  }
