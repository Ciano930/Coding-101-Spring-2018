int scale;
int colScale;
int rowScale;
int speed;
int frame;
int neighbors;
int gridNext[][];
int gridCurrent[][];

//Our laws
  //1. if Alive and Neighbours > 3, Kill node
  //2. if Alive and Neighbours > 1, Node ages
  //3. if Alive and Neighbours < 1, Kill node
  //4. if Dead and Neighbours = 3, Node is born
  
void setup(){
  size(1000, 1000);
  scale =10;
  rowScale = width/scale;
  colScale = height/scale;
  
  //Now lets set up our grids!
  gridCurrent = new int[rowScale][colScale];
  gridNext = new int[rowScale][colScale];
  
  speed = 10;//This is one update a second
  frame = 0;
  
  
  randomiseGrid();
  drawGrid();
}

void draw(){
  //first we update the frame
  /*frame++;
  //For here lets create a speed system
  if(frame == speed)
  {*/
    print("Frame Update\n");
    //first lets reset frame to 0
    frame = 0;
    
    calculateGrid();
    drawGrid();
  /*}*/
}

void calculateGrid(){
  for(int i = 0; i < rowScale; i++){
    for(int j = 0; j < colScale; j++){
      //First we reset the neighbors to 0
      neighbors = 0;
      //Top Left grid[i-1][j-1]
      if(i > 0 && j > 0 && gridCurrent[i-1][j-1] > 0){
        neighbors++;
      }
      //Top Middle grid[i-1][j]
      if(i > 0 && gridCurrent[i-1][j] > 0){
        neighbors++;
      }   
      //Top Right grid[i-1][j+1]
      if(i > 0 && j < colScale-1 && gridCurrent[i-1][j+1] > 0){
        neighbors++;
      }
      //Mid Left grid[i][j-1]
      if(j > 0 && gridCurrent[i][j-1] > 0){
        neighbors++;
      }
      //Mid Right grid[i][j+1]
      if(j < colScale-1 && gridCurrent[i][j+1] > 0){
        neighbors++;
      }
      //Bottom Left grid[i+1][j-1]
      if(i < rowScale-1 && j > 0 && gridCurrent[i+1][j-1] > 0){
        neighbors++;
      }
      //Bottom Middle grid[i+1][j]
      if(i < rowScale-1 && gridCurrent[i+1][j] > 0){
        neighbors++;
      }
      //Bottom Right grid[i+1][j+1]
      if(i < rowScale-1 && j < colScale-1 && gridCurrent[i+1][j+1] > 0){
        neighbors++;
      }
      
      //Now that we have all the neighbors counted lets check see what happens!
      //Rules that kill cells. If less than 2 neighbors kill cell. If greater than 3 kill cell
      if(gridCurrent[i][j] > 0 && neighbors < 2 || gridCurrent[i][j] > 0 && neighbors > 3){
        gridNext[i][j] = 0;
      } else if(gridCurrent[i][j] < 1 && neighbors == 3){
        gridNext[i][j] = 1;
      } else if(gridCurrent[i][j] > 0){
        //gridNext[i][j] = (gridCurrent[i][j]+20);//Now the cell grows older
      //Rules that generate new cells
      }
    }
  }
  //Now that everything has been calculated we can make the currentGrid our new Grid
  gridCurrent = gridNext;
}

void drawGrid(){
  for(int i = 0; i < rowScale; i++){
    for(int j = 0; j < colScale; j++){
      //Now we can draw our square!
      if(gridCurrent[i][j] == 0)
      {
        fill(0);
      }else{
        fill(255);
      }
      rect(scale*i, scale*j, rowScale, colScale);
    }
  }
}

void randomiseGrid(){
  for(int i = 0; i < rowScale; i++){
    for(int j = 0; j < colScale; j++){
      gridCurrent[i][j] = int(random(0,2));
      //print("random = " + gridCurrent[i][j]);
    }
  }
}