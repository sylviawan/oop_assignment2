/*  
  Object Oriented Programming Assignment 2
  DT282/2
  C15423602  Sylvia Siu Wei Wan
    
*/

// Global variables
float x, y;
float border;
float bside;

// Speed of items
float speed;

// Screens
boolean screen;
boolean endScreen;


PVector pos;

ArrayList<Objects> obj = new ArrayList<Objects>();

// Constructors

Player ply;
Background bg;

StarP str;

void setup()
{
  size(1000, 700);
  
  Player ply = new Player(500,500);
  obj.add(ply);

  // Set speed ftm
  speed = 1;

  screen = true;
  endScreen = false;
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
  else if (endScreen == false)
  {
    
    //FOR EVERY 60 SECOND DISPLAY NEW OBJECT
    if (frameCount % 60 == 0)
    {
      switch((int) random(0, 4))
      {
      case 0:
      case 1:
      case 2:
        Obstacles obstacle = new Obstacles((int) round(random(border, width-border-70)), - 15, (int) round(random(20, 70)), speed);
        obj.add(obstacle);
        break;
      case 3:
        Objects collection = new StarP((int) round(random(border, width - border)), - 15, random(1.0f, 4.0f));
        obj.add(collection);
      }
    }
    
    //DISPLAYING THE GAME --------------------------------------------------------------
    for (int i = obj.size () - 1; i >= 0; i--)
    {
      Objects go = obj.get(i);
      go.update();
      go.render();
    } 
    //displayGameInfo();

    //COLLISION RELATED CODE ---------------------------------------------------------
    //checkCollision();
    

  //bg = new Background();
//  str = new StarP();
  
  //bg.platform();

  //str.starPoint();
  
}

void homeScreen()
{
  
}
{
  background(0);
}