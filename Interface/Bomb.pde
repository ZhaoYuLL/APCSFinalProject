public class Bomb extends Root{
Bomb(){
  super(20+(int)(Math.random()*30),random(width+1),height,random(6)-3,-(random(4)+13), color(0));
  this.bomb=true;
}

}
