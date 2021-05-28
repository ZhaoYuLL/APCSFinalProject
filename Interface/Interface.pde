
ArrayList<Root> roots;
ArrayList<Button> buttons;
int score;
int lives;
float highScore;
float Stime=0;
boolean lose;
float ingamet=0;
void setup() {
  frameRate(30);
  size(1000, 800);
  lives=3;
  roots = new ArrayList<Root>();
  buttons= new ArrayList<Button>();
  buttons.add( new Button("Play",width/2-100,height/2-50,200,100));
  lose=true;
}
void draw() {
  if(lives <= 0) {
    background(200);
    lose = true;
    roots.clear();
  }

  if (lose){
    for (Button b: buttons){
      b.Draw();
      if (b.clicked==true){
      lose=false;
      lives = 3;
      b.clicked = false;
      Stime=millis();
      }     
    }
  }
  
  else {
  ingamet=millis()-Stime;
  background(200);
  fill(255);
  rect(20, 5, 200, 100, 7);
  rect(width-220, 5, 200, 100, 7);
  fill(0);
  textSize(20);
  text("Lives: "+lives+"\nTime: "+(int)(Math.round(ingamet)/1000), 30, 50);
  text("Score: " + score, width-200, 50);

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
      if (x>=7) roots.add(new Beet());
      else if (x >3 && x<7)  roots.add(new Potato());
    }
  }

  fill(0);  
  textSize(20);
  text("FPS: "+frameRate+"\nRoots: "+roots.size(), width/2, 20);
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
