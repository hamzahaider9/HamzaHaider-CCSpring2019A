/*
Vector2D.pde
Author: Hamza Haider
Summary: A basic vector 2D class to do mathematical functions for our particle system particles.
*/

static class Vector2D{
  /* fields */
  public float x = 0;
  public float y = 0;
  
  /* constructors */
  
  //blank constructor
  public Vector2D(){
    
  }
  
  //constructor with position vector
  public Vector2D(float x, float y){
    this.x = x;
    this.y = y;
  }
  
  /* non-static methods: usable only by objects of the class */
  
  //Addition of vectors
  public void add(Vector2D vector){
    this.x += vector.x;
    this.y += vector.y;
  }
  
  //subtraction of two vectors
  public void sub(Vector2D vector){
    this.x -= vector.x;
    this.y -= vector.y;
  }
  
  //multiplication of vector with a number
  public void mult(float number){
    this.x *= number;
    this.y *= number;
  }
  
  /* static methods: usable without creating an object of the class, but also usable by objects of the class */
  
  //Vector result = vector_1 + vector_2
  public Vector2D add(Vector2D vector_1, Vector2D vector_2){
    Vector2D result = new Vector2D(vector_1.x + vector_2.x,vector_1.y + vector_2.y);
    return result;
  }
  
  //Vector result = vector_1 - vector_2
  public Vector2D sub(Vector2D vector_1, Vector2D vector_2){
    Vector2D result = new Vector2D(vector_1.x - vector_2.x, vector_1.y - vector_2.y);
    return result;
  }
  
  //Vector result = vector_1 * number
  public Vector2D mult(Vector2D vector_1, float number){
    Vector2D result = new Vector2D(vector_1.x * number, vector_1.y * number);
    return result;
  }


  //Vector result = vector_1 / number
  public Vector2D div(Vector2D vector_1, float number){
    Vector2D result = new Vector2D(vector_1.x / number, vector_1.y / number);
    return result;
  }
}


  
