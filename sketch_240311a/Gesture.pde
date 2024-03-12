import java.util.ArrayList;

class Gesture {
  ArrayList<Point> originalPoints;
  ArrayList<Point> resampledPoints;
  BoundingBox boundingBox;
  
  public Gesture() {
    originalPoints = new ArrayList<>();
    resampledPoints = new ArrayList<>();
  }
  
  public void addPoint(float x, float y) {
    originalPoints.add(new Point(x, y));
    
  }
  
  public void drawPoints () {
  
    for (Point p :originalPoints ) {
      stroke(255, 204, 0); 
      strokeWeight(5);
      point(p.getX(), p.getY());
    }
  }
  public void reSample() {
    int threshold = originalPoints.size()/64;
    
    
  
  }

  
 
}
