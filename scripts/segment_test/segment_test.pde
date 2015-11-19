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
  
  public String word;
  
  public char[] charList;
  
  
  public Flower(float centerX, float centerY, String word)
  {
    this.centerX = centerX;
    this.centerY = centerY;
    this.word    = word;
   
    this.segmentCount = word.length();
    this.angle = 360 / this.segmentCount;
    
    int len = this.word.length();
    
    this.charList = new char[len]; 
    
    this.word.getChars(0, len, this.charList, 0);
    
    this.currentX = this.centerX;
    this.currentY = this.centerY - this.charList[0];    
  }
  
  public void drawLeaf(float len)
  {
   
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
   
    
    line(this.centerX, this.centerY, newX, newY);
    line(this.currentX, this.currentY, newX, newY);
    
    this.currentX = newX;
    this.currentY = newY;
  }
  
  public void drawFlower()
  {
    line(this.centerX, this.centerY, this.currentX, this.currentY);
    
   
    for(int charIndex = 0; charIndex < this.charList.size(); charIndex ++) {
      int charLen = (int)this.charList[charIndex];
      this.drawLeaf(charLen);
    }
  }
}

Flower flower = new Flower(100, 100, "Fitzlibutzli");
flower.drawFlower();