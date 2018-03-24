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
  nextGen = currentGen;
}

void draw(){
  //randomizeGrid();
  calculateGrid();
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

void calculateGrid(){
  //1. If a live cell has 2 or 3 live neighbours, it lives to the next generation.
  //2. If a live cell has 3 or more live neighbours, it dies from overpopulation
  //3. If a live cell has less than 2 live neighbours, it dies from underpopulation
  //4. If a dead cell has exactly 3 live neighbours, it comes to life from reproduction
  for(int row = 0; row < rowScale; row++){
    for(int col = 0; col < colScale; col++){
      int neighbours = 0;
      //This is where we calculate our neighbours
      
      neighbours = calculateNeighbours(row, col);
      
      
      if(currentGen[row][col]){
        if(neighbours == 3 || neighbours == 2){
          //Cell stays alive
          nextGen[row][col] = true;
        } else {
          //dead cell
          nextGen[row][col] = false;
        }//End of Rules 1,2 and, 3
      } else {
        if(neighbours == 3){
          //New cell lives
          nextGen[row][col] = true;
        }
      }//End rule 4
    }//end Col loop
  }//end Row loop
}

int calculateNeighbours(int row, int col){
  int neighbours = 0;
  /*
  [-1,-1][-1, 0][-1,+1]
  [ 0,-1][ 0, 0][ 0,+1]
  [+1,-1][+1, 0][+1,+1]
  */
  //Top row
  if(row-1 >= 0){
    if(
      col-1 >= 0 && currentGen[row-1][col-1] ||
      currentGen[row-1][col] ||
      col+1 < colScale && currentGen[row-1][col+1]
      ){
      neighbours++;
    }
  }
  //middle row
  if(currentGen[row][col-1] || currentGen[row][col+1]){
    neighbours++;
  }
  //bottom row
  if(row+1 < rowScale){
    if(currentGen[row+1][col-1] || currentGen[row+1][col]|| currentGen[row+1][col+1]){
      neighbours++;
    }
  }
  return neighbours;
}

void updateGrid(){
  for(int row = 0; row < rowScale; row++){
    for(int col = 0; col< colScale; col++){
      currentGen[row][col] = nextGen[row][col];
    }
  }
}