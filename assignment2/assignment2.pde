/*  
  Object Oriented Programming Assignment 2
  DT282/2
  C15423602  Sylvia Siu Wei Wan
    
*/

boolean toggled; 
boolean endToggled; 

//Global variables
int colCount = 0; 
int pcount = 0;
int collide;
float border; 
float speed;


//Important
ArrayList<Objects> obj = new ArrayList<Objects>();

void setup()
{
  size(1000, 700);

  toggled = true;
  endToggled = false;
  
  Player person = new Player(260, 500);
  obj.add(person);
  
  speed = 0.6f;

}

PFont font;

void draw()
{
    background(230, 190, 225);
    font = loadFont("Geneva-48.vlw");
    
    if (toggled)
  {
    homeScreen();
    if (keyPressed)
    {
      if (key == CODED)
      {
        if (keyCode == SHIFT) 
        {
          toggled =! toggled;
        }
      }
    }
  } 
  else if (endToggled == false)
  {
    
    /*
    //Diplay a new item
    if (frameCount % 60 == 0)
    {
      switch((int) random(0, 6))
      {
        case 0:
        case 1:
        case 2:
          Obstacles obstacle = new Obstacles((int) round(random(border, width - border - 50)), - 10, (int) round(random(20, 50)), speed);
          obj.add(obstacle);
          break;
        case 3:
 
      }
    }
    */
    // Displays the game
    for (int i = obj.size() -1; i>=0; i--)
    {
      Objects go = obj.get(i);
      go.update();
      go.render();
    } 
    
    displayScore();
    checkCollision();
  }
  
  if (endToggled)
  {
    endScreen();
  }
}

//Object obj

void homeScreen()
{
  
  textFont(font);
  textSize(80);
  text("Catch!", 370, height/2);
  
  textSize(20);
  text("Press SHIFT to start", 400, 550);
}

void displayScore()
{
  for (int i = obj.size()-1; i>=0; i--)
  {
    Objects h = obj.get(i);
    
    if (h instanceof Player)
    {
      fill(255);
      rect(-2, -2, width + 5, height * 0.1f);
      
      //displays the ongoing score
      fill(0);
      stroke(0);
      textFont(font);
      textSize(30);
      text("Points= " + ((Player) h).points, 200, 50);
      text("Lives= " + ((Player) h).lives, 550, 50);
    }
  }
}