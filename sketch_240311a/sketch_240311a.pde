Gesture gesture;

void setup(){
  size(1200, 800);
  gesture = new Gesture();
}
void draw(){
  background(255);
  gesture.drawPoints();

}

void mousePressed(){
  
gesture = new Gesture();
}

void mouseDragged(){

  gesture.addPoint(mouseX,mouseY);
}

void mouseReleased(){
println(gesture.originalPoints.size());
}
