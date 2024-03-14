import java.util.ArrayList;

class Gesture {
  ArrayList<Point> originalPoints;
  ArrayList<Point> resampledPoints;
  ArrayList<Point> translatedPoints;
  ArrayList<Point> scaledPoints;
  BoundingBox boundingBox;
  float templates[][] ={};
  

  public Gesture() {
    originalPoints = new ArrayList<>();
    resampledPoints = new ArrayList<>();
    translatedPoints= new ArrayList<>();
    scaledPoints = new ArrayList<>();
   
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
  
  
  public float distCal(Point p1, Point p2) {
    
    return dist(p1.getX(),p1.getY(),p2.getX(),p2.getY());
  
  }
  
  public void reSample() {
   
    float gesturelength = 0;
    
    for (int i=1;i<originalPoints.size();i++) {
      Point prevPoint = originalPoints.get(i-1);
      Point curPoint =  originalPoints.get(i);
      gesturelength += distCal (prevPoint,curPoint);
   
      }
      float threshold = gesturelength/64;
      
      float totallength = 0;
      
       // add the first point to re samples point from the original points 
    resampledPoints.add(originalPoints.get(0));

      for (int i=1;i<originalPoints.size();i++) {
      Point prevPoint = originalPoints.get(i-1);
      Point curPoint =  originalPoints.get(i);
       float d =  distCal(prevPoint,curPoint);
      
      if (d +totallength > threshold )
      {
       float newx = prevPoint.getX() + (threshold-totallength)/d *(curPoint.getX()-prevPoint.getX());
       float newy = prevPoint.getY() + (threshold-totallength)/d*(curPoint.getY()-prevPoint.getY());
       Point newp = new Point(newx,newy);
       resampledPoints.add(newp);
       originalPoints.add(i,newp);
       totallength = 0;
       d=0;
      }
      else {
     totallength += d;
      }     
      
      }
     
    
      if (resampledPoints.size() < 63) {
    resampledPoints.add(new Point(originalPoints.get(originalPoints.size() - 1).x, originalPoints.get(originalPoints.size() - 1).y));
  }
     //println("resampledPoints has  "+resampledPoints.size());
    
      
    }
 

  public BoundingBox createBoundingBox() {
    
    FloatList xs = new FloatList();
    FloatList ys = new FloatList();
     for (Point p :resampledPoints ) {
     xs.append(p.getX());
     }
    for (Point p :resampledPoints ) {
     ys.append(p.getY());
     }
     
     float left = xs.min();
     float right = xs.max();
     float top = ys.min();
     float bottom = ys.max();
     
    boundingBox = new BoundingBox(left,top,right,bottom);
    
    // move to the origin
    
     //   for (Point p :resampledPoints ) {
   
     //     float tx = p.getX()-xs.min();
     //     float ty = p.getY()-ys.min();
     //     translatedPoints.add (new Point(tx,ty));       
     //}
   
    
      return boundingBox;
  
  }
  
  public void translatePoints() {
    
    
    FloatList xs = new FloatList();
    FloatList ys = new FloatList();
     for (Point p :resampledPoints ) {
     xs.append(p.getX());
     }
    for (Point p :resampledPoints ) {
     ys.append(p.getY());
     }
    
        for (Point p : resampledPoints) {
        float tx = p.getX()-xs.min();
          float ty = p.getY()-ys.min();
        //println(scaledX,scaledY);
        translatedPoints.add (new Point(tx,ty));      
}
  
  
  }

public void scalePoints () {

    FloatList xs = new FloatList();
    FloatList ys = new FloatList();
     for (Point p :translatedPoints ) {
     xs.append(p.getX());
     }
    for (Point p :translatedPoints ) {
     ys.append(p.getY());
     }
     float mx = xs.max();
     float my = ys.max();

        for (Point p : translatedPoints) {
        float scaledX = p.getX() * 400/mx;
        float scaledY = p.getY() * 400/my;
        //println(scaledX,scaledY);
        scaledPoints.add(new Point(scaledX, scaledY));
}
 
}

public void processPoints() {
  reSample();
  translatePoints();
  scalePoints();
  
  

}


  public float compare(Gesture g) {
    float totaldist = 0;
   g.processPoints();

    for (int i =0;i< this.scaledPoints.size();i++) {
      totaldist += dist ( g.scaledPoints.get(i).getX(),g.scaledPoints.get(i).getY(),this.scaledPoints.get(i).getX(), this.scaledPoints.get(i).getY());
      
   
    }
     
   
   return totaldist;
 

 }
}
