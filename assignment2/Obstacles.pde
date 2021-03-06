class Obstacles extends Objects implements FallingObjects
{
  int z;

  Obstacles(int x, int y ,int z, float s)
  {
    this.z = z;
    r = z;
    pos = new PVector(x, y);
    forward = new PVector(0, s);
  }

  void applyTo(Player chibi)
  {
    chibi.lives--;
  }

  void render()
  {
    stroke(255);
    fill(255,0,0);
    
    pushMatrix();
    ellipse(pos.x, pos.y, z, z);
    popMatrix();
  }

  void update()
  {
    pos.add(forward);
  }
}