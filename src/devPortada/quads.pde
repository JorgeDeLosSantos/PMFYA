class Quads
{
  int k = 1;
  float num;
  float backg;
  Quads(){
  } // Class constructor
  
  void dibuja()
  {
    noStroke();
    while (k<2000)
    {
      num = random(100);
      backg = random(255);
      //fill(backg, backg, backg);
      fill(random(255),random(255),random(255));
      rect(random(width),random(height),num,num);
      //triangle(random(width),random(height),random(width),random(height),random(width),random(height));
      k += 1;
    }
  }
  
}
