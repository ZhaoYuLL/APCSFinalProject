
ArrayList<Root> roots;
int score;
int lives;
float highScore;
float time=0;

void setup(){
frameRate(30);
size(1000,800);
lives=3;
roots = new ArrayList<Root>();
  for (int i = 0; i < 10; i++)
    roots.add(new Root());
}
void draw(){
  background(200);
  fill(255);
  rect(20, 5, 200, 100, 7);
  rect(width-220, 5, 200, 100, 7);
  fill(0);
  textSize(20);
  text("Lives: "+lives+"\nTime: "+Math.round(time/30*10.0/10.0),30,50);
  text("Score: " + score,width-200,50);

  for (Root r : new ArrayList<Root>(roots)) {
    /*if (((millis()*1000))%5==0){
      for (int i=0; i<(int)random(10);i++){
        roots.add(new Root());
      }
    }*/
    //if goes off the bottom, remove it
    if (r.y>=height+r.radius||r.remove==true)
      roots.remove(r);
    else{
      r.move();
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
