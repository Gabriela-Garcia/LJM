import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Box2DProcessing box2d;
int pantalla;
ArrayList boundaries;
Pantalla inicio, juego;

Box box;

Spring spring;

void setup() {
  pantalla =1;
  size(640,800);
inicio = new Pantalla (1);
juego = new Pantalla (2);
  box2d = new Box2DProcessing(this);
  box2d.createWorld();

  box = new Box(width/2,height/2);

  // Make the spring (it doesn't really get initialized until the mouse is clicked)
  spring = new Spring();

  // Add a bunch of fixed boundaries
  boundaries = new ArrayList();
  boundaries.add(new Boundary(width/2,height-5,width,10,0));
  boundaries.add(new Boundary(width/2,5,width,10,0));
  boundaries.add(new Boundary(width-5,height/2,10,height,0));
  boundaries.add(new Boundary(5,height/2,10,height,0));
}

// When the mouse is released we're done with the spring
void mouseReleased() {
  spring.destroy();
}

// When the mouse is pressed we. . .
void mousePressed() {
  // Check to see if the mouse was clicked on the box
  if (box.contains(mouseX, mouseY)) {
    // And if so, bind the mouse location to the box with a spring
    spring.bind(mouseX,mouseY,box);
  }
}

void draw() {
  DisplayScreen (pantalla);
}
void DisplayScreen (int pantalla)
{
  switch (pantalla)
  {
    case 1:
      inicio.DisplayPantalla();
      break;
    case 2:
    juego.DisplayPantalla();
    box2d.step();
    spring.update(mouseX,mouseY);
    for (int i = 0; i < boundaries.size(); i++) {
    Boundary wall = (Boundary) boundaries.get(i);
    wall.display();
  }

  box.display();
  spring.display();
    
  }
}
void keyPressed()
{
  if(pantalla==1)
  pantalla++;
}
