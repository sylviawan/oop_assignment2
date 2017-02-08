class Player
{

  int lives;
  int points;

  void player(int x, int y)
  { 
    pos = new PVector(x, y);
    points = 0;
    render();

    
  }
  
  void render()
  { 

    fill(195, 165, 225);
    noStroke();
    ellipse(pos.x, pos.y, 80, 80);
    
    
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


    //if reaches the edge of the screen they are 
    //returned to the starting point on the screen
    if (pos.x < 0)
    {
      pos.x = width / 2;
    }

    if (pos.x > width)
    {
      pos.x = width / 2;
    }
  }

  void update()
  {
  }//end update

}