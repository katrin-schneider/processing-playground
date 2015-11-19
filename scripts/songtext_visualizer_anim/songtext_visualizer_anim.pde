String songtext1   = "Neonschwarz-OnAJourney";
String songtext2   = "AbsoluteBeginner-Fuechse";
String currentText = songtext2;

int canvasWidth  = 490;
int canvasHeight = 710;

ArrayList<Flower> flowerList = new ArrayList<Flower>();
int flowerCount;
int currentFlowerIndex = 0;
int time;
int wait             = 200;
boolean tick;
int wordYPos         = 0;

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

      flowerList.add(new Flower(xBase, yBase, words[j]));

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
 
    if (currentFlowerIndex < flowerCount) {
      Flower flower = flowerList.get(currentFlowerIndex);
      flower.isVisible = true;
      
      currentFlowerIndex += 1;
    } else {
      currentFlowerIndex = 0;
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