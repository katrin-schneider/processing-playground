String songtext1   = "Neonschwarz-OnAJourney";
String songtext2   = "AbsoluteBeginner-Fuechse";
String currentText = songtext2;

int currentWidth  = 490;
int currentHeight = 710;

ArrayList<Word> wordList = new ArrayList<Word>();
int wordCount;
int currentWordIndex = 0;
int time;
int wait             = 200;
boolean tick;
int wordYPos         = 0;

class Word
{
  public String text;
  public int alpha;
  public boolean isVisible;
  public int yPos;
  public float xBase1;
  public float yBase1;
  public float xBase2;
  public float yBase2;
  public float xBase3;
  public float yBase3;
  
  public Word(String text, int alpha, boolean isVisible) 
  {
    this.text = text;
    this.alpha = alpha;
    this.isVisible = isVisible;
  }
}

void setup() {
  smooth();
  size(490, 710);
  background(#1e1e1e);
  time = millis();
    
  String   filepath = sketchPath("../../assets/text/" + currentText + ".txt");
  String[] lines = loadStrings(filepath);
  
  // split text-file into single words
  for(int lineIndex=0; lineIndex < lines.length; lineIndex++) {
    String[] wordsPerLine = split(lines[lineIndex], ' ');
    
    for(int wordIndex=0; wordIndex < wordsPerLine.length; wordIndex++) {
      wordList.add(new Word(wordsPerLine[wordIndex], 255, false));
    }
  }
  
  wordCount = wordList.size();
}

void draw() {
  // clear canvas
  fill(#1e1e1e);
  rect(0, 0, 490, 710);
  
  // set words visible on 
  if(millis() - time >= wait) {
    time = millis();
 
    if (currentWordIndex < wordCount) {
      Word word = wordList.get(currentWordIndex);
      word.isVisible = true;
      String currentWord = word.text;
      
      int yPos = wordYPos * 10;
      
      if (yPos > currentHeight - 10) {
        wordYPos = 0;
      }
      
      word.yPos = yPos;
     
      float currentRand1 = random(currentWord.length());
      float currentRand2 = random(currentWord.length());
      
      word.xBase1 = (currentRand1 * 18) + currentWordIndex + 10;
      word.yBase1 = 1 * currentRand2 * 7 + 10;
      word.xBase2 = word.xBase1 + (currentWord.length() * currentRand1 / currentRand2 * 2);
      word.yBase2 = word.yBase1 + (currentWord.length() * currentRand2 / currentRand1 * 3);
      word.xBase3 = word.xBase1 - (currentWord.length() * currentRand2 / currentRand2 * 2);
      word.yBase3 = word.yBase1 + (currentWord.length() * currentRand1 / currentRand1 * 3);
     
      if(word.xBase1 > currentWidth)  word.xBase1 = currentWidth;
      if(word.yBase1 > currentHeight) word.yBase1 = currentWidth;
      if(word.xBase2 > currentWidth)  word.xBase2 = currentWidth;
      if(word.yBase2 > currentHeight) word.yBase2 = currentWidth;
      if(word.xBase3 > currentWidth)  word.xBase3 = currentWidth;
      if(word.yBase3 > currentHeight) word.yBase3 = currentWidth;
      
      currentWordIndex += 1;
      wordYPos         += 1;
    } else {
      currentWordIndex = 0;
    }
  }
    
  // loop over all words and render the ones marked visible
  for(Word word: wordList){
    if (word.isVisible) {
      // render visual presentation of a word
      fill(word.xBase3, word.xBase2, word.xBase1, word.alpha - 20);
      triangle(word.xBase1, word.yBase1, word.xBase2, word.yBase2, word.xBase3, word.yBase3);
      
      // render word
      fill(#FFFFFF, word.alpha);
      text(word.text, 10, word.yPos);
     
      word.alpha = word.alpha - 5;
      
      if (0 >= word.alpha) {
        word.isVisible = false;
      }
    }
  }
}