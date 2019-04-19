class trees{
constructor(x, y, r) {
  this.options = {
    restitution: 1,
    friction: 0,
    isStatic: true
}
  this.body = Bodies.circle(x, y, r, this.options);
  this.body.label = "trees";
  this.r = r;
  World.add(world, this.body);
}

show() {
  stroke(0);
  fill(34,139,34);
  var pos = this.body.position;
  push();
  translate(pos.x, pos.y);
  ellipse(0, 0, this.r * 2);
  pop();
}
}