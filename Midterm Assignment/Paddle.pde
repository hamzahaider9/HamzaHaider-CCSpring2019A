  class Paddle {
    //initializing variables to be used later
    //initial position in x and y-axis of paddle
    public float x_pos; 
    public float y = height/2;
    
    //width and height of paddle to be used in game 
    public float paddle_width = 42; 
    public float paddle_height = 58;
    
    //variable to monitor change in y-axis of paddle  
    public float ychange = 0;
    
    //loading image onto paddle
    public PImage r_paddle;
    public PImage l_paddle;
  
    //blank constructor
    public Paddle(){
    }
  
    // constructor that creates paddles
    public Paddle(boolean left) {
      if (left) {
        x_pos = paddle_width;
      } 
      else {
        x_pos = width - paddle_width;
      }
    }
  
    // move paddle up and down 
    void update() {
      y += ychange;
      y = constrain(y, paddle_height/2, height-paddle_height/2); //stop paddle from moving out of screen
    }
  
  
  //speed of change in position of paddle
    void move(float steps) {
      ychange = steps;
    }
  
  //display right paddle
    void showRight(String g) {
      fill(255);
      rectMode(CENTER);
      rect(x_pos, y, paddle_width, paddle_height);
     
     //loading image for right paddle
      r_paddle = loadImage(g,"jpg");
      
      //resizing and displaying image
       r_paddle.resize(50,60);
       image(r_paddle,x_pos-20,y-30);
    }
    
    //display left paddle
    void showLeft(String g){
      fill(255);
      rectMode(CENTER);
      rect(x_pos, y, paddle_width, paddle_height);
      
      //loading image for left paddle
      l_paddle = loadImage(g,"jpg");
      
      //resizing and displaying image
       l_paddle.resize(50,60);
       image(l_paddle,x_pos-20,y-30);   
    }
  }
