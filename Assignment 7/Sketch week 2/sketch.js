/*
Assignment_2.pde
Author: Hamza Haider
Summary: Solving Sol #16 "Bands of lines 12 inches (30 cm) wide, in three directions (vertical, horizontal, diagonal right) intersecting."
*/


    var num_linesX = 30; //number of vertical lines
    var num_linesY = 30; //number of horizontal lines
    var num_linesZ = 30; // number of diagonal lines
    
    function setup() {
   createCanvas(600, 600); //size of screen  
    background(200,30); // initializing background
    
    
    var xStep = width/num_linesX; // space between lines
  
  //initializing visual attributes of the lines
  strokeWeight(10); 
  stroke(15,80);
  
  //draw the horizontal lines
  for(var x = 0; x < width; x += xStep){
    line(x, height/8, x, height/1.2);
  }
  
 //rotating the screen 
  translate(width,height/1000);
  rotate(PI/2);
  //drawing vertical lines
  for(var x = 0; x < width; x += xStep){
    line(x, height/8, x, height/1.2);
  } 
  
  //rotating the screen 
  translate(1.2*width,height/2);
  rotate(PI/4+PI/2);
  
  // drawing diagonal lines
  for(var x = 0; x < width; x += xStep){
    line(x, height/8, x, height/1.2);
  } 
    }
    
    function draw() {
      
      
      
      
    }
    