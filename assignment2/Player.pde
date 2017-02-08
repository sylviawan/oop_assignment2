class Player extends Objects
{

  int lives;
  int points;

  void player(int x, int y)
  { 
    pos = new PVector(x, y);
    //points = 0;
    render();
  }

  void render()
  { 

    fill(195, 165, 225);
    noStroke();
    ellipse(pos.x, pos.y, 50, 50);

        if (keyCode == LEFT )
        {
          pos.x -= 10;
        }
        if (keyCode == RIGHT)
        {
          pos.x += 10;
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