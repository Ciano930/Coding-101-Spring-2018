//Array 2D
boolean[][] currentGen;
boolean[][] nextGen;
int scale;
int colScale;
int rowScale;

void setup(){
  size(1000,500);
  scale = 5;
  rowScale = width/scale;
  colScale = height/scale;
  currentGen = new boolean[rowScale][colScale];
  nextGen = new boolean[rowScale][colScale];
  randomizeGrid();
}

void draw(){
  //randomizeGrid();
  drawGrid();
  
  calculateNextGen();
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

int countNeighbours(boolean[][] currGen, int currRow, int currCol, int maxRow, int maxCol ){
  int neighbours = 0;
  //To count our values we need to count the corners, top, bottom and, side rows and center.
  /*Lets remind ourselves of our cell
  [-1,-1][-1,0][-1,+1]
  [ 0,-1][ 0,0][ 0,+1]
  [+1,-1][+1,0][+1,+1]*/
  /*===========================================*/
  /*==================Top Left=================*/
  /*===========================================*/
    if ( 
          (currRow-1) > 0 && 
          (currCol-1) > 0 && 
          currGen[currRow - 1][currCol - 1]
       ){neighbours++;}
  /*===========================================*/
  /*==================Top======================*/
  /*===========================================*/
    if (
          (currRow-1) > 0 &&
          currGen[currRow - 1][currCol]
       ){neighbours++;}
  /*===========================================*/
  /*==================Top Right================*/
  /*===========================================*/
    if (
         (currRow-1) > 0 &&
         (currCol+1) < maxCol &&
         currGen[currRow - 1][currCol + 1]
       ) {neighbours++;}
  /*===========================================*/
  /*==================Left=====================*/
  /*===========================================*/
    if (
          (currCol-1) > 0 &&
          currGen[currRow][currCol - 1]
       ){neighbours++;}
  /*===========================================*/
  /*==================Right====================*/
  /*===========================================*/
    if (
          (currCol+1) < maxCol &&
          currGen[currRow][currCol + 1]
       ){neighbours++;}
  /*===========================================*/
  /*==================Bottom Left==============*/
  /*===========================================*/
   if (
         (currRow+1) < maxRow &&
         (currCol-1) > 0 &&
         currGen[currRow + 1][currCol - 1]
      ){neighbours++;}
  /*===========================================*/
  /*==================Bottom===================*/
  /*===========================================*/
    if (
          (currRow+1) < maxRow &&
          currGen[currRow + 1][currCol]
       ) {neighbours++;}
  /*===========================================*/
  /*==================Bottom Right=============*/
  /*===========================================*/
    if (
          (currRow+1) < maxRow &&
          (currCol+1) < maxCol &&
          currGen[currRow + 1][currCol + 1]
       ) {neighbours++;}
  //Now we've checked all the possible sides and squares we can return our neighbours!
  print("neighbours " + neighbours +"\n");
  return neighbours;
}

void calculateNextGen(){
  //This will be incharge of generating the next cycle!
  for(int row =0; row < rowScale; row++){
    for(int col =0; col < colScale; row++){
      //now lets put in our life cases
      int neighbours = countNeighbours(currentGen, row, col, (rowScale-1),  (colScale-1));
      
      //Now we have our neighbours lets see what happens to this generation!
      //The rules of Life
      //1. if a cell has less than 2 neighbours it dies
      //2. if a cell has more than 3 neighbours it dies
      //3. if a cell has 2 or 3 neighbours it survives
      //4. if a cell has 3 neighbours and is dead, it comes alive
      
      //We can express these with some logical statements
      if(neighbours > 3 || neighbours < 2){
        nextGen[row][col] = false;
      }
      if(neighbours == 3 || neighbours == 2){
        nextGen[row][col] = currentGen[row][col];
      }
      if(neighbours == 3){
        nextGen[row][col] = true;
      }
    }
  }
  //Now that the calculations for the nextGeneration are complete,
  //we overwrite the previous gen
  currentGen = nextGen;
}