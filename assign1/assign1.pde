final int grid = 80;
final float grassHeight = 15;
final float lifeGap = 20;
final float lifePosition = 10;
final float lifeSize = 50; 
final float sun = 50;
final float sunDiameter = 120;
final float groundhogSize = 80;
final int soldierSize = 80;
final int offsetHeight = 37;
final int offsetWidth = 25;

PImage bg, groundhog, life, robot, soil, soldier;

int soldierX, soldierY, soldierSpeed, robotX, robotY, laserXStart, laserXEnd, laserY;

void setup() {
	size(640, 480, P2D);
	// Enter Your Setup Code Here
  //load the images
  bg = loadImage("../img/bg.jpg");
  groundhog = loadImage("../img/groundhog.png");
  life = loadImage("../img/life.png");
  robot = loadImage("../img/robot.png");
  soil = loadImage("../img/soil.png");
  soldier = loadImage("../img/soldier.png");
 
  imageMode(CORNER);
  
  //init a solier's position randomly
  soldierX = -soldierSize;
  //soldierX=floor(random(soldierSize/2,width-soldierSize));
  soldierY = floor(random(2,6))*grid;
  soldierSpeed = 3;
  
  //init a robot's position randomly
  robotX = floor(random(2,8))*grid;
  robotY = floor(random(2,6))*grid;
  
  laserXStart = robotX+offsetWidth;
  laserXEnd = laserXStart;
  laserY = robotY+offsetHeight;

  
}

void draw() {
	// Enter Your Code Here
  //put a background image
  image(bg, 0, 0,width, height);
  
  //put three life image 
  image(life, lifePosition, lifePosition);
  image(life, lifePosition+lifeSize+lifeGap, lifePosition);
  image(life, lifePosition+lifeSize*2+lifeGap*2, lifePosition);
  
  //draw the sun
  ellipseMode(CENTER);
    //sun's stroke
    fill(253,184,19);
    strokeWeight(5);
    stroke(255,255,0);
    //sun's body
    circle(width-sun,sun,sunDiameter);
  
  //draw the grass
  noStroke();
  fill(124,204,25);
  rect(0,grid*2-grassHeight,width,grassHeight);
  
  //put the soil image
  image(soil, 0, grid*2);
  //put a groundhog on the center
  image(groundhog, grid*4-groundhogSize/2, grid);
  
  //Sodlier
    //soldier walking from left to right repeatedly
    soldierX += soldierSpeed;
    if(soldierX>width){
      soldierX = -soldierSize;
    }
    
    //put a soldier image
    image(soldier,soldierX,soldierY);
    
  
  //Robot

    //put a robot image
    image(robot,robotX,robotY);
    
    //robot's laser color and weight
    stroke(255,0,0);
    strokeWeight(10);
    
    //robot's laser
      //laser's offset
      line(laserXStart, laserY, laserXEnd, laserY);
    
      //laser's movement
      if(laserXEnd > robotX-grid*2){
        
        if(laserXStart-laserXEnd>=40){
        laserXEnd -= 2;
        laserXStart -= 2;
        }else{
          laserXEnd -= 2;
        }
        //println(laserXStart, laserXEnd);
        
      }else{
        //reset the laser
        laserXStart = robotX+offsetWidth;
        laserXEnd = laserXStart;
      }
}
