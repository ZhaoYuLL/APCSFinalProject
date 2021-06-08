public class Root{
float x,y,dx,dy,radius;
color c;
boolean remove;
boolean bomb=false;
boolean deadroot=false;
int index=0;
boolean removesoon=false;
Root(float rad,float x, float y, float dx, float dy, int col){
  radius=rad;
  this.x=x;
  this.y=y;
  this.dx = (int)(dx*100)/100.0;
  this.dy = (int)(dy*100)/100.0;
  c = color(col);
  this.remove=false;
}
Root(){
  this(20+(int)(Math.random()*30),random(50,width-50),height,random(6)-3,-(random(4)+13), color(random(255),random(255),random(255)));
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
void click(){
if (dist(x,y,mouseX,mouseY)<=radius){
   //index++;
   //removesoon=true;
   //delay(100);
   remove=true;
}
}
}
