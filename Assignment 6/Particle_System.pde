/*
ParticleSystem.pde
Author: Hamza Haider
Summary: A class to create multiple systems of particles.
Each ParticleSystem object has the capacity to:
  (1)Display the particles
  (2)Change position of particles
  (3)Remove dead particle 
  (4)Add particle 
*/

class ParticleSystem{
  
  /* fields */
  ArrayList<Particle> particles = new ArrayList<Particle>();  //the particles of this system
  Vector2D origin = new Vector2D(0, 0);  //the position that all the particles come from
  
  /* constructors */
  
  //blank constructor
  public ParticleSystem(){
  }
  
  public ParticleSystem(Vector2D o){
    origin.x = o.x;
    origin.y = o.y;
  }

  
  //constructor that positions the particle system based on two floats
  public ParticleSystem(float x, float y){
    origin.x = x;
    origin.y = y;
  }
  
  /* methods */
  
  //method to make each particle in the arraylist show and move itself, and then remove any dead particles (i.e. run the particle system)
  public void run(){
    //loop through the particle system
    pushMatrix();
    translate(origin.x, origin.y);
    for(int i = 0; i < particles.size(); i++){
      Particle p = particles.get(i); //store the current particle
      p.show(random(70,200),random(70,200),random(70,200)); //show it
      p.move(); //move it
      
      //remove particles if dead
      if(p.isDead()){
        particles.remove(i);
      }
    }
    popMatrix();
  }
  
  //method to add a particle onto the origin of the particle system
  
  public void addParticle(){
    particles.add(new Particle());
  }
  
  //overload the addParticle method to add a particle at a position x,y relative to the origin of the system
  public void addParticle(Vector2D location){
    particles.add(new Particle(location)); //add the particle to the location relative to the origin
  }
  
}
