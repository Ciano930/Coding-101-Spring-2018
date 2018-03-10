//Array 2D
boolean[][] liveOrDead;
int scale;
int colScale;
int rowScale;

void setup(){
  size(500,400);
  scale = 5;
  rowScale = width/scale;
  colScale = height/scale;
  
  liveOrDead = new boolean[rowScale][colScale];
  
}

void randomizeGrid(){
  for(int i = 0; i < rowScale; i++){
    for(int j = 0; j < colScale; j++){
    }
  }
}