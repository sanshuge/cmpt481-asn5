class Rectangle extends Shape {
  Rectangle(float left, float top, float right, float bottom) {
    super(left, top, right, bottom);
  }

  void drawShape() {
    fill(255,0,0);
    rect(box.left, box.top, box.right, box.bottom);
  }
}
