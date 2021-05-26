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
Root(){
  this(20+(int)(Math.random()*30),random(width+1),height,random(6)-3,-(random(7)+10));
}
void move(){
  x+=dx;
  y+=dy;
  dy+=.2;
  if (x >= width - radius || x <= radius) dx *= -1;
    //if (y >= height - radius || y <= radius) dy *= -1;
}
void display(){
  noStroke();
    fill(c);
    ellipse(x, y, radius*2, radius*2);
}
void click(){}
}
