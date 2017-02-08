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
        case 4: 
        case 5:
          Objects collection = new Catch((int) round(random(border, width - border)), - 15, random(1.0f, 4.0f));
          obj.add(collection);
      }
    }
    
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



void checkCollision()
{
  for (int i = obj.size () - 1; i >= 0; i --)
  {
    Objects h = obj.get(i);
    
    if (h instanceof Player)
    {
      for (int j = obj.size () - 1; j >= 0; j --)
      {
        Objects other = obj.get(j);
        if (other instanceof FallingObjects) 
        {
          if (h.pos.dist(other.pos) < h.r + other.r)
          {
            if (other.pos.y > 510) 
            {
            } 
            else if (h.pos.x < other.pos.x - 30)
            {
            } 
            else
            {
              ((FallingObjects) other).applyTo((Player)h);
              colCount++;
              obj.remove(other);

              if (other instanceof Obstacles)
              {
                pcount++;
              }
            }
          }
        }
      }
      
     
      //Check if the player has enough lives 
      if (((Player) h).lives == 0)
      {
        endToggled =! endToggled;
      }
    }
  }
}


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

void endScreen()
{
  background(117, 184, 227);
  for (int i = obj.size () - 1; i >= 0; i --)
  {
    Objects h = obj.get(i);
    if (h instanceof Player)
    {
      textSize(26);
      fill(255);
      stroke(255);
      textFont(font);
      text("Uh oh... game over!", 350, 250);
      text("Score= " + ((Player) h).points, width/2-100, 450);
      textSize(20);
      text("Press  z to return to home", 400, 550);

    //If the user wants to replay the game
      if (keyPressed)
      {
        if (key == 'z')
        {

            endToggled = !endToggled;
            toggled =! toggled;
            ((Player) h).lives = 5;
            ((Player) h).points = 0;
            colCount = 0;
            collide = 5; 
            speed = 1.0f;

        }
      }
    }
  }
}