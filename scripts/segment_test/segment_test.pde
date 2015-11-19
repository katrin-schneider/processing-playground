size(640, 360);
noSmooth();
background(0);
stroke(153);

class Flower
{
  
  public float centerX;
  public float centerY;
  public int segmentCount;
  public float angle;
  
  public float currentX;
  public float currentY;
  
  public Flower(float centerX, float centerY, int segmentCount)
  {
    this.centerX = centerX;
    this.centerY = centerY;
    this.segmentCount = segmentCount;
    this.angle = 360 / this.segmentCount;
  }
  
  public void drawSegment(float len)
  {
    if (0 == this.currentX && 0 == this.currentY) {
      this.currentX = this.centerX;
      this.currentY = this.centerY - len;    
    }
    
    /*
    Winkel = Drehwinkel in Grad (0-360)
    X = alte X-Koordinate
    Y = alte Y-Koordinate
    Xn = neue X-Koordinate
    Yn = neue y-Koordinate
    Xc = X-Koordinate des Zentrums
    Yc = Y-Koordinate des Zentrums
    u und d Hilfsvariablen (typ extended)
    
    u:= Winkel * Pi/180 + arctan2(Y-Yc,X-Xc);
    d:= sqrt((X-Xc)*(X-Xc) + (Y-Yc)*(Y-Yc));
    xn:=round(Xc+d*cos(u));
    yn:=round(Yc+d*sin(u));
    */
    
    float u = this.angle * PI / 180 + atan2(this.currentY - this.centerY,this.currentX - this.centerX);
    float d = sqrt((this.currentX-this.centerX)*(this.currentX-this.centerX) + (this.currentY-this.centerY)*(this.currentY-this.centerY));
    float newX = round(this.centerX + d*cos(u));
    float newY = round(this.centerY + d*sin(u));
    
    line(this.centerX, this.centerY, this.currentX, this.currentY);
    line(this.centerX, this.centerY, newX, newY);
    line(this.currentX, this.currentY, newX, newY);
    
    this.currentX = newX;
    this.currentY = newY;
  }
  
}

Flower flower = new Flower(100, 100, 5);
flower.drawSegment(40);
flower.drawSegment(30);