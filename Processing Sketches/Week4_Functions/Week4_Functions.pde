
//These are the global variables X and Y
int centerX;
int centerY;

//this is the setup method
void setup(){
  //this is the screen size
  size(800, 600);
  centerX= width/2;
  centerY= height/2;
  
  //sets the background colour to grey
  background(100,100,100);
}

//our draw function
void draw(){
  //This code clears the screen to a grey colour
  if(keyPressed){
    background(100,100,100);
  }
}

//when the mouse is pressed and released this runs
void mouseClicked(){
  //here we call drawBear. We call it to position MouseX and Y and with colours MouseX and Y
  drawBear(mouseX, mouseY, mouseX, mouseY);
}

//This is our unique function that draws our bear
void drawBear(int posX, int posY, int colour1, int colour2){
  
  //my bears colour
  fill(colour1, colour2, colour2);
  
  //My bear's ears
  ellipse(posX-100, posY-90, 200, 150);
  ellipse(posX+100, posY-90, 200, 150);
  
  //My bear's head
  ellipse(posX, posY, 250, 300);
  
  //my bear's eyes
  fill(255);
  ellipse(posX-50, posY-30, 60, 60);
  ellipse(posX+50, posY-30, 60, 60);
  fill(0);
  ellipse(posX-50, posY-30, 30, 30);
  ellipse(posX+50, posY-30, 30, 30);
  
  //my bear's nose
  fill(colour1-20,colour2-50,colour2);
  ellipse(posX, posY+60, 200, 150);
  fill(0);
  ellipse(posX, posY+30, 50, 50);
  
  //My bear's mouth
  fill(200,0,0);
  rect(posX-50, posY+80, 100, 30);
}