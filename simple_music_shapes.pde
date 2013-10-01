
/* @pjs preload="0.svg"; */ 
/* @pjs preload="1.svg"; */ 
/* @pjs preload="2.svg"; */ 
/* @pjs preload="3.svg"; */ 
/* @pjs preload="4.svg"; */ 

PShape[] sh = new PShape[5];
Circle[] c = new Circle[150];
float mx, my;
float a;


void setup() {
  size(1700, 1200);
  smooth();
  //background(245);
  noStroke();
  lights();
  fill(155);
  noStroke();
  pushMatrix();
  translate(500, height*0.35, -200);
  sphere(500);
  popMatrix();
  strokeWeight(.2);
  shapeMode(CENTER);
  for (int i=0; i<sh.length; i++) {
    sh[i] = loadShape(i+".svg");
  }
  for (int i=0; i<c.length; i++) {
    c[i] = new Circle(i);
  }
}

void draw() {
  background(255);
  color[] cc = {
    color(230 + a/2, 165 + a/2, 220 + a/2), color(253+a/2, 211+a/2, 175+a/2), color(105+a/2, 150+a/2, 213+a/2), 
    color(174+a/2, 255+a/2, 194+a/2), color(249+a/2, 255+a/2, 177+a/2), color(251+a/2, 177+a/2, 193+a/2)
  };

  noStroke();
  for (int i =0; i<c.length; i++) {
    c[i].render(cc[i%cc.length]);
  }
  stroke(0);
  for (int i =0; i<c.length; i++) {
  }
}

class Circle {
  float px, py; // position
  float vx, vy, sca; // velocity
  int r, id; // radius, id
  
  PShape st;
  float ang = random(TWO_PI);
  Circle(int num) { //intialize class. we need an argument: integer num!
    // if we do not have integer inside ( ), it won't work! 
    px = random(width);
    py = random(height);
    vx = random(-5, 5); //.3
    vy = random(-5, 5); //-4.2
    r = 5;
    id = num;
    sca = random(.4, .6);
    st = sh[id%sh.length]; 
  }
  void render(color c) {
    stroke(0);
    strokeWeight(3);
    fill(c); 
    pushMatrix();
      translate(px,py);
      scale(sca);
      rotate(ang);
      st.disableStyle();
      shape(st, 0, 0);
      st.enableStyle();
      popMatrix();
    if (px>width || px<0) {
      vx*=-1; // if(positionX is bigger than width or less than 0) > vx = vx*-1;
      r+=10;
    }
    if (py>height || py<0) {
      vy*=-1; // if(positionY is bigger than height or less than 0) > vy = vy*-1;
      r++;
    }
    px+=vx; // px = px+vx;
    py+=vy; // py = py+vy;
  }
  
}


