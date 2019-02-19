  /*

Assignment_2.pde

Author: Hamza Haider

Summary: Solving Sol #118 "On a wall surface, any continuous stretch of wall, using a hard pencil, place fifty points at random. The points should be evenly distributed over the area of the wall. All of the points should be connected by straight lines.  
  *** I bit off more I could chew so I had to resort to taking an immense amount of help from daniel shiffman's youtube channel and the examples done on processing website ***
*/
    int num = 50; //number of points
    float randomness =0.5; //element of randomness

    
    
    void setup() {
    
    size(730, 720); //size of screen  
    background(200,30); // initializing background
    
    //initializing variables
    float columns = num;
    int rows = 1;
    float[][] points = new float[num][num]; //2D array
    int column=0; 
    
    //to increase number of rows to get 50 points
    while((columns/rows) > (width/height)){
     rows+=1;
     columns = (num/rows);
     column = (int)columns;
      
    }
    
    println(column,columns,rows,points.length);
    
    //Assigning points to each array element
    for (int col = 0; col< column; col++){
     for(int row =0; row<rows; row++){
      float cell_width = width/columns;
      float cell_height = height / rows;
      
      // finding x and y coordinates randomnly and ensuring it stays within boundaries
      float x = ((cell_width * col) + (cell_width / 2)) + ((random(0,1) - .5)* (randomness * cell_width));
      float y  = (cell_height * row) + (cell_height / 2) +((random(0,1) - .5)* (randomness * cell_height)); 
     
      if (x > width) 
        x = width;
      
      else if (x < 0)
        x = 0;
      
      else if (y > height) 
        y = height;
      
      else if (y < 0) 
        y = 0;
 
     //assigning x and y coordinates to element
      points[row][col] = x;
      points[col][row] =y;
      
      
     } 
     
    }
    
    
    //printing each element of the array
    for (int col = 0; col< column; col++){
     for(int row =0; row<rows; row++){
              
      ellipse(points[row][col],points[col][row],1.5, 1.5);
      
     //joining each dot by a line with all other 49 dots.
                for (int col1 = 0; col1< column; col1++){
                for(int row1 =0; row1<rows; row1++){
                   
                    stroke(15,80);
                    strokeWeight(1);
                    line(points[row][col],points[col][row],points[row1][col1],points[col1][row1]);
                }
                }
     }}
    }
    
    void draw(){
      
      
    }
