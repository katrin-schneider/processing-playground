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

    line(this.centerX, this.centerY, x, y);

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

      line(coordinate1[0], coordinate1[1], coordinate2[0], coordinate2[1]);

      triangle(this.centerX, this.centerY, coordinate1[0], coordinate1[1], coordinate2[0], coordinate2[1]);
    }
  }

  public void drawFlower()
  {
    int flowerColorR = round(random(1, this.charList.length) / this.charList.length * 255);
    int flowerColorG = round(random(1, this.charList.length) / this.charList.length * 255);
    int flowerColorB = round(random(1, this.charList.length) / this.charList.length * 255);
    
    if(flowerColorR > 100) {
      flowerColorR = 100;
    }
    
    flowerColorR += 40;
    flowerColorG += 60;
    flowerColorB += 60;

    stroke(flowerColorR, flowerColorG, flowerColorB, 50);
    fill(flowerColorR, flowerColorG, flowerColorB, 50);

    for (int charIndex = 0; charIndex < this.charList.length; charIndex ++) {

      float charLen = (int)this.charList[charIndex];
      this.drawLeafVeins(charLen);
    }

    this.finishLeaf();
  }
}