/*

Assignment_1.pde

Author: Hamza Haider

Summary: Recreating, in Processing, Schematic Composition by Sophie Taeuber-Arp which is a piece of art in the Geometric Abstraction collection from Google Arts & Culture https://artsandculture.google.com/asset/schematic-composition/CAHQW3Vwuf5e0g

*/

void setup(){
  size(1200,880);
  // Background 
  background(218 , 211 , 193);
  
  // Main black rectangle
  fill(0);
  strokeWeight(20);
  strokeJoin(MITER);
  rect(100,100,1000,700);
 
 // Drawing 5 Rectangles
 noStroke();
 fill(218 , 211 , 193);
 
 rect(140,140,220,50);
 rect(140,240,220,50);
 rect(140,340,220,50);
 rect(140,440,220,50);
 rect(140,540,220,50);
 
 
 ellipse(165,715,50,50);
 ellipse(335.1,715,50,50);
 ellipse(285,715,50,50);
 
 ellipse(425,715,50,50);
 
 
 ellipse(425,165,50,50);
 ellipse(425,265,50,50);
 ellipse(425,365,50,50);
 ellipse(425,565,50,50);
 
 
 rect(490,140,90,50);
 rect(490,240,90,50);
 rect(490,340,90,50);
 rect(490,440,90,50);
 rect(490,540,45,50);
 rect(535.3,540,45,50);
  
 ellipse(515.1,715,50,50);
 ellipse(565.1,715,50,50);
 ellipse(615.1,715,50,50);
 ellipse(665.1,715,50,50);


 ellipse(665,165,50,50);
 ellipse(665,215.1,50,50);
 ellipse(665,265.1,50,50);
 ellipse(665,315.1,50,50);
 ellipse(665,365.1,50,50);
 ellipse(665,415.1,50,50);
 ellipse(665,465.1,50,50);
 ellipse(665,515.1,50,50);
 ellipse(665,565.1,50,50);
 

 ellipse(755,165,50,50);
 ellipse(755,165,50,50);
 ellipse(755,215.1,50,50);
 ellipse(755,265.1,50,50);
 ellipse(755,315.1,50,50);
 ellipse(755,365.1,50,50);
 ellipse(755,415.1,50,50);
 ellipse(755,465.1,50,50);
 ellipse(755,515.1,50,50);
 ellipse(755,565.1,50,50);
 
 
 rect(825,140,50,50);
 rect(875.3,140,50,50);
 rect(925.5,140,50,50);
 rect(975.5,140,50,50);
 rect(1025.5,140,50,50);
 
 
 rect(825,240,250,100);
 
 rect(825,390,150,50);
 rect(825,490,150,50);
 rect(825,590,150,50);
 rect(825,690,150,50);
 
 
 ellipse(1050,415,50,50);
 ellipse(1050,515,50,50);
 ellipse(1050,615,50,50); 
 ellipse(1050,715,50,50);
 
 
 
}


void draw(){
  println(mouseX, ',',mouseY);
  
}
