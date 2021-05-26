public class Root{
float x,y,dx,dy,radius;
color c;
boolean remove;
Root(float rad,float x, float y, float dx, float dy){
  radius=rad;
  this.x=x;
  this.y=y;
  this.dx = (int)(dx*100)/100.0;
  this.dy = (int)(dy*100)/100.0;
  c = color(random(255),random(255),random(255));
  this.remove=false;
}

void move(){}
void display(){
  stroke(0);
}
void click(){}
}
