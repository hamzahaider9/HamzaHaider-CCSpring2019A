/*
Particle.pde
Author: Hamza Haider
Summary: A particle class that gives every particle a position, velocity, acceleration, lifespan and color using Vector2D.
*/

class Particle{
  
  /* fields */
  //position velocity acceleration of the particle
  public Vector2D position = new Vector2D(0, 0);
  public Vector2D velocity = new Vector2D(random(-0.5, 0.5), random(-0.5, 0.5));
  public Vector2D acceleration = new Vector2D(random(-0.04, 0.04), random(-0.04, 0.04));
  
  public float radius = random(5, 30); //radius of the particles
  public float lifespan = 255; //lifespan of the particle tied to its alpha value (transparency)
  
  
  //constructors to initialize the particle
  
  //blank constructor
  public Particle(){
    
  }
  
  //constructor that takes a position vector
  public Particle(Vector2D origin){
    this.position.x = origin.x;
    this.position.y = origin.y;
  }
  
  /* non-static methods */
  
  //method to move the particle
  void move(){
    velocity.add(acceleration);
    position.add(velocity);
    lifespan -= 3.0; //tweak the alpha value
  }
  
  //method to draw the particle
  void show(float colour1, float colour2, float colour3){
    fill(colour1,colour2,colour3, lifespan);
    ellipse(position.x, position.y, radius, radius);
  }
  
  //method to check whether the particle is dead
  boolean isDead(){
    return (lifespan < 0.0);
  }
}
