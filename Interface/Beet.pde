public class Beet extends Root{
  PImage beet;
  Beet(){
    super(20+(int)(Math.random()*30),random(width+1),height,random(6)-3,-(random(4)+13), color(255,0,0));
   beet=loadImage("Dadish.png");
  beet.resize((int)(this.radius*2),(int)(this.radius*2));
  }
  void display(){
  noStroke();
    fill(c);
    ellipse(x, y, radius*2, radius*2);
    imageMode(CENTER);
    image(beet,x,y);
}
}
