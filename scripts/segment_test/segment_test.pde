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
  
  public float currentAngle;
  
  
  public Flower(float centerX, float centerY, String word)
  {
    this.centerX = centerX;
    this.centerY = centerY;
    this.word    = word;
   
    this.segmentCount = word.length();
    this.angle = 360 / this.segmentCount;
    
    this.currentAngle = this.angle;
    
    int len = this.word.length();
    
    this.charList = new char[len]; 
    
    this.word.getChars(0, len, this.charList, 0);
    
    this.currentX = this.centerX;
    this.currentY = this.centerY - this.charList[0];    
  }
  
  public void drawLeaf(float len)
  {  
    float x = this.centerX + len * cos(radians(this.currentAngle));
    float y = this.centerY + len * sin(radians(this.currentAngle));
   
    line(this.centerX, this.centerY, x, y);
    line(this.currentX, this.currentY, x, y);
    
    println(this.currentAngle);
    
    this.currentX = x;
    this.currentY = y;
    
    this.currentAngle += this.angle;
  }
  
  public void drawFlower()
  {
    //line(this.centerX, this.centerY, this.currentX, this.currentY);
    
    for(int charIndex = 0; charIndex < this.charList.length; charIndex ++) {
      
      int charLen = (int)this.charList[charIndex];
      this.drawLeaf(charLen);
      
    }
  }
}

Flower flower = new Flower(200, 200, "ewtwetewtewtewtwetet");
flower.drawFlower();