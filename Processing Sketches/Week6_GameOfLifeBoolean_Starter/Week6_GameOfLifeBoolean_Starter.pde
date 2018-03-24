//Array 2D
boolean[][] currentGen;
int scale;
int colScale;
int rowScale;

void setup(){
  size(1000,500);
  scale = 5;
  rowScale = width/scale;
  colScale = height/scale;
  currentGen = new boolean[rowScale][colScale];
  randomizeGrid();
}

void draw(){
  randomizeGrid();
  drawGrid();
  
}

void randomizeGrid(){//defines our random function
  for(int i = 0; i < rowScale; i++){//for loop that loops across the row
    for(int j = 0; j < colScale; j++){//for loop that loops down the column
      int randomNum = int(random(0,2));//defines an integer between 0 and 1
      if(randomNum == 1)//if the value is 1
      {
        //ALIVE 
        currentGen[i][j] = true;//sets the bool in liveOrDead to alive
      } else if(randomNum == 0){
        //DEAD
        currentGen[i][j] = false;//sets the bool in liveOrDead to dead
      }
    }
  }
}

void drawGrid(){
  for(int row =0; row < rowScale; row++){
    for(int col =0; col < colScale; col++){
      if(currentGen[row][col])//If liveOrDead = true
      {
        fill(255);//White
      } else {
        fill(0);//Black
      }
      rect(row*scale, col*scale, scale, scale);
    }
  }
}