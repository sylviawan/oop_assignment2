abstract class Objects
{
  boolean continues = true; 
  PVector forward;
  
  //speed for obstacles
  float s;

  Objects()
  {
  }

  abstract void render();
  abstract void update();
}