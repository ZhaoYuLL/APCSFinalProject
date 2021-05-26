
ArrayList<Root> roots;
float score;
float lives;
float highScore;
float time=0;

void setup(){
frameRate(30);
size(1000,800);
roots = new ArrayList<Root>();
  for (int i = 0; i < 10; i++)
    roots.add(new Root());
}
void draw(){
  background(200);
  for (Root r : new ArrayList<Root>(roots)) {
    if (millis()%800==0){
      for (int i=0; i<(int)random(10);i++){
        roots.add(new Root());
      }
    }
    r.move();
    //if goes off the bottom, remove it
    if (r.y>=height+r.radius)
      roots.remove(r);
    else{
    r.display(); 
    }
  }
  fill(0);  
  textSize(20);
  text("FPS: "+frameRate+"\nRoots: "+roots.size(),0,20);
}
void mousePressed(){
  if(mouseButton == LEFT){
    for(Root r: roots){
      r.click();
    }
  }
}
