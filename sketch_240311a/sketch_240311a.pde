Gesture gesture;
Gesture oval;
 Gesture rectangle ;
  Gesture alpha ;
void setup(){
  size(1200, 800);
  gesture = new Gesture();
  
 oval  = new Gesture();
  for (int i =0;i<ovaltemplate.length;i++) {
    Point np = new Point(ovaltemplate[i][0],ovaltemplate[i][1]);
    oval.originalPoints.add(np); 
  }


 rectangle  = new Gesture();
  for (int i =0;i<rectangletemplate.length;i++) {
    Point np = new Point(rectangletemplate[i][0],rectangletemplate[i][1]);
    rectangle.originalPoints.add(np); 
  }

 alpha  = new Gesture();
  for (int i =0;i<alphatemplate.length;i++) {
    Point np = new Point(alphatemplate[i][0],alphatemplate[i][1]);
    alpha.originalPoints.add(np); 
  }





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
