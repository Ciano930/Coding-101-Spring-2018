//Array 2D
boolean[][] liveOrDead;
int scale;
int colScale;
int rowScale;

void setup(){
  size(1000,500);
  scale = 5;
  rowScale = width/scale;
  colScale = height/scale;
  liveOrDead = new boolean[rowScale][colScale];
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
        liveOrDead[i][j] = true;//sets the bool in liveOrDead to alive
      } else if(randomNum == 0){
        //DEAD
        liveOrDead[i][j] = false;//sets the bool in liveOrDead to dead
      }
    }
  }
}

void drawGrid(){
  for(int i =0; i < rowScale; i++){
    for(int j =0; j < colScale; j++){
      if(liveOrDead[i][j])//If liveOrDead = true
      {
        fill(255);//White
      } else {
        fill(0);//Black
      }
      
      rect(i*scale, j*scale, scale, scale);
    }
  }
}