abstract class Shape{

  BoundingBox box;

 Shape(float left, float top, float right, float bottom) {
    this.box = new BoundingBox(left, top, right, bottom);
  }
 void drawShape() { 
}
boolean contains (float x, float y) {
    return x >= box.left && x <= box.right && y >= box.top && y <= box.bottom;
}



}
