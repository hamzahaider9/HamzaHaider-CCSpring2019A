  /*

Assignment_2.pde

Author: Hamza Haider

Summary: Q: create a Processing sketch that showcases object motion within the bounds of the canvas and somehow incorporates user input
         Ans: Creation of a drawing board that helps children visualize squares and circles painting them with their mouse. Moroever, the shapes can be rotated and color changed, albeit randomnly, 
         and the size of the shape is dependant upon how fast the mouse moves. This is done to replicate the original drawing experience with a paintbrush.
*/

  
  
  color objcolor = color(255); //color of object drawn
  boolean square=false; // boolean to help change shape of object 
  boolean str = true;
  int rot = 0;     // degree of rotation of object 
  
    
    
    void setup() {
    size(1400, 800); //size of screen  
    background(0); //black background
    rectMode(CENTER); //rectangle drawn from middle of coordinates
    }
    
    void draw() {
     // initializing visual attributes of shapes to be drawn
    stroke(150); 
    strokeWeight(3);
    fill(objcolor);
    
    //finding distance between current and previous mouse position to affect size of shaoe drawn
    float shape_size=dist(mouseX,mouseY,pmouseX,pmouseY);
    
  
    
    // make circles
    if(square == false){
   
    
    fill(objcolor,frameCount+25);
    
    
    if (mousePressed) {
    ellipse(mouseX, mouseY, (1/shape_size)*150, 150*(1/shape_size));
    }
    

    
    }
    
    //make squares
    else {
    
     // pushMatrix utilized to avoid overwriting of screen coordinates and eventually overwrite rect coordinates 
    pushMatrix();
    fill(objcolor,frameCount+25); //framecount to alter transparency of objects
    
    //rotation of the ellipse
    translate(mouseX, mouseY); 
    rotate(rot);
    
    if(mousePressed){
    rect(0,0,(1/shape_size)*100, 100*(1/shape_size));
    }
    
    popMatrix();
    
    }
    
    // frameCount initialization to zero 
    if (frameCount==255) {
    frameCount =0;
    }
    
    }
    
    
    void keyPressed() {
    //reset drawing
      if (key== 'r') {
    background(0);
    }
    
    // change object color at random
    if (key == 'c') {
    objcolor = color(random(50, 255), random(45, 255), random(95, 255));
    }
    
    //change shape to square
    if(key == 's'){
    square = true; 
    }
    
    // change shape to circle
    if(key == 'd'){
    square = false;
    }
    
    // rotate shape by 30 degrees clockwise
    if(key == 'f'){
    rot+= 30;
    } 
    
    // rotate shape by 30 degrees anti clockwise
    if(key == 'g'){
    rot-=30;
    }
    }
