var img;  
var music;


function preload(){

  img = loadImage('main1.jpg');
  //music = loadSound('music.mp3');
  console.log("Sound + Image is ready");
}

function setup() {
  
 createCanvas(windowWidth,window.innerHeight);
 // createCanvas(windowWidth,windowHeight);

  background(255);
   //music.play();
}

function draw() {
 
  //image(img, 0,0,img.width*0.14,img.height*0.55851852);
  imageMode(CENTER);
  image(img, width/2,height/2,width,height);

}

// function windowResized(){
//   resizeCanvas(windowWidth, windowHeight);
// }