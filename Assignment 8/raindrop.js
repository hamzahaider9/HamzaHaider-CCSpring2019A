class raindrop {
  constructor(x,y,r){
    this.options = { 
        restitution: 0.5,
        friction: 0,
        density: 1
    }
    x += random(-300, 300);
    this.body = Bodies.circle(x, y, r, this.options);
    this.body.label = "raindrop";
    this.r = r;
    World.add(world, this.body);
  }

isOutOfBounds() {
  return (this.body.position.x < -50 || this.body.position.x > width + 50 || this.body.position.y > height);
}

show() {
  fill('#75DAFF');
  stroke(0);
  var pos = this.body.position;
  push();
  translate(pos.x, pos.y);
  ellipse(0, 0, this.r * 2);
  pop();
}
}