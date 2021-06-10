class Slider {
  float x,y,w,h;
  float leftX;
  boolean lock;
  double t;
 
  Slider (float x, float y, float w, float h) {
    this.x=x;
    this.y=y;
    this.w=w;
    this.h=h;  
    leftX = x;   
  }
 
 
  void draw() {
    float right = width-w-leftX;
    fill(255);
    rect(leftX, y, right, 4); //line
    int soundVolume = int(map(x, leftX, right, 100, 0));
    t=soundVolume;
    fill(200);
    rect(x, y, w, h);
    fill(0);
    text(soundVolume +"%", x+19, y+10);
    float temp = mouseX;
    if(mouseX<leftX) temp = leftX;
    if(mouseX>width-w-leftX) temp = width-w-leftX;
    float my = temp;
    if(lock) x = my;
  }
 
  boolean mouseOver()
  {
    return(mouseX>= x) && (mouseX<= x+w) && (mouseY >= y) && (mouseY <= y+h);
  }
}
 
