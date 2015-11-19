void setup() {
  int canvasLength = 600;
  int canvasHeight = 800;

  smooth();
  size(600, 800);
  background(#1e1e1e);
  stroke(#FFFFFF, 50);

  String songtext1   = "Neonschwarz-OnAJourney";
  String songtext2   = "AbsoluteBeginner-Fuechse";
  String songtext3   = "starwars";
  String currentText = songtext1;

  String filepath = sketchPath("../../assets/text/" + currentText + ".txt");
  String[] lines  = loadStrings(filepath);

  float yStep = canvasHeight / lines.length;
  float yStepCurrent = yStep;

  for (int i=0; i<lines.length; i++) {

    String[] words = split(lines[i], ' ');

    if (0 == words.length) {
      continue;
    }

    float xStep = canvasLength / words.length;
    float xStepCurrent = xStep;

    for (int j=0; j<words.length; j++) {

      if (0 == words[j].length()) {
        continue;
      }
      float xBase = xStepCurrent - random((canvasLength/50), xStep) + 10;
      float yBase = yStepCurrent - random((canvasHeight/70), yStep) + 20;

      Flower flower = new Flower(xBase, yBase, words[j]);
      flower.drawFlower();

      xStepCurrent += xStep;
    }

    yStepCurrent += yStep;
  }

  save( sketchPath("../../results/songtext_visualizer/" + currentText + ".currentText") );
}