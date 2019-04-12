/*
Assignment7.pde
Author: Hamza Haider
Summary: Create a sketch, in p5.js, that successfully showcases your own particle system. Make sure that the particle system somehow reacts to user input.

*/


// global variables
var circular;
var particles = [];
var maxAngle=0, radius, radius1=100,lifespan,velocity,acceleration,position,x,y,particleLocation ;
var NONE =0, astroid = 4,Archimede_Spiral = 2,Infinity_Sign = 3, myDrawMode = NONE;// declaring variables to toggle between different cases.


function setup(){
createCanvas(600,600);

 x = radius1 * cos(maxAngle)*cos(maxAngle)*cos(maxAngle);
 y = radius1 * sin(maxAngle)*sin(maxAngle)*sin(maxAngle);

 circular = new ParticleSystem(createVector(50,50)); //new particle system at the (50,50)

}

function draw(){
  background(0); //refresh bg

  //trace the circular path using the parametric equation
  switch(myDrawMode) {
     
    // drawing the astroid shape
     case(astroid):
     // drawing the x- axis of the astroid shape
     x = radius1 * cos(maxAngle)*cos(maxAngle)*cos(maxAngle);
     
     // drawing the y-axis of the astroid shape
     y = radius1 * sin(maxAngle)*sin(maxAngle)*sin(maxAngle);
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

  maxAngle += 0.5; //maxAngle to control movement of particle system
  
  
  particleLocation = createVector(x,y); //new vector to the computed x,y coordinates

  circular.addParticle(particleLocation);
  circular.run(); // run particle system
  
  console.log(radius1);
}

function keyPressed(){
  //increasing radius of shapes
 if(keyCode === RIGHT_ARROW && radius1 < 400 ){ //decrease x dimension by one
  radius1 += 10;
}
//decreasing radius of shapes
else if(keyCode === LEFT_ARROW && radius1 > 50){ //decrease x dimension by one
  radius1 -=10;
}

//switching between different shapes
  switch(key) {
case('0'): myDrawMode = NONE; break;
case('1'): myDrawMode = astroid; break;
case('2'): myDrawMode = Archimede_Spiral; break;
case('3'): myDrawMode = Infinity_Sign; break;
case('4'): background(0); break;
}}

// Particle class summary: A particle class that gives every particle a position, velocity, acceleration, lifespan and color
class Particle {

  constructor(plane){
    /* fields */
    
    this.position = createVector(0,0);
    this.position.x = plane.x;
    this.position.y = plane.y;
    this.velocity = createVector(random(-0.5, 0.5), random(-0.5, 0.5));
    this.acceleration = createVector(random(-0.04, 0.04), random(-0.04, 0.04));
    this.radius = random(5,10);
    this.lifespan = 255;
    
  }
  //method to move the particle
  move(){ 
    this.velocity.add(this.acceleration);
    this.position.add(this.velocity);
    this.lifespan -= 3.0;
  }
  //method to draw the particle

  show(){ 
    
    fill(random(70,200),random(70,200),random(70,200), this.lifespan);
    circle(this.position.x, this.position.y, this.radius);
    
  }
//method to check whether the particle is dead
  isDead(){ 
    
    return (this.lifespan < 0.0);
  }
}

/* Particle System class  A class to create multiple systems of particles.
Each ParticleSystem object has the capacity to:
(1)Display the particles
(2)Change position of particles
(3)Remove dead particle 
(4)Add particle */

class ParticleSystem {

  constructor(parameter) {
    /* fields */
    this.position = createVector(0,0);
    this.position=parameter;



  }
//method to add a particle onto the location of the particle system
  addParticle(location){
    
    particles.push(new Particle(location));
  }
  //method to make each particle in the arraylist show and move itself, and then remove any dead particles (i.e. run the particle system)
  run(){
    
    //loop through the particle system
    for (let i = 0; i < particles.length; i++){
      
      push();
      
    translate(width/2.5, height/2);
      let particle = particles[i];
      particle.show();
      particle.move();
      
      pop();
      // remove dead particles
      if (particle.isDead()){
        particles.splice(i);
      }
    }
  }
}




