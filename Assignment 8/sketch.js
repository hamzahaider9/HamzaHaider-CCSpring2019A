/*
Rain Falling Through a canopy of rainforest
Author: Hamza Haider
Summary: The main aim is to create a rainforest canopy through which rain falling below is observed.
*/



// establish module aliases
var Engine = Matter.Engine;
var World = Matter.World;
var  Events = Matter.Events;
var  Bodies = Matter.Bodies;

//create your engine
var engine = Engine.create();
//save a reference to your world
var world = engine.world;

//container for our raindrop, canopy objects
var raindrops = [];
var canopy = [];

//size of canopy
var cols = 11;
var rows = 4;


function setup() {
  createCanvas(600, 600); //creating screen to display our stuff
  
  
  //understood and inferred from dan shifman's video.
  // to initialize the start of the collision event sequence
  function collision(event) {
    var pairs = event.pairs;
    for (var i = 0; i < pairs.length; i++) {
      var labelA = pairs[i].bodyA.label;
      var labelB = pairs[i].bodyB.label;
      
    }
  }

  Events.on(engine, 'collisionStart', collision);

  // size of canopy to allow raindrops to fall through 
  var spacing = width / cols;
  
  //push canopy objects onto our canopy array
  for (var j = 0; j < rows; j++) {
    for (var i = 0; i < cols + 1; i++) {
      var x = i * spacing;
      if (j % 2 == 0) {
        x += spacing / 2;
      }
      var y = spacing + j * spacing;
      var p = new trees(x, y, 16);
      canopy.push(p);
    }
  }
}

function draw() {
  background(0);

  //intensity of rain 
  if (frameCount % 3 == 0) {
    var p = new raindrop(300, 0, 10);
  raindrops.push(p);
  }

  //allow rain to continue. Thank you dan shifmann for making it easy despite the 4 videos that crushed my soul 
  Engine.update(engine, 1000 / 30);
  
  //initialization, display and start of rainfall
  for (var i = 0; i < raindrops.length; i++) {
    raindrops[i].show();
    if (raindrops[i].isOutOfBounds()) {
      World.remove(world, raindrops[i].body);
      raindrops.splice(i, 1);
      i--;
    }
  }

  //display of canopy
  for (var i = 0; i < canopy.length; i++) {
    canopy[i].show();
  }
}










