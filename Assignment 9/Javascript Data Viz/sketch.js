/*
No of words in top 10 NYTimes headlines
Author: Hamza Haider
Summary: The main aim is to display how many words are used in NYT headline stories. The data visualization changes as the headlines change. Only 10 headlines have been chosen to give emphasis on the data quality not quantity
*/

//this is our url from where we load data
var nyTimesURL = "http://api.nytimes.com/svc/search/v2/articlesearch.json?q=new+york+times&page=0&sort=newest&api-key=QYiAteq0Fc5Xc7AIbYvHD4xDHJBo9Sde";


//define a container for our results
var results;

//boolean to make sure that we have our data before we do anything
var loaded = false;


// total number of headline we load. Number is limited to give importance to information
var total = 10;



//preload runs before setup
//use it to load data
//we're gonna use this to ping nyt website and have our data ready for the sketch
function preload(){
    //use httpGet to query top 10 news articles from today. Updates regularly
    results = httpGet(nyTimesURL, 'json', false, function(data){
        results = data.response.docs;
        console.log(results[0].headline.main);
        //set loaded to true
        loaded = true;
    });

}

function setup(){
    //canvas paramters
    createCanvas(600, 600);
    background(0);
    
    //displaying text to explain data visualization and setting parameters
    fill(255);
    textFont("inconsolata");
    textSize(width / 25);
    textAlign(CENTER, CENTER);
    text('No of words in top 10 NYTimes headlines', width/2, height/20);
    textSize(width / 45);
    text('The less words you use, the more effective you are - Mark twain', width/2, height/11);

}

function draw(){
    //if we don't have our data yet, then return from the function
    //don't do anything
    if(!loaded){
        return;
    }
    
    // parameters for enforcing bar graphs
    var w = width/total;
    var n =0;

    //for loop to load data and draw bar graphs
    for(var i = 0; i<10;i++){

    n = WordCount(results[i].headline.main)
    console.log(n);
    
      //display no of words in headline
      fill(255);
      stroke(0);
      text( n + 'words', i *w+32, height-n*42);
      
      // Draw a bar for the graph
      fill(255,0,0);
      rect(i * w, height-n*40 , w-2, n*40);
    }
}

//function to count no of words in headline
    function WordCount(str) { 
        return str.split(" ").length;
      }
      
     