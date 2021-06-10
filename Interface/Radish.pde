public class Radish extends Root{
  ArrayList<PImage> radishes;
  
  Radish(){
    super(30+(int)(Math.random()*20),random(50,width-50),height,random(6)-3,-(random(4)+13), color(255,0,0));
    radishes= new ArrayList<PImage>();
   radishes.add(loadImage("Dadish2(1).png"));
   for (int i=0; i<radishes.size();i++){
    radishes.get(i).resize((int)(this.radius*2),(int)(this.radius*2));
   }
  }
  void display(){
  noStroke();
    fill(c);
    //ellipse(x, y, radius*2, radius*2);
    imageMode(CENTER);
    image(radishes.get(index),x,y);
}
}
