class Obstacles extends Objects
{
  int z;

  Obstacles(int x, int y ,int z, float s)
  {
    this.z = z;
    rad = z;
    pos = new PVector(x, y);
    forward = new PVector(0, s);
  }

  void applyTo(Player person)
  {
    person.lives--;
  }

  void render()
  {
    //noStroke();
    stroke(0);
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