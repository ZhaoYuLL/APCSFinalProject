
ArrayList<Root> roots;
float score;
float lives;
float highScore;
float time;

void setup(){
frameRate(30);
size(1000,800);
}
void draw(){}
void mousePressed(){
  if(mouseButton == LEFT){
    for(Root r: roots){
      r.click();
    }
  }
}
