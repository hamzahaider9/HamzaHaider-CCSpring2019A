/*
Population_vis.pde
Author: Alexandros Lotsos
Summary: A sketch that works with a local .csv  file that creates squares based on the population densities of the cities. The size of the square is the area of the city and the dots are the population in proportionate terms. Finally the sketch calculates the population density and saves it as a new excel file.
T*/

//In order to load CSV files, processing defines a Table class
Table population;

void setup(){
  //set canvas parameters
size(1100,200);
background(255,255,255);

//load our CSV file
population = loadTable("Population.csv", "header");

//get the rowCount of the table
int rowCount = population.getRowCount();

// adding new Column to table
population.addColumn("Population Density");

for (int i = 0; i < rowCount; i++) {               
  //get the ith row and store it in a variable of type TableRow
  TableRow row = population.getRow(i);
  
  String output = ""; //define an empty string to print later
    
    //use the getType("columnName") methods to get individual values out of your row and add them to output
    output += row.getString("Country") + ", "; //use getString to get strings
    output += row.getInt("City Code") + ", ";
    output += row.getString("City") + ", ";
    output += row.getInt("Population") ; //use getInt to get integers
    
    
    println(output); //print the output


//define parameters for square

  int posX = 120*i;
  int posY = 50;
  float City_Area = sqrt(row.getInt("City Area")); // to limit size of squares

//drawing squares
  rect(posX, posY, City_Area, City_Area);


//plotting dots based on the population size proportionate of cities  
  for (int j = 0; j < row.getInt("Population")/5000; j++) {                          
    
  
    point( random(posX, posX + City_Area),
           random(posY, posY + City_Area));
  }
  
  //calculating density
  float Density = row.getInt("Population")/row.getInt("City Area");
  println(Density);
  
  //Adding new Column 
 row.setFloat("Population Density", Density);
}
//Saving New Table as a separate file
saveTable(population, "Updated_Population.csv");
}
