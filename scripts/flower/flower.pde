class Flower
{
  public int     segmentCount;
  public float   centerX;
  public float   centerY;
  public float   angle;
  public float   currentAngle;
  
  public String  word;
  
  public char[]  charList;
  public ArrayList<float[]> pointList = new ArrayList<float[]>();
  
  
  
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
  }
  
  public void drawLeafVeins(float len)
  {  
    float x = this.centerX + len * cos(radians(this.currentAngle));
    float y = this.centerY + len * sin(radians(this.currentAngle));
   
    line(this.centerX, this.centerY, x, y);
    
    float[] coordinates = new float[2];
    coordinates[0] = x;
    coordinates[1] = y;
    
    this.pointList.add(coordinates);
    this.currentAngle += this.angle;
  }
  
  public void finishLeaf()
  {
    for(int coord1 = 0; coord1 < this.pointList.size(); coord1++) {
      int coord2 = coord1 + 1;
      
      if(coord2 >= this.pointList.size()) {
        coord2 = 0;
      }
      
      float[] coordinate1 = this.pointList.get(coord1);
      float[] coordinate2 = this.pointList.get(coord2);
      
      line(coordinate1[0], coordinate1[1], coordinate2[0], coordinate2[1]);
      fill(#FFFFFF, 100);
      triangle(this.centerX, this.centerY, coordinate1[0], coordinate1[1], coordinate2[0], coordinate2[1]);
    }
  }
  
  public void drawFlower()
  {
    for(int charIndex = 0; charIndex < this.charList.length; charIndex ++) {
      
      float charLen = (int)this.charList[charIndex];
      this.drawLeafVeins(charLen); 
    }
    
    this.finishLeaf();
  }
}