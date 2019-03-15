/*
Assignment6.pde
Author: Hamza Haider
Summary: Create a sketch that successfully showcases your own particle system. Make sure that the particle system somehow reacts to user input.

*/



//define our particle systems
ParticleSystem circular; //this particle system will have its particles arranged in a circle around its origin
ParticleSystem notCircular; //this particle system will have its particles spawn on its origin

//main parameter for the parametric path that the circular particles will spawn along
float maxAngle = 0.0; //starts at 0;

float radius = 400; //the radius of the parametric path
float x = radius * cos(maxAngle)*cos(maxAngle)*cos(maxAngle); //x coord based on polar coordinates
  float y = radius * sin(maxAngle)*sin(maxAngle)*sin(maxAngle); //y coord based on polar coordinates


// declaring variables to toggle between different cases.
static final int NONE = 0;
static final int astroid = 1;
static final int Archimede_Spiral = 2;
static final int Infinity_Sign = 3;

// the myDrawMode variable will store the current draw mode
int myDrawMode = NONE;

void setup(){
  size(1920,1080);
  background(0);
  
  //set origin to the center of the canvas
  Vector2D origin = new Vector2D(width/2, height/2);
  
  circular = new ParticleSystem(origin); //new particle system at the origin
  
}

void draw(){
  background(0); //refresh bg
  text("dcdc",40,40);
  //trace the circular path using the parametric equation
   switch(myDrawMode) {
     
     // drawing the astroid shape
      case(astroid):
      // drawing the x- axis of the astroid shape
      x = radius * cos(maxAngle)*cos(maxAngle)*cos(maxAngle);
      
      // drawing the y-axis of the astroid shape
      y = radius * sin(maxAngle)*sin(maxAngle)*sin(maxAngle);
      break;
      
      // drawing the Archimede Spiral
      case(Archimede_Spiral):
      // drawing the x-axis of the Archimede Spiral
       x = maxAngle * cos(maxAngle);
       
       // drawing the y-axis of the Archimede Spiral 
       y = maxAngle * sin(maxAngle);
       
      break;
      
      // drawing the Infinity Sign
      case(Infinity_Sign):
      // drawing the x-axis of the Infinity Sign
      x = sin(maxAngle / 10) * 100 + sin(maxAngle / 8) * 20;
      // drawing the y-axis of the Infinity Sign
      y = cos(maxAngle / 20) * 200 + cos(maxAngle / 12) * 10;
      break;
    }
  
    
  Vector2D particleLocation = new Vector2D(x, y); //new vector to the computed x,y coordinates
    
  circular.addParticle(particleLocation);
  
  
  maxAngle += 0.5; //maxAngle to control movement of particle system
  
  // run particle system
  circular.run();
  
  println(radius);
}

void keyPressed(){
        //increasing radius of shapes
       if(keyCode == RIGHT && radius < 600 ){ //decrease x dimension by one
        radius += 10;
      }
      //decreasing radius of shapes
      else if(keyCode == LEFT && radius > 200){ //decrease x dimension by one
        radius -=10;
      }
      
      //switching between different shapes
        switch(key) {
    case('0'): myDrawMode = NONE; break;
    case('1'): myDrawMode = astroid; break;
    case('2'): myDrawMode = Archimede_Spiral; break;
    case('3'): myDrawMode = Infinity_Sign; break;
    case('4'): background(0); break;
  }
        
        
      
      
      
      
      
      }
