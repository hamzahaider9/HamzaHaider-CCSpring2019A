/* 
// Choked to Death
// Author: Hamza Haider
// Summary: The javascript file for the project. The aim for the presentation is to present an experience that will open your eyes to the extent plastic pollution affects marine animals in another part of the world.
*/ 

//declaring variables to be used later
var img1,img2, button, button2, switch1=false,music;
var w,h;  
var music;
var transparency = 0;
var text1,header;
var x_scale ;
var y_scale ;
 

//preload runs before setup
//use it to load data
function preload(){
 //loading background sound
  music = loadSound('music.mp4');
  
//loading images
  img1 = loadImage('start.jpg');
  img2 = loadImage('main1.jpg');
  
  img3 = loadImage('bottle.svg');
  img4 = loadImage('rope.png');
  img5 = loadImage('cap.png');
  img6 = loadImage('candy.png');
  img7 = loadImage('straw1.png');
  img8 = loadImage('bag.png');

  //loading text
  text1 = loadStrings('paragraph.txt');
  header = loadStrings('header.txt');
}

function setup() {
  //creating canvas to display the presentation.
  createCanvas(windowWidth,windowHeight);
  
  //play music
  music.play();
  
  //initializing buttons
  button = createButton('Start');
  button.position(170, 690);
  button.class('button');
  
  button2 = createButton('Home ');
  button2.position(170, 50);
  button2.class('button');

  //declaring background
  background(255);

  //defining functions for each button
  button2.mousePressed(unfade);
  button.mousePressed(fade);

 }


function draw() {
 //variables to position the ellipses based on screen size of user.
   x_scale = windowWidth/1536;
   y_scale = windowHeight/754;
  
  //variables to allign images on left side of screen
  w=width/15;
  h=height/7;

 //console.log(displayWidth,displayHeight,window.innerWidth,window.innerHeight);
  
 //initializing opening page + imagery
  imageMode(CENTER);
  image(img1, width/2,height/2,width,height);
  push();
  fill(30,180);
  noStroke();
  rect(50,400,300,340);
  pop();

  //styling and display of text
  push();
  fill(190);
  textFont("Times New Roman");
  textSize(30);
  textAlign(CENTER);
  text("Choked To Death", 50,400,300,340);
  pop();

    //styling and display of text
  push();
  fill(190);
  textFont("Times New Roman");
  textSize(18);
  textAlign(LEFT);
  text("A new study reveals that by 2050, 99 percent of seabirds will likely have undigestible pieces of plastic trash in their bellies.\n Midway Atoll, an island in the Pacific 2000 miles from the nearest continent, has suffered the most in the war against plastic. Home to albatrosses, tens of thousands of birds have died after ingesting plastic. Plastic produced by humans in another part of the world. ",
    60,435,290,340);
  pop();

  // if statement to fade from image 1 to 2 and vice versa depending on buttons
  if(switch1==true){
    transparency=transparency+7; //control speed of fade
    if(transparency>255)
      transparency=255;
    }
  
    else{
      transparency = 0;
    }


  //styling and display of main images
  push();
  tint(255, transparency); 
  image(img2, width/2,height/2,width,height);
  pop();

    //hiding and display of buttons according to current situations i.e current transparency level of main image
  if(transparency>1){
    button.hide();
  }

  
  //display of 1st button and removal of 2nd button
  else if (transparency<1){
  button2.hide();
  button.show();
  }
 
  //display of 2nd button and removal of 1st button
  if(transparency ==255){
    push();
    fill(30,180);
    noStroke();
    rect(50,400,300,140);
    pop();
    button2.show();
    mouseMovement();

  }
  


  //inserting 6 images for objects
    //styling and display of images
  push();
  tint(255, transparency-20);
  image(img7,width-width/30,h  ,w,h); 
  image(img4,width-width/30,2*h ,w,h);
  image(img5,width-width/30,3*h ,w,h);
  image(img6,width-width/30,4*h ,w,h);
  image(img3,width-width/40,h*5 ,w,h);
  image(img8,width-width/30,h*6 ,w,h); 
  pop();
 }

// starting the fade
 function fade(){
  switch1 =true;
}

function unfade(){
  switch1 =false;
}

// to hover over image and start change in text
function mouseMovement(){
  if(mouseX > width * 28/30 ){

    //straws
    if(mouseY > h/2 && mouseY< h*3/2){

      //drawing ellipse to highlight position of object in image
      push();
      noFill();
      stroke(255);
      strokeWeight(5);
      
      
      //sizing ellipse according to user screen size
      ellipse(885 * x_scale ,390 * y_scale  , 80, 50);
      pop();

      //styling and display of text which changes depending upon object
      push();
      fill(190);
      textFont("Times New Roman");
      textSize(30);
      textAlign(CENTER);
      text(header[1], 50,400,300,100);
      pop();

      push();
      fill(190);
      textFont("Times New Roman");
      textSize(18);
      textAlign(LEFT);
      text(text1[1],60,435,290,100);
      pop();
    }

    //Plastic Ropes
    if(mouseY > h*3/2 && mouseY< h*5/2){
      //drawing ellipse to highlight position of object in image
      push();
      noFill();
      stroke(255);
      strokeWeight(5);

      //sizing ellipse according to user screen size
      ellipse(925 * x_scale , 284 * y_scale, 200, 100);
      pop();

      //styling of text
      push();
      fill(190);
      textFont("Times New Roman");
      textSize(30);
      textAlign(CENTER);
      text(header[2], 50,400,300,100);
      
      pop();
      push();
      fill(190);
      textFont("Times New Roman");
      textSize(18);
      textAlign(LEFT);
      text(text1[2],60,435,290,100);
      pop();
    }

    //Bottle Caps
    if(mouseY > h*5/2 && mouseY< h*7/2){
      //drawing ellipse to highlight position of object in image
      push();
      noFill();
      stroke(255);
      strokeWeight(5);

      //sizing ellipse according to user screen size
      ellipse(715 * x_scale, 297 * y_scale, 50, 50);
      pop();

      //styling of text
      push();
      fill(190);
      textFont("Times New Roman");
      textSize(30);
      textAlign(CENTER);
      text(header[3], 50,400,300,100);
      pop();

      push();
      fill(190);
      textFont("Times New Roman");
      textSize(18);
      textAlign(LEFT);
      text(text1[3],60,435,290,100);
      pop();
    }

    // Candy Wrappers
    if(mouseY > h*7/2 && mouseY< h*9/2){
      //drawing ellipse to highlight position of object in image
      push();
      noFill();
      stroke(255);strokeWeight(5);

      //sizing ellipse according to user screen size
      ellipse(924 * x_scale, 328 * y_scale, 75, 45);
      pop();

      //styling of text
      push();
      fill(190);
      textFont("Times New Roman");
      textSize(30);
      textAlign(CENTER);
      text(header[4], 50,400,300,100);
      pop();

      push();
      fill(190);
      textFont("Times New Roman");
      textSize(18);
      textAlign(LEFT);
      text(text1[4],60,435,290,100);
      pop();
    }

    //Plastic Bottles
    if(mouseY > h*9/2 && mouseY< h*11/2){
      //drawing ellipse to highlight position of object in image
      push();
      noFill();
      stroke(255);strokeWeight(5);

      //sizing ellipse according to user screen size
      ellipse(790 * x_scale , 378 * y_scale, 150, 80);
      pop();

      //styling of text
      push();
      fill(190);
      textFont("Times New Roman");
      textSize(30);
      textAlign(CENTER);
      text(header[5], 50,400,300,100);
      pop();

      push();
      fill(190);
      textFont("Times New Roman");
      textSize(18);
      textAlign(LEFT);
      text(text1[5],60,435,290,100);
      pop();
    }

    //Plastic Bags
    if(mouseY > h*11/2 && mouseY< h*13/2){
      //drawing ellipse to highlight position of object in image
      push();
      noFill();
      stroke(255);strokeWeight(5);

      //sizing ellipse according to user screen size
      ellipse(684 * x_scale , 316 * y_scale , 60, 50);
      ellipse(1058 * x_scale ,247 * y_scale ,50,50);
      pop();

      //styling of text
      push();
      fill(190);
      textFont("Times New Roman");
      textSize(30);
      textAlign(CENTER);
      text(header[6], 50,400,300,100);
      pop();

      push();
      fill(190);
      textFont("Times New Roman");
      textSize(18);
      textAlign(LEFT);
      text(text1[6],60,435,290,100);
      pop();
    }
  }

  else{

    //styling of text
    push();
    fill(190);
    textFont("Times New Roman");
    textSize(30);
    textAlign(CENTER);
    text(header[0], 50,400,300,100);
    pop();

    push();
    fill(190);
    textFont("Times New Roman");
    textSize(18);
    textAlign(LEFT);
    text(text1[0],60,435,290,100);
    pop();
  }
}

//resizing the canvas based upon user screen size.
function windowResized() {
  resizeCanvas(windowWidth, windowHeight);
}