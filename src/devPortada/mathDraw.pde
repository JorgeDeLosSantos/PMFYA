class fun1{
  float x;
  float y;
  float y2;
  float y3;
  float n = 45.0;
  void paint(){
    for (int i=0; i<width; i++){
      x = i/n;
      //println(x*100);
      y = 100*sin(x)+(height/2);
      y2 = 100*cos(x)+(height/2);
      y3 = 100*signal(x)+(height/2);
      //println(y);
      stroke(0,0,255);
      point(i,y);
      stroke(255,0,0);
      point(i,y2);
      stroke(0,255,0);
      point(i,y3);
    }
  }
  
  float signal(float x){
    float n1 = 4;
    float n2 = 3;
    float y = (cos(n1*x)+cos(n2*x));
    return y;
  }
}
