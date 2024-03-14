class Oval extends Shape {
 Oval(float left, float top, float right, float bottom) {
    super(left, top, right, bottom);
    
 }
 
 void drawShape() {
   fill(255,0,0);
  ellipseMode(CORNERS);
   
   ellipse(box.left, box.top, box.right, box.bottom);
 }
}
