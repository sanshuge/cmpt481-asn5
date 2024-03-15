class Rectangle extends Shape {
  Rectangle(float left, float top, float right, float bottom) {
    super(left, top, right, bottom);
  }

  void drawShape() {
    fill(255,0,0);
     float width = box.right - box.left;
    float height = box.bottom - box.top;
    // Draw the rectangle with calculated width and height
    rect(box.left, box.top, width, height);
  }
}
