
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
  for (int i = 0; i < 10; i++){
    int x = (int)(Math.random() * ((9 -1) + 1)) + 1;
    if(x<=3) roots.add(new Radish());
    if(x>=7) roots.add(new Beet());
    else roots.add(new Potato());
  }
}
void draw(){
  time=millis();
  background(200);
  fill(255);
  rect(20, 5, 200, 100, 7);
  rect(width-220, 5, 200, 100, 7);
  fill(0);
  textSize(20);
  text("Lives: "+lives+"\nTime: "+(int)(Math.round(time)/1000),30,50);
  text("Score: " + score,width-200,50);

  for (Root r : new ArrayList<Root>(roots)) {
    //if goes off the bottom, remove it
    if (r.y>=height+r.radius||r.remove==true){
      roots.remove(r);
      if (r.remove==true)
      score++;
    }
    else{
      r.move();
    r.display(); 
    }
  }
  if (time%50==0){
      for (int i=0; i<(int)random(10);i++){
        int x = (int)(Math.random() * ((9 -1) + 1)) + 1;
    if(x<=3) roots.add(new Radish());
    if(x>=7) roots.add(new Beet());
     else if(x >3 && x<7)  roots.add(new Potato());
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
