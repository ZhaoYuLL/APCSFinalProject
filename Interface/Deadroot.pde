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
  if (index==0)
  deadroots.add(loadImage("SplitDadish2(1).png"));
    if (index==1)
  deadroots.add(loadImage("SplitPotatoProto(1).png"));
    if (index==2)
  deadroots.add(loadImage("SplitWOnion2.png"));
    if (index==3){
  deadroots.add(loadImage("BombaO.png"));
   deadroots.add(loadImage("BombaEx.png"));
    }
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
  imageMode(CENTER);
  if (index==4)
      image(deadroots.get(1),x,y);
  else{    
  image(deadroots.get(0),x,y);
  }
  
}
void click(){
if (dist(x,y,mouseX,mouseY)<=radius)
   remove=false;
}
}
