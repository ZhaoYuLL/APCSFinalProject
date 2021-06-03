public class Bomb extends Root{
  PImage bomba;
Bomb(){
  super(20+(int)(Math.random()*30),random(50,width-50),height,random(6)-3,-(random(4)+13), color(0));
  this.bomb=true;
  bomba=loadImage("Bomba.png");
  bomba.resize((int)(this.radius*2),(int)(this.radius*2));
}
void display(){
  noStroke();
    fill(c);
    //ellipse(x, y, radius*2, radius*2);
    imageMode(CENTER);
    image(bomba,x,y);
}
}
