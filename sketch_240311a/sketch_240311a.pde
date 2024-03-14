Gesture gesture;
Gesture oval;
Gesture rectangle ;
Gesture alpha ;
ArrayList<Shape> shapes ;

Oval ovalShape;
Rectangle ovalRect;

void setup(){
  size(1200, 800);
  gesture = new Gesture();
  oval  = new Gesture();
  for (int i =0;i<ovaltemplate.length;i++) {
    Point np = new Point(ovaltemplate[i][0],ovaltemplate[i][1]);
    oval.originalPoints.add(np); 
  }
  oval.processPoints();

 rectangle  = new Gesture();
  for (int i =0;i<rectangletemplate.length;i++) {
    Point np = new Point(rectangletemplate[i][0],rectangletemplate[i][1]);
    rectangle.originalPoints.add(np); 
  }
    rectangle.processPoints();

 alpha  = new Gesture();
  for (int i =0;i<alphatemplate.length;i++) {
    Point np = new Point(alphatemplate[i][0],alphatemplate[i][1]);
    alpha.originalPoints.add(np); 
  }


alpha.processPoints();
shapes = new ArrayList<>();



}
void draw(){
  
  background(255);
 
    for (Shape shape : shapes) {

    shape.drawShape();
  }
  gesture.drawPoints();


}

void match(){
   FloatDict  gestures = new FloatDict();;
  
  float o = oval.compare(gesture);
  gestures.set("oval",o);

  float r = rectangle.compare(gesture);
    gestures.set("rectangle",r); 
 float a = alpha.compare(gesture);
  gestures.set("alpha",a);
 
  float minIndex = gestures.minIndex();

 String[] theKeys = gestures.keyArray();
  float[] theValues = gestures.valueArray();

for (int i =0;i<gestures.size();i++) {
  
  println(theKeys[i],theValues[i]);
  if (i == minIndex) {
  println("Best match: "+theKeys[i] +"  with error of "+  theValues[i] +" (under error threshold)");
  }
  
}

  
  
}

void mousePressed(){
  
gesture = new Gesture();
}

void mouseDragged(){

  gesture.addPoint(mouseX,mouseY);
  

}

void mouseReleased(){
  BoundingBox b = gesture.createBoundingBox();
  gesture.processPoints();
  
  //Oval s = new Oval(b.left,b.top,b.right,b.bottom);

  match();



}
