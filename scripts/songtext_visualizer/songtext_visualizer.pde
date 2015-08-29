String songtext1   = "Neonschwarz-OnAJourney";
String songtext2   = "AbsoluteBeginner-Fuechse";
String currentText = songtext2;

float currentWidth  = 490;
float currentHeight = 710;

smooth();
size(500, 720);
background(#1e1e1e);

String filepath = sketchPath("../../assets/text/" + currentText + ".txt");
String[] lines = loadStrings(filepath);

for(int i=0; i<lines.length; i++) {
  String[] words = split(lines[i], ' ');
  
  for(int j=0; j<words.length; j++) {
    float currentRand1 = random(words[j].length());
    float currentRand2 = random(words[j].length());
    
    float xBase1 = (currentRand1 * 18) + i + 10;
    float yBase1 = j * currentRand2 * 7 + 10;
    float xBase2 = xBase1 + (words[j].length() * currentRand1 / currentRand2 * 2);
    float yBase2 = yBase1 + (words[j].length() * currentRand2 / currentRand1 * 3);
    float xBase3 = xBase1 - (words[j].length() * currentRand2 / currentRand2 * 2);
    float yBase3 = yBase1 + (words[j].length() * currentRand1 / currentRand1 * 3);
    
    if(xBase1 > currentWidth)  xBase1 = currentWidth;
    if(yBase1 > currentHeight) yBase1 = currentWidth;
    if(xBase2 > currentWidth)  xBase2 = currentWidth;
    if(yBase2 > currentHeight) yBase2 = currentWidth;
    if(xBase3 > currentWidth)  xBase3 = currentWidth;
    if(yBase3 > currentHeight) yBase3 = currentWidth;
    
    fill(xBase3, xBase2, xBase1);
    triangle(xBase1, yBase1, xBase2, yBase2, xBase3, yBase3);
  }
}

save( sketchPath("../../results/songtext_visualizer/" + currentText + ".currentText") );