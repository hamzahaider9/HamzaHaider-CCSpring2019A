  class Puck {
    //parameters used to control various attributes of puck
    // parameters for x and y position of puck
    public float x = width/2;
    public float y = height/2;
    
    //parameter to control speed x-axis and y-axis of puck
    public float xspeed;
    public float yspeed;
    
    //size of puck
    public float r = 12;
    
    // the impact display circle when puck hits paddle
    public float diamHit;
   
   //parameter used to add image to puck 
    PImage puck;
   
    //blank constructor
    public Puck() {
      reset();
    }
  
  //action that takes place when puck hits left paddle
    void left_hit(Paddle p) {
      //testing in terms of y-axis if puck hits left paddle 
      if (y - r < p.y + p.paddle_height/2 && y + r > p.y - p.paddle_height/2 && x - r < p.x_pos + p.paddle_width/2) {
        //testing in terms of x-axis if puck hits left paddle 
        if (x > p.x_pos) {
          //parameters to control rebound attributes of puck
          float diff = y - (p.y - p.paddle_height/2);
          float rad = radians(45);
          float angle = map(diff, 0, p.paddle_height, -rad, rad);
          
          //increasing speed of puck depending upon where paddle hits puck and angle
          xspeed = 15 * cos(angle);
          yspeed = 15 * sin(angle);
          
          //point where puck hits paddle
          x = p.x_pos + p.paddle_width/2 + r;
          
           //impact display in terms of ellipse via randomnly sized ellipse at point of impact
          fill(#A2A9F0);
          diamHit = random(100,180);
          ellipse(x,y,diamHit,diamHit);
          
        }
      }
    }
    //action that takes place when puck hits right paddle
    void right_hit(Paddle p) {
      //testing in terms of y-axis if puck hits right paddle 
      if (y - r < p.y + p.paddle_height/2 && y + r > p.y - p.paddle_height/2 && x + r > p.x_pos - p.paddle_width/2) {
        //testing in terms of x-axis if puck hits left paddle 
        if (x < p.x_pos) {
          //parameters to control rebound attributes of puck
          float diff = y - (p.y - p.paddle_height/2);
          float angle = map(diff, 0, p.paddle_height, radians(225), radians(135));
          
          //increasing speed of puck depending upon where paddle hits puck and angle
          xspeed = 15 * cos(angle);
          yspeed = 15 * sin(angle);
          
          //point where puck hits paddle
          x = p.x_pos - p.paddle_width/2 - r;
          
           //impact display in terms of ellipse via randomnly sized ellipse at point of impact
          fill(#FF0303);
          diamHit = random(100,180);
          ellipse(x,y,diamHit,diamHit);
        }
      }
    }
  
  
  
  //updating speed of puck based on impact 
    void update() {
      x = x + xspeed;
      y = y + yspeed;
    }
  
    //where puck is when game starts
    void reset() {
      //puck starts in middle of screen
      x = width/2;
      y = height/2;
      float angle = random(-PI/4, PI/4);//angle to control random movement of puck
      
      //randomnly assigning speed to puck when game starts 
      xspeed = 5 * cos(angle);
      yspeed = 5 * sin(angle);
  
      //randomnly deciding which direction the puck goes when game starts whether left or right
      if (random(1) < 0.5) {
        xspeed *= -1;
      }
    }
  
  //when puck hits down on screen and making it rebound upwards
    void edges() {
      if (y < 0 || y > height) {
        yspeed *= -1;
      }
  
      //checking if puck misses paddle on right side 
      if (x - r > width) {
        
        //increasing score of person of thanos aka left side player
        leftscore++;
        
        //audio played aka mario point lost audio when a puck misses paddle
        point_lost.play();
        point_lost.amp(0.5);
        point_lost.rate(2); //speed up speed of sound
        
        reset();
      }
      
      //checking if puck misses paddle on left side 
      if (x + r < 0) {      
        //increasing score of person of capt america aka right side player
        rightscore++;
        
        //audio played aka mario point lost audio when a puck misses paddle
        point_lost.play();
        point_lost.amp(0.5);
        point_lost.rate(2); //speed up speed of sound
        
         reset();
        
      }
    }
  
  //displaying puck with image
    void show() {
      
      fill(255);
      //basic puck display
       ellipse(x, y, r*2, r*2);
     
     //adding image on top of pluck
      pushMatrix();
      puck = loadImage("pluck.jpg");
       puck.resize(50,60); //resizing image to ensure it fits on top of puck
       image(puck,x-25,y-30); //making sure image is right on top of puck
        popMatrix();
        
    }
  }
