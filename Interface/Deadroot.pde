public class Deadroot extends Root{
  ArrayList<PImage> deadroots;
  float angle;
  int tick;
  int addtime;
 Deadroot(float rad,float x, float y, float dx, float dy, int col, float angle, int ind){
  radius=rad;
  this.x=x;
  this.y=y;
  this.dx = (int)(dx*100)/100.0;
  this.dy = (int)(dy*100)/100.0;
  c = color(col);
  this.remove=false;
  this.deadroot=true;
  this.angle=angle;
  index=ind;
  deadroots= new ArrayList<PImage>();
  deadroots.add(loadImage("SplitDadish2(1).png"));
  deadroots.add(loadImage("SplitPotatoProto(1).png"));
  deadroots.add(loadImage("SplitWOnion2.png"));
  deadroots.add(loadImage("BombaO.png"));
    deadroots.add(loadImage("BombaEx.png"));
  //rotate(this.angle);
  for (int i=0; i<deadroots.size();i++){
    deadroots.get(i).resize((int)(this.radius*2),(int)(this.radius*2));
   }
  addtime=millis();
}
void display(){
  //noStroke();
  //fill(c);
  //ellipse(x-radius, y, radius/4, radius/4);
  //ellipse(x+radius, y, radius/4, radius/4);
  tick=millis()-addtime;
  if (tick>500&&index==3)
    index++;
  if (tick>600&&index==4)
    remove=true;
  imageMode(CENTER);
  image(deadroots.get(index),x,y);
  
}
void click(){
if (dist(x,y,mouseX,mouseY)<=radius)
   remove=false;
}
}
