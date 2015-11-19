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
  
  public int colorR;
  public int colorG;
  public int colorB;
  
  public int alpha = 255;
  public boolean isVisible;

  public Flower(float centerX, float centerY, String word, int alpha)
  {
    this.alpha   = alpha;
    this.centerX = centerX;
    this.centerY = centerY;
    this.word    = word;

    this.segmentCount = word.length();
    this.angle = 360 / this.segmentCount;

    this.currentAngle = this.angle;

    int len = this.word.length();

    this.charList = new char[len]; 

    this.word.getChars(0, len, this.charList, 0);
    
    this.colorR = round(random(1, this.charList.length) / this.charList.length * 255);
    this.colorG = round(random(1, this.charList.length) / this.charList.length * 255);
    this.colorB = round(random(1, this.charList.length) / this.charList.length * 255);
    
    if(this.colorR > 100) {
      this.colorR = 100;
    }
    
    this.colorR += 40;
    this.colorG += 60;
    this.colorB += 60;
    
    for (int charIndex = 0; charIndex < this.charList.length; charIndex ++) {
      float charLen = (int)this.charList[charIndex];
      this.calculateLeafVeins(charLen);
    }
  }

  public void calculateLeafVeins(float len)
  {  
    // do some size boost here
    if (0 == len % 7) {
      len = len / 2;
    }
    else if (0 == len % 3) {
      len = len / 4;
    }
    else {
      len = len / 7;
    }

    float x = this.centerX + len * cos(radians(this.currentAngle));
    float y = this.centerY + len * sin(radians(this.currentAngle));

    float[] coordinates = new float[2];
    coordinates[0] = x;
    coordinates[1] = y;

    this.pointList.add(coordinates);
    this.currentAngle += this.angle;
  }

  public void finishLeaf()
  {
    for (int coord1 = 0; coord1 < this.pointList.size(); coord1++) {
      int coord2 = coord1 + 1;

      if (coord2 >= this.pointList.size()) {
        coord2 = 0;
      }

      float[] coordinate1 = this.pointList.get(coord1);
      float[] coordinate2 = this.pointList.get(coord2);

      line(this.centerX, this.centerY, coordinate1[0], coordinate1[1]);
      line(coordinate1[0], coordinate1[1], coordinate2[0], coordinate2[1]);
      triangle(this.centerX, this.centerY, coordinate1[0], coordinate1[1], coordinate2[0], coordinate2[1]);
    }
  }

  public void drawFlower()
  {
    stroke(this.colorR, this.colorG, this.colorB, this.alpha);
    fill(this.colorR, this.colorG, this.colorB, this.alpha);

    this.finishLeaf();
  }
}