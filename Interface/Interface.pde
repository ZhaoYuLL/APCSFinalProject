import processing.sound.*;
SoundFile themeMusic,sliced, kaboom;
ArrayList<Root> roots;
ArrayList<Button> buttons;
Slider[] sliders =  new Slider[3];
int score, lives,sessionScore,nhighScore,thighScore,pausestart,pausetime;;
float Stime=0;
boolean lose, pause, timed, setting;
float ingamet=0;
PImage bg, ts, pauseSign;
PFont font;
//mouse particles
int numShapes = 7;
int shape = 0;   
int shapeSize = 13;
float[] xCor = new float[numShapes];  
float[] yCor = new float[numShapes];  
float[] shapeR = new float[numShapes]; 
float[] shapeG = new float[numShapes];
float[] shapeB = new float[numShapes];
float[] x = new float[20]; //need some adjusting
float[] y = new float[20]; 

void setup() {
  themeMusic = new SoundFile(this, "data/themeMusic.mp3");
  sliced = new SoundFile(this, "data/slice.mp3");
  kaboom = new SoundFile(this, "data/kaboom.mp3");
  kaboom.amp(1);
  themeMusic.amp(0.05);
  sliced.amp(.2);
  themeMusic.loop();
  font = loadFont("GB.vlw");
  textFont(font);
  ts = loadImage("titleScreen.jpg");
  bg = loadImage("background.png");
  pauseSign = loadImage("sign.png");
  ts.resize(1000,800);
  bg.resize(1000,800); //change
  frameRate(30);
  background(ts);
  size(1000, 800);
  sliders[0] = new Slider(20, 60, 40, 20);
  sliders[1] = new Slider(20, 160, 40, 20);
  sliders[2] = new Slider(20, 260, 40, 20);
  lives=3;
  roots = new ArrayList<Root>();
  buttons= new ArrayList<Button>();
  buttons.add( new Button("Normal",width/2-100,height/2-50,200,100));
  buttons.add( new Button("Timed",width/2-100,height/2+100,200,100));
  buttons.add( new Button("Setting",width/2-100,height/2+250,200,100));
  lose=true;
  pause=false;
}
void draw() {
  if(lives <= 0) {
    background(ts);
    lose = true;
    roots.clear();
    fill(213,44,32);
    textSize(20);
    if ((sessionScore >thighScore)&&timed==true){
      thighScore = sessionScore;
    }
   if ((sessionScore >nhighScore)&&timed==false)
     {nhighScore = sessionScore;
    }
    text("Last Round Score: " + sessionScore, width-180, 50);
    text("Normal Mode Highscore: " + nhighScore, width-180, 100);
    text("Timed Mode Highscore: " + thighScore, width-180, 150);
  }

if (lose){
    for (Button b: buttons){
      b.Draw();
      if (b.clicked==true&&b.label.equals("Normal")){
        lose=false;
        lives = 3;
        b.clicked = false;
        Stime=millis();     
        pausetime=0;
        timed=false;
        score=0;
      }     
      if (b.clicked==true&&b.label.equals("Timed")){
        lose=false;
        lives = 3;
        b.clicked = false;
        Stime=millis();     
        pausetime=0;
        timed=true;
        score=0;
      }
      if (b.clicked==true&&b.label.equals("Setting")){
        textSize(12);
        background(0);
        setting = !setting;   
        for (Slider s:sliders)
        s.draw();
        themeMusic.amp(sliders[0].t/100.0);
        kaboom.amp(sliders[0].t/100.0);
        sliced.amp(sliders[0].t/100.0);;
      }
    }
  }
  
  else {
    if (pause){
    background(bg);
    image(pauseSign, width/2, 50);
    fill(213,44,32);
    text("Lives: "+lives+"\nTime: "+(int)(Math.round(ingamet)/1000), 60, 50);
    text("Score: " + score, width-180, 50);
    textSize(100);
    text("Paused",width/2,110);
    }
   else{ 
  ingamet=millis()-Stime-pausetime;
  if (timed==true){
    ingamet=Stime+30000-millis();
  }
  background(bg);
   //mouse particles
  xCor[shape] = mouseX;
  yCor[shape] = mouseY;
  shapeR[shape] = random(255);
  shapeG[shape] = random(255);
  shapeB[shape] = random(255);

  if(nhighScore >= 50&&thighScore <= 30){ //rainbow
    stroke(255);
    line(pmouseX,pmouseY,mouseX,mouseY);
      for (int i=0; i<numShapes; i++) {
      fill(shapeR[i],shapeG[i],shapeB[i]);
      ellipse(xCor[i], yCor[i], shapeSize, shapeSize);
      
    }
    shape++;
    if(shape >= numShapes) shape = 0; 
  }

  if(thighScore > 30&&nhighScore<50){//stars
    //stars
    smooth(); 
    noStroke(); 
    for(int i = 0; i<x.length-1; i++) {
      x[i] = x[i+1];
      y[i] = y[i+1]; 
      fill(i*2,i*3,i*4);
      pushMatrix(); 
      translate(mouseX,mouseY);
      rotate(frameCount / -100.0);
      star(0, 0, 8.7, 20, 5); 
      popMatrix();
      fill(i*2,i*3,i*4);
      star(x[i], y[i], 8.7, 20, 5);  
      //rect(x[i], y[i], i-50, i-50);  
    }
    x[x.length-1] = mouseX; 
    y[y.length-1] = mouseY;
  } 

  if(nhighScore >= 50&&thighScore >= 30){//smoke
    smooth(); 
    noStroke(); 
    for(int i = 0; i<x.length-1; i++) {
    x[i] = x[i+1];
    y[i] = y[i+1]; 
    //fill(i*2,i*3,i*4);
    fill(255-i*5);
    ellipse(x[i], y[i], i-50, i-50); 
    }
    x[x.length-1] = mouseX; 
    y[y.length-1] = mouseY;
    for(int i = 0; i<x.length-1; i++) {
      noStroke();
      fill(255-i*5);
      ellipse(x[i],y[i],i-30,i-30);
    }
  }
  fill(255);
  //rect(20, 5, 200, 100, 7);
  //rect(width-220, 5, 200, 100, 7);
  fill(213,44,32);
  textSize(20);
  text("Lives: "+lives+"\nTime: "+(int)(Math.round(ingamet)/1000), 60, 50);
  text("Score: " + score, width-180, 50);
  sessionScore = score;
  for (Root r : new ArrayList<Root>(roots)) {
    r.move();
    r.display();
    if (r.index==4&&r.exploding==true&&r.exploded==false){
      kaboom.play();
      r.exploded=true;
    }
    if (r.exploded==true&&r.tick>=1450){
      roots.remove(r);
    }
    r.click();//enables slashing
    //if goes off the bottom, remove it

    if(r.y>=height+r.radius){
      if (r.bomb==false&&r.deadroot==false)
    lives --;
    }
    if (r.y>=height+r.radius||r.remove==true) {    
      float angle= atan2(mouseY-r.y,mouseX-r.x);
      roots.remove(r);
      if (r.remove==true){
        if (r.dy>0)
        roots.add(new Deadroot(r.radius,r.x,r.y,r.dx,r.dy,color(0),angle, r.index));
        
        else{
        roots.add(new Deadroot(r.radius,r.x,r.y,r.dx,-r.dy,color(0),angle, r.index));
        }
        if (r.bomb==true){
          score-=5;
          lives--;
        } 
        else{
        score++;
        sliced.play();
       
        }
      }
    } 
  }
  if ((ingamet%5000>50&&ingamet%5000<100)||roots.size()==0) {
    double multi=1;
    if (timed==true)
      multi=(int)random(1,3)+3;
    else if (ingamet>10000){
       multi=(double)ingamet/10000;
    }
      for (int i=0; i<(int)(random(4)*multi)+3; i++) {
      int x = (int)(Math.random() * ((21 -1) + 1)) + 1;
      if (x<=6) roots.add(new Radish());
      if (x>6&&x<=12) roots.add(new Onion());
      if (x>18) roots.add(new Bomb());
      if (x>12&&x<=18)roots.add(new Potato());
    }
  }
     if (timed==true&&ingamet>0&&ingamet<=10000){
       fill(0,100+10*(10-ingamet/1000));
       textSize(100+(15000-ingamet)/75);
        text((int)(Math.round(ingamet)/1000), width/2, height/2-50);
      }
      if (timed==true&&ingamet<=0){
        lives=0;
      }
  }

  fill(0);  
  textSize(20);
  text("FPS: "+frameRate, width/2, 20); //hide laterrrrrrrrbac
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
    for (Slider s: sliders) {
      if (s.mouseOver()) s.lock = true;
    }
  }
}

void keyPressed(){
  if (keyPressed){
    if (key==32)
      pause=!pause;
      if (pause==true){
        pausestart=millis();
      }
      else if (pause==false){
        pausetime=millis()-pausestart;
      }
  }
}

 
void mouseReleased() {

  for (Slider s:sliders) {
    s.lock = false;
  }
}
void star(float x, float y, float radius1, float radius2, int npoints) {
  float angle = TWO_PI / npoints;
  float halfAngle = angle/2.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    vertex(sx, sy);
    sx = x + cos(a+halfAngle) * radius1;
    sy = y + sin(a+halfAngle) * radius1;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}
