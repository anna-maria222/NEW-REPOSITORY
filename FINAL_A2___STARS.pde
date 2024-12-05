int numStars = 10;
Star[] stars = new Star[numStars]; 

void setup() {
  size(800, 600);
  
  
  for (int i = 0; i < numStars; i++) {
    stars[i] = new Star(random(width), random(height), random(1, 5), color(random(255), random(255), random(255)));
  }
}

void draw() {
  background(0);
  

  for (Star star : stars) {
    star.move(); 
    star.display(); 
  }
}

class Star {
  float x; 
  float y; 
  float speed; 
  color col; 

 
  Star(float x, float y, float speed, color col) {
    this.x = x;
    this.y = y;
    this.speed = speed;
    this.col = col;
  }

  void move() {
    x += speed; 
    if (x > width) { 
      x = 0;
      y = random(height); 
      col = color(random(255), random(255), random(255)); 
    }
  }

  void display() {
    fill(col); // Set the star color
    drawStar(x, y, 20, 10, 5); // Draw the star
  }
}

void drawStar(float x, float y, float radius1, float radius2, int npoints) {
  float angle = TWO_PI / npoints;
  float halfAngle = angle / 2.0;

  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius1;
    float sy = y + sin(a) * radius1;
    vertex(sx, sy);
    sx = x + cos(a + halfAngle) * radius2;
    sy = y + sin(a + halfAngle) * radius2;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}
