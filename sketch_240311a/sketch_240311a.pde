Gesture gesture;

void setup(){
  size(1200, 800);
  gesture = new Gesture();
}
void draw(){
  
  background(255);
  line(400,0,400,400);
  line(0,400,400,400);
  gesture.drawPoints();

}

void mousePressed(){
  
gesture = new Gesture();
}

void mouseDragged(){

  gesture.addPoint(mouseX,mouseY);
}

void mouseReleased(){
gesture.reSample();
gesture.createBoundingBox();
gesture.scalePoints();

}
