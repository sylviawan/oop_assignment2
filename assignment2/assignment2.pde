/*  

  Object Oriented Programming Assignment 2
  DT282/2
  C15423602  Sylvia Siu Wei Wan
    
    
  This goal of this game is to simply
  catch as many wishing stars as you 
  can without catching fireballs and 
  losing your life.
  
*/

import processing.sound.*;

SoundFile file;

boolean toggled; 
boolean endToggled; 

//Global variables
int colCount = 0; 
int pcount = 0;
int touch;

// arrays for da muhfucking stars yo
float[] x = new float[100];
float[] y = new float[100];
float[] speed_1 = new float[100];


float border; 
float speed;

ArrayList<Objects> obj = new ArrayList<Objects>();


void setup()
{
  size(1000, 700);
  
  /*
  //Attempted to apply sound, didn't work
  file = new SoundFile(this, "arietta.mp3");
  //This song is really cute tho -- help
  file.play();
  */
  
  toggled = true;
  endToggled = false;

  Player person = new Player(260, 500);
  obj.add(person);

  speed = 0.6f;
  
  // Yaaaas Stars
  int c = 0;
  while (c < 100) 
  {  
    x[c] = random(0, width);
    y[c] = random(0, height);
    speed_1[c] = random(1, 3);
    c = c + 1;
  }

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
      switch((int) random(0, 5))
      {
        case 0:
        case 1:
        case 2:
          Obstacles obstacle = new Obstacles((int) round(random(border, width - border)), - 10, (int) round(random(20, 50)), speed);
          obj.add(obstacle);
          break;
        case 3:
          Objects collect = new Catch((int) round(random(border, width - border)), - 15, random(1.0f, 4.0f));
          obj.add(collect);
          break;
          case 4:
      }
    }
    
    // Displays the game
    for (int i = obj.size()-1; i>=0; i--)
    {
      Objects go = obj.get(i);
      go.update();
      go.render();
    } 
    
    displayScore();
    check();
  }
  
  if (endToggled)
  {
    endScreen();
  }
  
  //displays the stars
  displayingStars();
  
}


//Check if the person touches the items
void check()
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
            if (other.pos.y > 999) 
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
      
      //Check if there is enough lives 
      if (((Player) h).lives == 0)
      {
        endToggled =! endToggled;
      }
    }
  }
}


void homeScreen()
{
  //displays the character
  character();
  stroke(255);
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
      rect(-2, -2, width + 5, 100);
      
      //displays the ongoing score
      fill(0);
      stroke(0);
      textFont(font);
      textSize(50);
      text("Stars= " + ((Player) h).points, 200, 70);
      text("Lives= " + ((Player) h).lives, 550, 70);
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
      text("Uh oh... game over!", 300, 250);
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
            touch = 5; 
            speed = 1.0f;

        }
      }
    }
  }
}

private void displayingStars()
{
  stroke(255);
  strokeWeight(2);

  int c = 0;
  while (c < 100)
  {
    point(x[c], y[c]);

    x[c] = x[c] - speed_1[c];
    if (x[c] < 0)
    {
      x[c] = width;
    }
    c = c + 1;
  }
}

void character()
{
  noStroke();
  fill(36, 181, 198);
  rect(150, 300, 100, 100);
  fill(155, 117, 165);
  ellipse(150, 300, 50, 50);
  ellipse(250, 300, 50, 50);
}