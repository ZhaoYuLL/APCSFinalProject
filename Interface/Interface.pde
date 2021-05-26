
ArrayList<Root> roots;
float score;
float lives;
float highScore;
float time;

void setup(){
frameRate(30);
size(1000,800);
roots = new ArrayList<Root>();
  for (int i = 0; i < 500; i++)
    roots.add(new Root());
}
void draw(){}
void mousePressed(){
  if(mouseButton == LEFT){
    for(Root r: roots){
      r.click();
    }
  }
}
