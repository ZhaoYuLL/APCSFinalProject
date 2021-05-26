
ArrayList<Root> roots;
int score;
int lives;
float highScore;
float time;

void setup(){
frameRate(30);
size(1000,800);
lives = 3;
rect(20, 5, 200, 100, 7);

fill(0);
textSize(20);
text("Lives: "+lives+"\nScore: "+score,30,50);

}
void draw(){}
void mousePressed(){
  if(mouseButton == LEFT){
    for(Root r: roots){
      r.click();
    }
  }
}
