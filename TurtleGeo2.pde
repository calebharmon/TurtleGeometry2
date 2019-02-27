float[] a, turtleX, turtleY, noiseX, turtleXprev, turtleYprev;
color[] c;
int t = 0;
final int num = 50;
void setup() {
  size(1650, 2700);
  reset();
}

void reset() {
  background(0);
  a = new float[num];
  turtleX = new float[num];
  turtleY = new float[num];
  noiseX = new float[num];
  turtleXprev = new float[num];
  turtleYprev = new float[num];
  c = new color[num];

  for (int i = 0; i < a.length; i++) {
    a[i] = random(0, TWO_PI);
    turtleX[i] = random(width);
    turtleY[i] = random(height);
    turtleXprev[i] = turtleX[i];
    turtleYprev[i] = turtleY[i];
    noiseX[i] = random(1000);
    float test = random(1);
    //if (test<0.4) {
    //  colorMode(HSB, 255);
    //  c[i] = color(map(random(210, 270), 0, 360, 0, 255), random(100, 255), random(100, 255));
    //} else if (test<0.8) {
    //  c[i] = color(map(random(50, 70), 0, 360, 0, 255), random(100, 255), random(100, 255));
    //} else {
    //  colorMode(RGB, 255);
    //  c[i] = color(random(200, 255), 5);
    //}
    colorMode(HSB, 255);
    c[i] = color(map(random(0, 360), 0, 360, 0, 255), random(100, 255), random(100, 255));
  }
}

void draw() {
  for (int j = 0; j < a.length; j++) {
    for (int i = 0; i < 1000; i ++) {
      if (i < 1000) {
        //test
        a[j] += map(noise(noiseX[j]), 0, 1, -0.5, 0.5);
      } else {
        a[j] += map(noise(noiseX[j]), 0, 1, 0, 0);
      }
      turtleXprev[j] = turtleX[j];
      turtleYprev[j] = turtleY[j];
      turtleX[j] += 0.25 * cos(a[j]);
      turtleY[j] += 0.25 * sin(a[j]);
      noiseX[j] += .0001;
      stroke(c[j], 10);
      strokeWeight(2);

      line(turtleX[j], turtleY[j], turtleXprev[j], turtleYprev[j]);
    }
  }
  t+=1;
  if (t%50==0) {
    println(t);
  }
  if (t%500==0) {
    saveFrame("test######.png");
    reset();
  }
}
