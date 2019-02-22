  /*

Assignment_2.pde

Author: Hamza Haider

Summary: Q: Either iterate on last week’s motion sketch and tweak it to include at least one method of iteration (for/while loop), and one array, or create a new original sketch that includes the aforementioned.
         Ans: Creation of a drawing board that helps children visualize squares and circles painting them with their mouse. Moroever, the shapes can be rotated and color changed, albeit randomnly, 
         and the size of the shape is dependant upon how fast the mouse moves. This is done to replicate the original drawing experience with a paintbrush.
*/

  
  int numObj = 10;
  color objcolor =  color(200); //color of object drawn
  boolean square=false; // boolean to help change shape of object 
  boolean str = true;
  boolean circle = false;
  boolean trail_Obj = true;
  int rot = 0;     // degree of rotation of object 
  
  int trailObj = 40; //number of inputs stored in the array
  float[] Obj_x = new float[trailObj];
  float[] Obj_y = new float[trailObj]; //arrays to store mouseX and mouseY values
  int scale = 2;
    
    
    void setup() {
    size(1400, 800); //size of screen  
    background(0); //black background
    rectMode(CENTER); //rectangle drawn from middle of coordinates
    }
    
    
   void draw() {
    stroke(150); 
    strokeWeight(3);
    fill(objcolor);
    
    //finding distance between current and previous mouse position to affect size of shape drawn
    float shape_size=dist(mouseX,mouseY,pmouseX,pmouseY);
    
    
    // trailing effect to preview effect on drawing board
    if(trail_Obj == true){
    background(0);// initializing visual attributes of shapes to be drawn
      int currFrame = frameCount % trailObj;
    Obj_x[currFrame] = mouseX;
    Obj_y[currFrame] = mouseY;
  
 
  for(int i =0; i < trailObj; i++){
    int index = (currFrame + i)%trailObj;
    fill(random(50, 255), random(45, 255), random(95, 255));
    ellipse(Obj_x[index], Obj_y[index], i*scale, i*scale);
    
  }
    }
    
    
    // make circles
    else if(circle == true){
    fill(objcolor,frameCount%255);
    if (mousePressed) {
    ellipse(mouseX, mouseY, (1/shape_size)*150, 150*(1/shape_size));
    }
    

    
    }
    
    //make squares
    else if(square == true) {
    
     // pushMatrix utilized to avoid overwriting of screen coordinates and eventually overwrite rect coordinates 
    pushMatrix();
    fill(objcolor,frameCount%255); //framecount to alter transparency of objects
    
    //rotation of the ellipse
    translate(mouseX, mouseY); 
    rotate(rot);
    
    if(mousePressed){
    rect(0,0,(1/shape_size)*150, 150*(1/shape_size));
    }
    
    popMatrix();
    
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
    
    //create trailing effect
    if(key == 'a'){
    trail_Obj = true;
    square = false;
    circle = false;
    }
    
    //change shape to square
    if(key == 's'){
     background(0);
    square = true; 
    circle = false;
    trail_Obj = false;  
  }
    
    // change shape to circle
    if(key == 'd'){
    background(0);  
    circle = true;
    square = false;
    trail_Obj = false;
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
