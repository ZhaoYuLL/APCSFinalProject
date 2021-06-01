public class Onion extends Root{
  PImage onion;
  Onion(){
    super(20+(int)(Math.random()*30),random(width+1),height,random(6)-3,-(random(4)+13), color(255,0,0));
   onion=loadImage("WOnion2.png");
  onion.resize((int)(this.radius*2),(int)(this.radius*2));
  }
  void display(){
  noStroke();
    fill(c);
    //ellipse(x, y, radius*2, radius*2);
    imageMode(CENTER);
    image(onion,x,y);
}
}
