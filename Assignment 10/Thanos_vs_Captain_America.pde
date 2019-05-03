      /*
      Assignment 10
      Thanos_vs_Captain America.pde
      Author: Hamza Haider
      
      Summary: The main focus of the assignment was to pick a multimedia category (image, sound, or video) and create a sketch that uses it. For extra credit, pick another category and create a second sketch, or incorporate a second category in your first sketch.
      
      */
      
      
      //importing the sound library for processing
      import processing.sound.*;
      
      //parameters used while adding images to the sketch
      PImage wallpaper; //background for normal gameplay
      PImage menuScreen; //bacground for menu screen
      
      //text to be displayed at different stages of the game. \n is used for a new line.
      String header = "Thanos vs Captain America"; //main title
      String end = "GAME OVER"; // to be displayed when one player wins
      String Thanos_win = "Thanos has won. \n Half of the Universe's population has been killed. \n Click anywhere to return to the Main Menu."; // when thanos wins
      String cam_win = "Captain America has won. \n The Universe's population has been saved. \n Click anywhere to return to the Main Menu."; // when captain america wins
      String[] body; // text to be displayed for game instructions
      
      // different fonts introduction to make the text visually appealing
      PFont header_font; 
      PFont body_font;
      
      //defining our puck and two paddles for the game
      Puck puck;
      Paddle left;
      Paddle right;
      
      //colors to be used for coloring text and score displayed.
      float col,col2,col3;
      
      //introducing soundfiles to be played in-game
      SoundFile background_music; // played all the time. avengers theme. 
      SoundFile point_lost; // when a player loses a point.
      
     
      boolean gamePlay=false; // to trigger display of game
      boolean menuPlay=true; // to trigger display of menu
      
      //keeping count of scores of both players
      int leftscore = 0; 
      int rightscore = 0;
      
      
      void setup() {
        size(1200, 800); //screen size
        
        //loading background images 
        menuScreen = loadImage("menuScreen.jpg");  
        wallpaper = loadImage("wallpaper.jpg");
        
        // resizing image for visual aesthetics and so it doesnt interfere with gameplay
        wallpaper.resize(1440, 800);
      
        //Introducing fonts
        header_font = createFont("Comic Sans MS",80);
        body_font = createFont("Comic Sans MS",30);
        
        // loading text from an external .txt file
        body = loadStrings("body.txt");
        
        // loading different sound files for different scenarios
        point_lost = new SoundFile(this,"point_lost.mp3"); //when point lost
        background_music = new SoundFile(this, "music.mp3"); //always playing in background
        
        //changing the soundfile being played
        background_music.amp(0.3); // decreasing amplitude of soundfile
        background_music.jump(1.1); //to start file form 1.1 seconds.
        background_music.play(); //playing soundfile
         
        //initializing playing attributes like puck and paddle for both players
        puck = new Puck();
        left = new Paddle(true);
        right = new Paddle(false);  
      }
      
      
      void draw() {
        //tracking mous position
        println(mouseX,mouseY);
        
        // displaying menu
        if(gamePlay ==false && menuPlay == true){
          background(0);
          
          //displaying menuscreen with background positioned optimally
          pushMatrix();
          translate(40,0); //changing origin for image
          image(menuScreen,width/4,0); //displaying image
          popMatrix();
          
          
          //displaying text for game rules and title
          body();
          Header();
          
          
          // to start game if clicked on the green line.
          if(mousePressed){
          if(mouseX>0 && mouseX < 270){
          if(mouseY > 490 && mouseY < 510){ 
          gamePlay = true;
          menuPlay = false;
        }
      }
          } 
        }
        
        //start game    
        if(gamePlay == true && menuPlay == false){
        image(wallpaper, 0, 0); //display background for gameplay  
      
        
        puck.right_hit(right); //rebound when puck hits right paddle
        puck.left_hit(left); //rebound when puck hits left paddle
      
        //displaying images for both paddles
        left.showLeft("thanos.jpg"); // displaying thanos image on left paddle
        right.showRight("c_america.jpg");  //displaying captain america image on right paddle
        
        // to allow movement of paddles in y-axis. more detailed info in class paddle
        left.update();
        right.update();
      
        //movement of puck. more detailed info in class puck
        puck.update();
        puck.edges();
        
        //display puck. most important function in whole sketch
        puck.show();
      
        //color and display scores in gameplay
        fill(#A2A9F0);
        textSize(50);
        text(leftscore, 20, 50); //score for Thanos
        
        fill(#FF0303);
        text(rightscore, width-64, 50); //score for Captain America
        
        //terminate gameplay if one player scores 3 points
        if(leftscore==3 || rightscore == 3){
          gamePlay = false;
          menuPlay = false;
        }
        } 
        
        //show results when gameplay ends and option to restart game
        if(menuPlay == false && gamePlay == false){
          background(0); //background
          
          //attributes for text display for game over message
          textFont(header_font);
          textAlign(CENTER);
          textSize(150);
          fill(255);
          text(end,width/2,180); //game over text
          
          //message to display if thanos wins
          if(leftscore==3){
            textFont(body_font);
            textAlign(CENTER);
            fill(255);
            text(Thanos_win,width/2,280); 
          }
          
          //message to display if capt america wins
          if(rightscore==3){
            textFont(body_font);
            textAlign(CENTER);
            fill(255);
            text(cam_win,width/2,280);  
          }
          
          //restart gameplay
           if(mousePressed){
            gamePlay = false; 
            menuPlay = true;
            rightscore = 0;
            leftscore = 0;
          }  
        }
      }
     
      
  
      // to ensure paddles stop moving when key is released and not move continuously upon pressing of button
      void keyReleased() {
        left.move(0);
        right.move(0);
      }
      
      //keys to control movement of paddles for both players
      void keyPressed() {
        //left player aka thanos movement
        if (key == 'w') {
          left.move(-10);
        } 
        else if (key == 's') {
          left.move(10);
        }
         
        // right player aka capt america movement 
        if (keyCode == UP) {
          println("UP");
          right.move(-10);
        }
         else if(keyCode == DOWN) {
          right.move(10);
        }
      }
      
      // display main text in menu screen
      void body(){
        //load text via for loop from .txt file
        for(int i=0; i< 12; i++){
        textFont(body_font);
        textAlign(LEFT);
        textSize(20);
        fill(255,0,0); //color of font
        text(body[i],5,150+i*30); // display of text with intervals after each line
      }
      
      fill(0,255,0);
      text(body[12],5,510); //display last line of text.
    }
      
      
    // display title of game in menu screen  
    void Header(){
      
      //randomize colors within limited range throughout game play. make game flashy
      for(int x=1;x<255;x++){
        col = random(30,255);
        col2 = random(30,255);
        col3 = random(30,255);
      }
      
      //display text of title
      textFont(header_font);
        textAlign(CENTER);
        fill(col,col2,col3); //color of text
        text(header,width/2,80);  // color of text.
      }
      
      
