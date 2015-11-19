String songtext1   = "Neonschwarz-OnAJourney";
String songtext2   = "AbsoluteBeginner-Fuechse";
String currentText = songtext2;

int canvasWidth  = 490;
int canvasHeight = 710;

ArrayList<Flower> flowerList = new ArrayList<Flower>();
int flowerCount;
float currentScale = 1.0;
int time;
int wait             = 200;
int maxVisibleFlowers = 4;
int maxAlpha          = 200;

void setup() {
  smooth();
  size(490, 710);
  background(#1e1e1e);
  time = millis();
    
  String   filepath = sketchPath("../../assets/text/" + currentText + ".txt");
  String[] lines = loadStrings(filepath);
  
  float yStep = canvasHeight / lines.length;
  float yStepCurrent = yStep;
  
  for (int i=0; i<lines.length; i++) {

    String[] words = split(lines[i], ' ');

    if (0 == words.length) {
      continue;
    }

    float xStep = canvasWidth / words.length;
    float xStepCurrent = xStep;

    for (int j=0; j<words.length; j++) {

      if (0 == words[j].length()) {
        continue;
      }
      float xBase = xStepCurrent - random((canvasWidth/50), xStep) + 10;
      float yBase = yStepCurrent - random((canvasHeight/70), yStep) + 20;

      flowerList.add(new Flower(xBase, yBase, words[j], maxAlpha));

      xStepCurrent += xStep;
    }

    yStepCurrent += yStep;
  }
  
  flowerCount = flowerList.size();
}

void draw() {
  // clear canvas
  fill(#1e1e1e);
  rect(0, 0, 490, 710);
  
  // set words visible on 
  if(millis() - time >= wait) {
    time = millis();
    
    for(int maxVisible = 0; maxVisible <= maxVisibleFlowers; maxVisible++) {
      Flower flower = flowerList.get((int)random(0,flowerCount-1));
      if (!flower.isVisible) {
        flower.isVisible = true;
        flower.alpha = maxAlpha;
      }
    }
  }
    
  // loop over all words and render the ones marked visible
  for(Flower flower: flowerList){
    if (flower.isVisible) {
      flower.alpha = flower.alpha - 5;
      flower.drawFlower();
     
      if (0 >= flower.alpha) {
        flower.isVisible = false;
      }
    }
  }
}