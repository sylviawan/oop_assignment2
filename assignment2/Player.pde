class Player extends Objects
{  
  int lives;
  int points;

  Player(int x, int y)
  {
    pos = new PVector(x, y);
    lives = 10;
    rad = 30;
    points = 0;

  }

  void render()
  {    
    noStroke();
    fill(50, 15, 230);
    rect(pos.x, pos.y, rad, rad);
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
      pos.x = width / 2;
    }

    if (pos.x > width)
    {
      pos.x = width / 2;
    }
  }
}