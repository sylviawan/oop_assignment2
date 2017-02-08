class Player extends Objects
{  
  int lives;
  int points;

  Player(int x, int y)
  {
    pos = new PVector(x, y);
    lives = 10;
    points = 0;
    r = 30;
  }

  // Drawing og the player
  void render()
  {    
    noStroke();
    fill(36, 181, 198);
    rect(pos.x, pos.y, r, r);
    
    fill(155, 117, 165);
    ellipse(pos.x, pos.y, 10, 10);
    ellipse(pos.x+30, pos.y, 10, 10);
  }

  void update()
  {
    if (keyPressed)
    {
      if (key == CODED)
      {
        if (keyCode == LEFT )
        {
          pos.x -= 8;
        }
        if (keyCode == RIGHT)
        {
          pos.x += 8;
        }
      }
    }


    if (pos.x < 0)
    {
      pos.x = width/2;
    }

    if (pos.x>width)
    {
      pos.x = width/2;
    }
  }
}