public class Potato extends Root{
  PImage potato;
  
  Potato(){
    super(30+(int)(Math.random()*20),random(50,width-50),height,random(6)-3,-(random(4)+13), color(#A05F10));
  potato=loadImage("SwagPotato.png");
  potato.resize((int)(this.radius*2),(int)(this.radius*2));
  index=1;
}
  void display(){
  noStroke();
    fill(c);
    //ellipse(x, y, radius*2, radius*2);
    imageMode(CENTER);
    image(potato,x,y);
}
}
