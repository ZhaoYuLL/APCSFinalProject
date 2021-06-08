public class Deadroot extends Root{
  PImage deadroots;
 Deadroot(float rad,float x, float y, float dx, float dy, int col){
  radius=rad;
  this.x=x;
  this.y=y;
  this.dx = (int)(dx*100)/100.0;
  this.dy = (int)(dy*100)/100.0;
  c = color(col);
  this.remove=false;
  this.deadroot=true;
  deadroots=loadImage("SplitDadish2(1).png");
  deadroots.resize((int)(this.radius*2),(int)(this.radius*2));
  
}
void display(){
  //noStroke();
  //fill(c);
  //ellipse(x-radius, y, radius/4, radius/4);
  //ellipse(x+radius, y, radius/4, radius/4);
  imageMode(CENTER);
  image(deadroots,x,y);
  
}
void click(){
if (dist(x,y,mouseX,mouseY)<=radius)
   remove=false;
}
}
