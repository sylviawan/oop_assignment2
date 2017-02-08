/*  
  Object Oriented Programming Assignment 2
  DT282/2
  C15423602  Sylvia Siu Wei Wan
    
*/

// Global variables
float x, y;

float speed;

PVector pos;

// Key pressed variable
boolean spacePressed = false;


// Constructors
Donut dnt;
Background bg;
Coffee cfe;
StarP str;

void setup()
{
  size(1000, 700);

}

void draw()
{
  background(0);
  
  dnt = new Donut();
  bg = new Background();
  cfe = new Coffee();
  str = new StarP();
  
  bg.platform();
  dnt.donut(130, 400);
  //cfe.coffeeOb();
  //str.starPoint();
  
}