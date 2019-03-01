

float angle = 0.0; //angle by which to rotate every frame
float scaleFactor = 1.0; //current scale of the rectangles
float scaleStep = 0.1; //amount by which to increment scaleFactor

// parameters to control 2 sin waves
float startAngle = 0;
float angleVel = 0.1;
float angle2 =0;

//lerp parameters
float currX = 0.0; //x position of the rectangle
float lerpX = 0.0;
float xStep = 0.009;
float x1;
float x2;

//lerpColor parameters
color c1;
color c2;

void setup(){
  //set canvas parameters
  size(1920, 1080);
  background(255);
  noStroke();
  rectMode(CENTER);
  
  //setting up HSB
  colorMode(HSB, 360, 100, 100);
  //seting up lerpcolor
  x1 = 25;
  x2 = 173;

  //choose two complementary colors
  c1 = color(random(360), 71, 95);
  c2 = color((hue(c1) + 180)%360, 71, 95);
}


void draw(){
  background(0);
  //Before we translate to our cursor, let's draw some background rectangles that will rotate independently
  fill(360 - (angle%360), 100, 100); //choose inverse color for these
  stroke(360 - (angle%360), 100, 100);
  
  
  // drawing sin waves
  
  startAngle += 0.01;
  float angle1 = startAngle;
  
 //drawing upper sin wave
   for (int x = 0; x <= width; x += 24) {
    float y = map(sin(angle1),-1,1,0,height);
    stroke(2);  
    ellipse(x-24,y/2-24,48,48);
    angle1 += angleVel;
  }
  
  // drawing lower sin wave
  pushMatrix();
  translate(0,height/2);
  fill(angle % 360, 100, 100); //choose a color by mapping the angle of rotation to a position on the color wheel
  stroke(360 - (angle%360), 100, 100);
   for (int x = 0; x <= width; x += 24) {
    float y = map(sin(angle1),-1,1,0,height);
    stroke(0); 
    ellipse(x-24,y/2-24,48,48);
    angle1 += angleVel;
  }
  popMatrix();
  
  // drawing middle circle with rotating circles
  pushMatrix();
  
  stroke(0);
  rectMode(CENTER);
  translate(width/2, height/2);
  rotate(angle2);
  
  fill(lerpColor(c1, c2, currX/(x2 - x1)));
  
  //outer boundary of circle
  ellipse(0,0,125,125);
  stroke(0);
  strokeWeight(2);
  fill(255);
  
  //line connecting smaller circles
  line(-50, 0, 50, 0);
  
  // drawing smaller circles and using lerpcolor to color them 
  fill(lerpColor(c2, c1, currX/(x2 - x1)));
  ellipse(50, 0, 16, 16);
  ellipse(-50, 0, 16, 16);
  angle2 += 0.05;
  popMatrix();
  
   angle += 2.0; //increment the angle
  
  //changing lerp Color
  lerpX += xStep*.1; 
  currX = lerp(x1, x2, lerpX);

}
