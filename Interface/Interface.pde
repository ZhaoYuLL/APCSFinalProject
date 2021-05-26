
ArrayList<Root> roots;
int score;
int lives = 3;
float highScore;
float time;

void setup(){
frameRate(30);
size(1000,800);
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
text("Lives: "+lives+"\nTime: "+Math.round(time/60*10.0/10.0),30,50);
text("Score: " + score,width-200,50);
time++;
  for (Root r : roots) {
    r.move();
    if (r.y>=height+r.radius)
      roots.remove(r);
    else{
    r.display(); 
    }
  }
}
void mousePressed(){
  if(mouseButton == LEFT){
    for(Root r: roots){
      r.click();
    }
  }
}
