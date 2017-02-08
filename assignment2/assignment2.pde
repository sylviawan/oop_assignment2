/*  
  Object Oriented Programming Assignment 2
  DT282/2
  C15423602  Sylvia Siu Wei Wan
    
*/

boolean toggled; 
boolean endToggled; 

PVector pos;
float rad;

void setup()
{
  size(1000, 700);

  toggled = true;
  endToggled = false;
  
  Player person = new Player(260, 500);

}

PFont font;

void draw()
{
    background(230, 190, 225);
    font = loadFont("Geneva-48.vlw");
}