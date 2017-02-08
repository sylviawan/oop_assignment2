class Donut
{


  float px, py, vx, vy, ax, ay=1;
    
  // Donut yaaas
  void donut()
  {    
      vy+=ay;
  py+=vy;
  py=a()?py:height-10;
  px+=vx+width;
  px%=width;
  r(-width);
  r(0);
  r(width);
  
  }
  
  void r(int j)
{
  fill(255);
  rect(px+j, py-20, 20, 20);


   noFill();
    stroke(255);


    strokeWeight(1);
    fill(195, 165, 225);
    noStroke();
    ellipse(130, 400, 80, 80);
    
    fill(0);
    noStroke();
    ellipse(130, 400, 30, 30);
    
}  

boolean a()
{
  return(py<height-10);
}
void mousePressed()
{
  if(!a())vy=-19;

}
}