size(640, 360);
noSmooth();
background(0);
stroke(153);

class Flower
{
  public float   centerX;
  public float   centerY;
  public int     segmentCount;
  public float   angle;
  
  public String  word;
  
  public char[]  charList;
  public ArrayList<float[]> pointList = new ArrayList<float[]>();
  
  public float   currentAngle;
  
  
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
  
  public void drawLeaf(float len)
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
  
  public void drawLeafOutline()
  {
    for(int coord1 = 0; coord1 < this.pointList.size(); coord1++) {
      int coord2 = coord1 + 1;
      
      if(coord2 >= this.pointList.size()) {
        coord2 = 0;
      }
      
      float[] coordinate1 = this.pointList.get(coord1);
      float[] coordinate2 = this.pointList.get(coord2);
      
      line(coordinate1[0], coordinate1[1], coordinate2[0], coordinate2[1]);
    }
  }
  
  public void drawFlower()
  {
    for(int charIndex = 0; charIndex < this.charList.length; charIndex ++) {
      
      float charLen = (int)this.charList[charIndex];
      this.drawLeaf(charLen); 
    }
    
    this.drawLeafOutline();
  }
}

Flower flower = new Flower(200, 200, "dasIstEinKomischerTest");
flower.drawFlower();

Flower flower2 = new Flower(100, 100, "StarWars");
flower2.drawFlower();