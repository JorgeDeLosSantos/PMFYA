Quads q = new Quads();
fun1 f = new fun1();

void setup()
{
  size(800,600);
  background(0);
  noLoop();
}

void draw()
{
  f.paint();
  saveFrame();
  exit();
}
