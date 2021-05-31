
ArrayList<Root> roots;
ArrayList<Button> buttons;
int score;
int lives;
float highScore;
float Stime=0;
boolean lose;
float ingamet=0;
PImage bg, ts;
boolean firstTime = true;
int x = 0;
void setup() {
  ts = loadImage("titleScreen.jpg");
  bg = loadImage("background.png");
  ts.resize(1000,800);
  bg.resize(1000,800); //change
  frameRate(30);
  background(ts);
  size(1000, 800);
  lives=3;
  roots = new ArrayList<Root>();
  buttons= new ArrayList<Button>();
  buttons.add( new Button("Play",width/2-100,height/2-50,200,100));
  buttons.add( new Button("Play Again",width/2-100,height/2-50,200,100));
  lose=true;
}
void draw() {
  if(lives <= 0) {
    background(ts);
    lose = true;
    roots.clear();
  }

  if (lose){
      if(!firstTime) x = 1;
      buttons.get(x).Draw();
      if (buttons.get(x).clicked==true){
      lose=false;
      lives = 3;
      buttons.get(x).clicked = false;
      Stime=millis();
      score=0;
      firstTime = false;
      }
      
  }
  
  else {
  ingamet=millis()-Stime;
  background(bg);
  stroke(255);
  line(pmouseX,pmouseY,mouseX,mouseY);
  fill(255);
  rect(20, 5, 200, 100, 7);
  rect(width-220, 5, 200, 100, 7);
  fill(0);
  textSize(20);
  text("Lives: "+lives+"\nTime: "+(int)(Math.round(ingamet)/1000), 60, 50);
  text("Score: " + score, width-180, 50);

  for (Root r : new ArrayList<Root>(roots)) {
    r.move();
    r.display();
    //if goes off the bottom, remove it
    if(r.y>=height+r.radius) lives --;
    if (r.y>=height+r.radius||r.remove==true) {
      roots.remove(r);
      if (r.remove==true)
        score++;
    } 
  }
  if (ingamet%5000>50&&ingamet%5000<100) {
    double multi=1;
    if (ingamet>15000){
       multi=(double)ingamet/10000;
    }
      for (int i=0; i<(int)(random(10)*multi); i++) {
      int x = (int)(Math.random() * ((9 -1) + 1)) + 1;
      if (x<=3) roots.add(new Radish());
      if (x>=7) roots.add(new Onion());
      else if (x >3 && x<7)  roots.add(new Potato());
    }
  }

  fill(0);  
  textSize(20);
  text("FPS: "+frameRate+"\nRoots: "+roots.size(), width/2, 20); //hide laterrrrrrrrbac
  }
}

void mousePressed() {
  if (mouseButton == LEFT) {
    for (Root r : roots) {
      r.click();
    }
    for (Button b : buttons) {
      b.click();
    }
  }
}
