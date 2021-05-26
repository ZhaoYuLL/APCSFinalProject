
ArrayList<Root> roots;
int score;
int lives;
float highScore;
float time;

void setup(){
frameRate(30);
size(1000,800);
<<<<<<< HEAD
lives = 3;
rect(20, 5, 200, 100, 7);

fill(0);
textSize(20);
text("Lives: "+lives+"\nScore: "+score,30,50);

=======
roots = new ArrayList<Root>();
  for (int i = 0; i < 500; i++)
    roots.add(new Root());
>>>>>>> d0ba0557e32b8e8e552ac1a2bd42d2c74f7bd920
}
void draw(){}
void mousePressed(){
  if(mouseButton == LEFT){
    for(Root r: roots){
      r.click();
    }
  }
}
