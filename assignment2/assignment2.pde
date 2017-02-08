/*  
  Object Oriented Programming Assignment 2
  DT282/2
  C15423602  Sylvia Siu Wei Wan
    
*/

// Global variables
float x, y;

float speed;

boolean screen;

PVector pos;

// Key pressed variable
boolean spacePressed = false;

ArrayList<Objects> obj = new ArrayList<Objects>();

// Constructors
Player ply;
Background bg;
Coffee cfe;
//StarP str;

void setup()
{
  size(1000, 700);
  
  ply = new Player();


  screen = true;
}

void draw()
{
  background(0);
  
  if (screen)
  {
    homeScreen();
    
    if (keyPressed)
    {
      if (key == CODED)
      {
        if (keyCode == ENTER)
        {
          screen =! screen;
        }
      }
    }
  }
  else 
  
  bg = new Background();
//  cfe = new Coffee();
//  str = new StarP();
  
  //bg.platform();
  ply.player(500, 550);
  //cfe.coffeeOb();
  //str.starPoint();
  
}

void homeScreen()
{
  background(0);
}