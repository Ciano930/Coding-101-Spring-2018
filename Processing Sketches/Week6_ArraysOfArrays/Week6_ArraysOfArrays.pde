
int gridScale;
int[][] grid;
int gridRow;
int gridCol;

void setup(){ 
  gridScale=10;
  size(500,500);
  
  gridRow = width/gridScale;
  gridCol = height/gridScale;
  grid = new int[gridRow][gridCol];
}

void draw(){  
  for(int i = 0; i < gridRow * gridScale; i=i+gridScale){
    for(int j = 0; j < gridCol * gridScale; j=j+gridScale){
      //Now we can draw a rectangle!
      fill(i,j,0);
      rect(i, j, gridScale, gridScale);
    }
  } 
}