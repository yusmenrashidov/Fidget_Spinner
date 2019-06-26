float angle;
float aVelocity;
float aAcceleration;
boolean maxSpeedReached, isStarted;
PImage spinnerImage;
PFont titleFont; 
PFont footerFont;

void setup() {
  size(550,550);
  
  //rotation properties
  angle = 0;
  aVelocity = 0;
  aAcceleration = 0.005;
  maxSpeedReached = false;
  
  //spinner image
  spinnerImage = loadImage("s-l225.jpg");
  
  //fonts
  titleFont = loadFont("Spinner_Title_Font.vlw");  
  footerFont = loadFont("Footer_Font.vlw");
  
  //start rotating check
  isStarted = false;
  
  // before starting to spin
  background(255);
  
   //footer text
  textFont(footerFont);
  textSize(9);
  fill(#000000);
  text("©2017 UKTC Pravec. All rights reserved. Created and designed by Y. Rashidov.", 75, 540);
  
    //upper label
    textSize(30);
    fill(#FF1C1C);
    textFont(titleFont);
    text("Fidget Spinner", 140,80);
  
  //spinner
  image(spinnerImage, 170,145);
  
}
 
void draw() {
 //when the spinner is not spinning
  if(isStarted== false) {
  //label to say what to do to the client
  textFont(titleFont);
  textSize(20);
  fill(#FF1C1C);
  text("Drag the mouse to spinn this idiotic thing", 110, 120);
  }

 
  if(isStarted==true){
   
    //setting background properties
   background(255);
   fill(175);
   stroke(0);
    
  //rotating
  pushMatrix();
  rectMode(CENTER);
  imageMode(CORNER);
  translate(width/2,height/2);
  rotate(angle);
  
  
  //spinner
  image(spinnerImage, -112.5,-112.5);
   popMatrix();
  
  //upper label
  textSize(30);
  fill(#FF1C1C);
  textFont(titleFont);
  text("Fidget Spinner", 140,80);
  
  //footer text
  textFont(footerFont);
  textSize(9);
  fill(#000000);
  text("©2017 All rights reserved. Created and designed by Y. Rashidov.", 75, 540);
  
  //checking about max speed is reached
  if(angle >=200){
    maxSpeedReached = true;
  }
  
  //deaccelerating spinner when max speed is reached
  if(maxSpeedReached == true) aAcceleration = -0.001;
 
 //changing rotation speed
   if(aVelocity>=0){
  aVelocity+=aAcceleration;
  angle += aVelocity;
 }
   
 //interacting with client
 textSize(13);
 text("Click to stop and try again", 180, 460);
   }
 }
 
 void mouseClicked(){
    setup();
 }
 

 void mouseDragged(){
     if(isStarted == false){
     isStarted = true;
   }
 
  }
