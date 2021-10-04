
   ArrayList<Die> dice = new ArrayList<Die>();
   int sum = 0;
void setup()
{
  background(200, 200, 230);
  size(800, 800);
}
void draw()
{
  background(180, 180, 230);
  textAlign(CENTER);
  textSize(84);
  fill(100, 408, 612);
  text("CLICK TO ROLL", 400, 400);
  text(sum, 400, 480);
  for(int i = 0 ; i < dice.size() ; i++){
    dice.get(i).update();
  }
  
}
void mousePressed()
{
  Die d = new Die(0, (int)(Math.random()*500-100), 50);
  dice.add(d);
  sum += d.value;
  if(dice.size() == 101){
    dice.remove(0);
  }
}
class Die //models one single dice cube
{
	//variable declarations here
  int x, y, value, size;
  int circleSize;
  double A = 9.81, Vx = 0, Vy = 0;
  double xx, yy;
  color c = generateRandomColor();
  
  int collisionx;
  int collisiony;
	
	Die(int x, int y, int size) //constructor
	{
		this.x = x;
    this.y = y;
    xx = x;
    yy = y;
    this.size = size;
    circleSize = size/8;
    roll();
    Vx = Math.random()*800+200;
	}
  void update(){
    locationUpdate();
    collisionUpdate();
    show();
  }
  void locationUpdate(){
    
    yy = yy+Vy/60.0;
    xx = xx+Vx/60.0;
    Vy += A;
    y = (int)(yy);
    x = (int)(xx);
  }
  
  void collisionUpdate(){
    if(millis()-collisiony >= 300){
      if(y+size >= 800){
        System.out.println(Vy);
        Vy = -Vy*15/16;
        collisiony = millis();
        
        
      }
    }
    if(millis()-collisionx >= 300){
    if(x <= 0 || x+size >= 800){
      Vx = -Vx*15/16;
      collisionx = millis();
    }
  }
  }
	void roll()
	{
    value = (int)(Math.random()*6)+1;
	}
	void show()
	{
    noStroke();
    shapeMode(CENTER);
    fill(c);
    rect(x, y, size, size, size/8);
    fill(0);
    
		switch(value){
      case 1:
        ellipse(x+size/2, y+size/2, circleSize, circleSize);
        break;
      case 2:

        ellipse(x+size*0.25, y+size*0.25, circleSize, circleSize);
        ellipse(x+size*0.75, y+size*0.75, circleSize, circleSize);
        break;
      case 3:
        ellipse(x+size*0.5, y+size*0.5, circleSize, circleSize);
        ellipse(x+size*0.25, y+size*0.25, circleSize, circleSize);
        ellipse(x+size*0.75, y+size*0.75, circleSize, circleSize);
        break;
      case 4:
        ellipse(x+size*0.25, y+size*0.25, circleSize, circleSize);
        ellipse(x+size*0.75, y+size*0.25, circleSize, circleSize);
        ellipse(x+size*0.25, y+size*0.75, circleSize, circleSize);
        ellipse(x+size*0.75, y+size*0.75, circleSize, circleSize);
        break;
      case 5:
        ellipse(x+size*0.5, y+size*0.5, circleSize, circleSize);
        ellipse(x+size*0.25, y+size*0.25, circleSize, circleSize);
        ellipse(x+size*0.75, y+size*0.25, circleSize, circleSize);
        ellipse(x+size*0.25, y+size*0.75, circleSize, circleSize);
        ellipse(x+size*0.75, y+size*0.75, circleSize, circleSize);
        break;
      case 6:
        ellipse(x+size*0.25, y+size*0.25, circleSize, circleSize);
        ellipse(x+size*0.75, y+size*0.25, circleSize, circleSize);
        ellipse(x+size*0.25, y+size*0.75, circleSize, circleSize);
        ellipse(x+size*0.75, y+size*0.75, circleSize, circleSize);
        ellipse(x+size*0.25, y+size*0.5, circleSize, circleSize);
        ellipse(x+size*0.75, y+size*0.5, circleSize, circleSize);
    }
	}
}

color generateRandomColor(){
  return color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
}
