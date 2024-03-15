Gesture gesture;
Gesture oval;
Gesture rectangle ;
Gesture alpha ;
ArrayList<Shape> shapes ;

float ovalthreshold = 3500;
float rectthreshold = 3500;
float alphathreshold = 8000;

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
   FloatDict  gestures = new FloatDict();
  
    float o = oval.compare(gesture);
    gestures.set("oval",o);
    
    println ("oval: ",o);
    
    float r = rectangle.compare(gesture);
    gestures.set("rectangle",r); 
    
    println ("rectangle: ",r);
     float a = alpha.compare(gesture);
    gestures.set("alpha",a);
    
     println ("alpha: ",a);

  String match = gestures.keyArray()[gestures.minIndex()];
  float distance = gestures.get(match);
   

  println("Best match: "+ match +"  with error of "+  distance +" (under error threshold)");
  
  if (match == "oval" && distance<ovalthreshold) {
  BoundingBox b = gesture.createBoundingBox();
    Oval newOval = new Oval(b.left, b.top, b.right, b.bottom);
        shapes.add(newOval);
        //println("it is added");
  
  }
  else if (match == "rectangle" && distance < rectthreshold) {
        BoundingBox b = gesture.createBoundingBox();
        Rectangle newRect = new Rectangle(b.left, b.top, b.right, b.bottom);
        shapes.add(newRect);
          //println("it is added");
        
      
  }
  // delete the shape
  else if (match == "alpha" && distance <= alphathreshold ) {
    //  println("it is added");
    Point initialPoint = gesture.originalPoints.get(0);
     println("the inital point of this alpha is at   "+initialPoint.getX(),initialPoint.getY());
   
    for (int i =0 ; i<shapes.size();i++) {
      if (shapes.get(i).contains(initialPoint.getX(),initialPoint.getY())) {
       
        shapes.remove(i);
      
      }
    
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
  //BoundingBox b = gesture.createBoundingBox();
  gesture.processPoints();
  
  //Oval s = new Oval(b.left,b.top,b.right,b.bottom);

  match();



}
