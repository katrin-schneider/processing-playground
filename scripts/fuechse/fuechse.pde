smooth();
size(400, 550);
background(#1e1e1e);
int currentSize = 10;

String lines[] = loadStrings( sketchPath("../../assets/text/AbsoluteBeginner-Fuechse.txt") );

for(int i=0; i<lines.length; i++) {
  String[] words = split(lines[i], ' ');
  currentSize = 10;
  
  for(int j=0; j<words.length; j++) {
    float currentRand = random(words[j].length()) * 5;
    String currentWord = words[j];
    triangle(
      i * currentRand,
      j * currentRand * 2,
      i*5 + words[j].length(),
      j*30 + words[j].length(),
      i*5 - (words[j].length() / 2),
      j*30 + (words[j].length() * 1.25)
    );
  }
}