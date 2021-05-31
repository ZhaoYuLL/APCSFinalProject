public class Potato extends Root{
  PImage potato;
  Potato(){
    super(20+(int)(Math.random()*30),random(width+1),height,random(6)-3,-(random(4)+13), color(#A05F10));
  potato=loadImage("mrPot2.png");
  potato.resize((int)(this.radius*2),(int)(this.radius*2));
}
  void display(){
  noStroke();
    fill(c);
    //ellipse(x, y, radius*2, radius*2);
    imageMode(CENTER);
    image(potato,x,y);
}
}
