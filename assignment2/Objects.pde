abstract class Objects
{
  boolean continues = true; 
  PVector forward;
  
  //variables
  float s;
  PVector pos;
  float r;

  Objects()
  {
  }

  abstract void render();
  abstract void update();
}