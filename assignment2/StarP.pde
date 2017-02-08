class StarP
{
  // Object collects stars for points
  void starPoint()
  {
    pushMatrix();
    translate(300, 300);
    rotate(frameCount / -100.0);
    fill(255);
    star(0, 0, 15, 30, 5); 
    popMatrix();
  }

  void star(float x, float y, float radius1, float radius2, int npoints)
  {
    float angle = TWO_PI / npoints;
    float halfAngle = angle/2.0;
    
    beginShape();
    for (float a = 0; a < TWO_PI; a += angle)
    {
      float sx = x + cos(a) * radius2;
      float sy = y + sin(a) * radius2;
      vertex(sx, sy);
      sx = x + cos(a+halfAngle) * radius1;
      sy = y + sin(a+halfAngle) * radius1;
      vertex(sx, sy);
    }
    
    endShape(CLOSE);
  }
}