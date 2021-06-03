public class Deadroot extends Root{
 Deadroot(float rad,float x, float y, float dx, float dy, int col){
  radius=rad;
  this.x=x;
  this.y=y;
  this.dx = (int)(dx*100)/100.0;
  this.dy = (int)(dy*100)/100.0;
  c = color(col);
  this.remove=false;
  this.deadroot=true;
}
void display(){
  noStroke();
  fill(c);
  ellipse(x-radius, y, radius/4, radius/4);
  ellipse(x+radius, y, radius/4, radius/4);
}
void click(){
if (dist(x,y,mouseX,mouseY)<=radius)
   remove=false;
}
}
