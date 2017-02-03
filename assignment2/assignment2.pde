/*  
  Object Oriented Programming Assignment.
  DT282/2
  C15423602  Sylvia Siu Wei Wan
    
*/

// Global variables
float x, y;

// Constructors
Donut dnt;



void setup()
{
  size(800, 500);
  
}

void draw()
{
  background(0);
  
  dnt = new Donut();
  
  dnt.donut();
  
  
}