/*
 * Class: EDM4611-020
 * Title: Esquisse 1 - Motif 2D
 * Autor: Samuel Favreau
 
 * Instructions: Click to generate a new pattern and press the spacebar to save the pattern.
 */

//Global variables
int steps;

float shapeASize;
float shapeBSize;
float dotSize;
float lineScale;

float shapeArotation;
float shapeBrotation;

PGraphics grain;

String dateTime = year() + "-" + nf(month(), 2) + "-" + nf(day(), 2) + " - " + nf(hour(), 2) + "-" + nf(minute(), 2) + "-" + nf(second(), 2);
int savedFrames;

int wh;

// ------------------------------------------------------------------------------------------
//                                        SETUP
// ------------------------------------------------------------------------------------------

void setup() {
  size(800, 800);
  wh = max(width,height);
  steps = wh/4;
  //Selects a new size and rotation for the shapes
  selectSize();
  //Creates a new grain texture
  createGrain();
}

// ------------------------------------------------------------------------------------------
//                                        DRAW
// ------------------------------------------------------------------------------------------

void draw() {
  background(#222131);

  //Creates a grid that displays the shape B
  for (int x = 0; x <= width+steps; x+=steps) {
    for (int y = 0; y <= height+steps; y+=steps) {
      shapeB(x, y, shapeBSize);
    }
  }

  //Creates a grid that displays the shape A
  for (int y = 0; y < height; y+=steps/2) {
    for (int x = 0; x < width; x+=steps/2) {

      // Checks if it needs to draw a custom shape or a dot
      int id = (x/(steps/2)) + ((y/(steps/2))*((width/(steps/2))+1));
      if (id % 2 == 0) {
        if ((y/(steps/2)) % 2 == 1) {
          shapeA(x, y, shapeASize);
        }
      } else {
        fill(#2D4E71);
        circle(x, y, dotSize);
      }
    }
  }

  //Draws a diagonal line pattern simulating texture
  int lineW = 2;
  push();
  scale(lineScale, 1);
  for (int i = 0; i <= wh*2; i+=lineW*1.5) {
    strokeWeight(lineW);
    stroke(20, map(i % (lineW*3), 0, lineW, 0, 50));
    line(0, (height*2)-i, (width*2)-i, 0);
  }
  pop();

  //Draws a grain pattern simulating texture
  image(grain, 0, 0);
}

// ------------------------------------------------------------------------------------------
//                                        Functions
// ------------------------------------------------------------------------------------------

//Selects a new size and rotation for the shapes
void selectSize() {
  //Selects new sizes
  shapeASize = random(wh/20, wh/8);
  shapeBSize = map(shapeASize, wh/20, wh/8, wh/8, wh/20);
  dotSize = random(15);
  lineScale = random(0.5, 2);

  //Selects new rotations
  int rotA = floor(random(2));
  if (rotA == 1) {
    shapeArotation = 45;
  } else {
    shapeArotation = 0;
  }

  int rotB = floor(random(2));
  if (rotB == 1) {
    shapeBrotation = 45/2 + 1;
  } else {
    shapeBrotation = 0;
  }
}


//Function to draw triangles pointing up
void triangleUp(float x, float y, float w, float h, float r) {
  push();
  translate(x, y);
  rotate(radians(r));
  triangle(0, 0-h, w/2, 0, 0-w/2, 0);
  pop();
}

//Function to draw triangles pointing down
void triangleDown(float x, float y, float w, float h, float r) {
  push();
  translate(x, y);
  rotate(radians(r));
  triangle(-w/2, -h, 0, 0, w/2, -h);
  pop();
}

//Function to draw the shape A
void shapeA(float x, float y, float s) {

  noStroke();
  push();
  translate(x, y);
  rotate(radians(shapeArotation));
  scale(s/100);

  //Blue outline
  for (int r = 0; r < 360; r+=360/4) {
    push();
    rotate(radians(r));
    fill(#2D4E71);
    quad(-60/2, -70, 0, -70-30, 60/2, -70, 0, 10);
    pop();
  }

  //big black triangle
  for (int r = 0; r < 360; r+=360/4) {
    fill(#12111A);
    triangleDown(0, 0, 50, 70, r);

    //white quad
    push();
    rotate(radians(r));
    fill(#763030);
    quad(-50/2, -70, 0, -70-20, 50/2, -70, 0, -70+20+10);
    fill(255);
    quad(-50/2, -70, 0, -70-20, 50/2, -70, 0, -70+20);
    pop();
  }

  //black triangles
  for (int r = 0; r < 360; r+=360/8) {
    fill(#12111A);
    triangleUp(0, 0, 50, 40, r);
  }

  //red triangles
  fill(#F22222);
  for (int r = 0; r < 360; r+=360/8) {
    triangleUp(0, 0, 30, 30, r);
  }

  //white circle
  fill(255);
  circle(0, 0, 20);

  pop();
}

//Function to draw the shape B
void shapeB(float x, float y, float s) {
  noStroke();

  push();
  translate(x, y);
  rotate(radians(shapeBrotation));
  scale(s/105);

  //Blue diamonds
  for (int i = 0; i < 360; i+= 360/8) {
    push();
    float diamondW = 20;
    float diamondH = 30;
    rotate(radians(i));
    fill(#8BBEF2);
    triangleDown(0, 0, diamondW, diamondH, 0);
    fill(#2D4E71);
    triangleUp(0, -diamondH, diamondW, diamondH, 0);
    pop();
  }

  //white quad
  for (float i = 45/2; i < 360 + 45/2; i+= 360/8) {
    push();
    rotate(radians(i));
    fill(#F22222);
    quad(-60/2, -70, 0, -70-20, 60/2, -70, 0, -70+20+10);
    fill(#763030);
    quad(-60/2, -70, 0, -70-40, 60/2, -70, 0, -70+20);
    fill(255);
    quad(-50/2, -70, 0, -70-20, 50/2, -70, 0, -70+20);
    pop();
  }

  //white circle
  fill(255);
  circle(0, 0, 20);

  pop();
}

//Function to create a grain pattern simulating texture
void createGrain() {
  grain = createGraphics(width, height);
  grain.beginDraw();
  int grainSize = 3;
  for (int y = 0; y < height; y+=grainSize) {
    for (int x = 0; x < width; x+=grainSize) {
      grain.strokeWeight(grainSize);
      grain.stroke(random(50, 100), 50);
      grain.point(x, y);
    }
  }
  grain.endDraw();
}

//Function to check for mouse presses
void mousePressed() {
  selectSize();
  createGrain();
}

//Function to check for key presses
void keyPressed(){
  if(key == ' '){
    savedFrames ++;
    saveFrame("frames " + dateTime + "/texture-" + nf(savedFrames, 4) + ".png");
  }
}
