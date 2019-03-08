 /*

Assignment_5.pde

Author: Hamza Haider

Summary: Create a character (animal, person, etc.) and make a function that draws the character. Your character function must have parameters allowing you to draw or animate certain properties.
*/

      color beardc = #DE333F; // original beard color
      color backgroundColor = #1176B7; // original background color
      float faceScale =1; 
      
      void setup() {
      size(1000,1000);
      background(#1176B7);
      rectMode(CENTER);
      }
      
      void draw() {
      background(backgroundColor);
      
      hair(10,0,beardc,faceScale);
      face_eyes(0,110,5);
      facialFeatures();    
      
      println(mouseX, mouseY);
      }
      
      // function to draw hair and beard and change certain styles
      void hair(float hairThickness,float hairColor, color beardColor, float faceScale){
      scale(faceScale);
      
      //hair
      stroke(0);
      strokeWeight(hairThickness); //10
      fill(hairColor); //0
      ellipse(600/2 , 600/2 -20, 322, 340);
      
      //beard
      stroke(beardColor); //beardc
      strokeWeight(10);
      fill(beardColor); //beardc
      ellipse(600/2, 600/2 +20,322,340);
      }
      
      //function to draw face and eyes as well as change their attributes
      void face_eyes(float eyeColor,float eyeOpacity, float eyeBrowThickness){
      //face
      noStroke();
      fill(214, 205, 171);
      ellipse(600/2, 600/2, 330, 350);
      
      //left eye
      stroke(0);
      fill(255);
      strokeWeight(1);
      ellipse(230, 240, 80, 40);
      
      //eye pupil
      stroke(0);
      fill(eyeColor, eyeOpacity);//0, 110
      strokeWeight(1);
      ellipse(230, 240, 40, 40);
      
      stroke(0);
      fill(0, 0, 0);
      strokeWeight(1);
      ellipse(230, 240, 20, 20);
      
      //right eye
      noFill();
      stroke(0);
      strokeWeight(3);
      arc(360, 237, 75, 40, 0, PI, OPEN);
      
      //eyebrows
      strokeWeight(eyeBrowThickness);
      line(180,205,277,195);
      line(314,195,404,205);
      }
      
      // function to draw rest of facial features
      void facialFeatures(){
      //nose
      strokeWeight(6);
      stroke(0);
      line(295,280,260,360);
      line(260,360,295,360);
      
      
      //glasses
      stroke(#3E2589);
      strokeWeight(5);
      rect(230, 240, 95, 50);
      rect(360, 240, 95, 50);
      line(182, 240, 145, 230);
      line(277, 240, 312, 240);
      line(407, 240, 450, 230);
      
      //ears
      noStroke();
      fill(214, 205, 171);
      ellipse(465,305,30,50);
      ellipse(137,305,30,50);
      stroke(0);
      fill(0);
      strokeWeight(4);
      arc(465, 305, 15, 27, -PI/2, PI/2);
      arc(137, 305, 15, 27, PI/2, 3*PI/2);
      
      //smile
      noStroke();
      fill(80);
      arc(295, 390, 120, 100, 0, PI);
      }
      
      //changing color of bead to hipster shades
      void mousePressed(){
      beardc= color(random(100,255), random(20, 80), random(30, 50));
      }
      
      //changing background color for disco effect
      void mouseMoved(){
      backgroundColor = color(random(50, 150), random(110, 256), random(100, 220));
      }
      
      //changing size of face
      void keyPressed(){
        //increasing size of face
       if(keyCode == RIGHT && faceScale < 8 ){ //decrease x dimension by one
        faceScale+=0.25;
      }
      //decreasing size of face
      else if(keyCode == LEFT && faceScale > 0.5){ //decrease x dimension by one
        faceScale-=0.5;
      }
      // slowly decreasing size of face when it becomes lower than 0.5 scale
      else if(keyCode == LEFT && faceScale > 0.1){ //increase x dimension by one
      faceScale-=0.05; 
      }
      }
