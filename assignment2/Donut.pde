class Donut
{

  int lives;
  int points;

  // Donut yaaas
  void donut(int x, int y)
  { 
    pos = new PVector(x, y);
    points = 0;
    
    
  }
  


  void render()
  { 

    fill(195, 165, 225);
    noStroke();
    ellipse(pos.x, pos.y, 80, 80);
    
    fill(0);
    noStroke();
    ellipse(pos.x, pos.y, 30, 30);
    
  }

  void update()
  {
    if (keyPressed)
    {
      if (key == CODED)
      {
        if (keyCode == LEFT )
        {
          pos.x -= 10;
        }
        if (keyCode == RIGHT)
        {
          pos.x += 10;
        }
      }//end key == coded
    }//end key pressed


    //if human reaches the edge of the screen they are 
    //returned to the starting point on the screen
    if (pos.x < 0)
    {
      pos.x = width / 2;
    }

    if (pos.x > width)
    {
      pos.x = width / 2;
    }
  }//end update

}