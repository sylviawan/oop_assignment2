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
    
    //While loop??
    Obstacles obstacle = new Obstacles((int) round(random(border, width - border - 50)), - 10, (int) round(random(20, 50)), speed);
          obj.add(obstacle);
          
          Objects collection = new Catch((int) round(random(border, width - border)), - 15, random(1.0f, 4.0f));
          obj.add(collection);
          
     // Displays the game
    for (int i = obj.size() -1; i>=0; i--)
    {
      Objects go = obj.get(i);
      go.update();
      go.render();
    } 
}