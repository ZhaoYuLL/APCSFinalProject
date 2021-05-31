public class Radish extends Root{
  PImage radish;
  Radish(){
    super(20+(int)(Math.random()*30),random(width+1),height,random(6)-3,-(random(4)+13), color(255,0,0));
   radish=loadImage("Dadish2.png");
  radish.resize((int)(this.radius*2),(int)(this.radius*2));
  }
  void display(){
  noStroke();
    fill(c);
    //ellipse(x, y, radius*2, radius*2);
    imageMode(CENTER);
    image(radish,x,y);
}
}
