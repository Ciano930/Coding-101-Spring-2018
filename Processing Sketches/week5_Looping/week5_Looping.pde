
void setup(){
  size(1000,1000);
  int isHappy = 1;
  
  for(int i = 50; i < height; i=i+100)
  {
    //Debug
    print(" \nI'm in I: " +i);
    for(int j =50; j < width; j=j+100){
      //Debug
      print(" \nI'm in J: " +j);
      drawFace(j, i, isHappy);
      
      //Check he is not Happy or Sad
      isHappy++;
      if(isHappy > 4){
        isHappy = 1;
      }
    }
  }
}

void drawFace(int x, int y, int happy){
  ellipse(x,y,100,100);
  ellipse(x-20, y-20, 10,10);
  ellipse(x+20,y-20,10,10);
  line(x-20, y+20, x+20, y+20);
  if(happy == 1){
    //smile code
    line(x-20, y+20, x-25, y+15);
    line(x+20, y+20, x+25, y+15);
  } else if(happy == 2){
    //sadface
    line(x-20, y+20, x-25, y+25);
    line(x+20, y+20, x+25, y+25);
    //tear
    ellipse(x-20, y-10, 5,7.5);
    ellipse(x+20, y+10, 5,7.5);
  } else if(happy == 3){
    //No feel...
  }else{
    //He ded.....
    ellipse(x,y,100,100);
    line(x-10, y+20, x+10, y+20);
    line(x+10, y-20, x+20, y-10);
    line(x-10, y-10, x-20, y-20);
    line(x+20, y-20, x+10, y-10);
    line(x-10, y-20, x-20, y-10);
  }
}