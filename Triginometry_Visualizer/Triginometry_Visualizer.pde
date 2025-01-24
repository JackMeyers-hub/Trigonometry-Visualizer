boolean spaceKey, pSpaceKey;
boolean unitCircle = false;

PVector center = new PVector();
PVector mouse = new PVector();

void setup() {
  size(500, 500);


  center.x = width/2;
  center.y = height/2;
}

void draw() {
  background(#404040);
  strokeWeight(1);
  stroke(#080808);
  line(width/2, 0, width/2, height);
  line(0, height/2, width, height/2);
  mouse.x = mouseX;
  mouse.y = mouseY;



  if (spaceKey && !pSpaceKey && unitCircle == false) {
    unitCircle = true;
  } else if (spaceKey && !pSpaceKey && unitCircle) {
    unitCircle = false;
  }



  //space was toggled
  if (unitCircle) {
    pushMatrix();
    noFill();
    stroke(#080808);
    ellipse(center.x, center.y, 400, 400);
    popMatrix();
    textSize(13);
    text("[space] : toggle unit circle (on)", 7, 17);


    float dist = 1.000; 



    float angleToMouse = atan2(mouse.y-center.y, mouse.x-center.y);
    String displayedAngleToMouse = nf(angleToMouse,0,3);

    //offset + cos/sin * the radius
    float lockedMouseX =  center.x + cos(angleToMouse) * 200;
    float lockedMouseY =  center.y + sin(angleToMouse) * 200;
    
    float lockedMouseXText = map(lockedMouseX,50,450,-1,1);
    float lockedMouseYText = map(lockedMouseY,50,450,-1,1);
    float radiansTextX = center.x + cos(angleToMouse/2) * 55;
    float radiansTextY = center.y + sin(angleToMouse/2) * 55;

    float xTextX = center.x + lockedMouseX/2 - 125;
    float yTextY = center.y + lockedMouseY/2 - 125;
    float distTextX = center.x + lockedMouseX/2 - 125;
    float distTextY = center.y + lockedMouseY/2 - 125;

    pushMatrix();
    strokeWeight(3);
    stroke(#BFBFBF);

    line(center.x, center.y, lockedMouseX, center.y);
    line(lockedMouseX, center.y, lockedMouseX, lockedMouseY);
    popMatrix();


   
    stroke(#BFBFBF);
    strokeWeight(3);
    //q1
    if (mouse.x <= 250 && mouse.y <= 250) {
      //q1
      text(lockedMouseXText, xTextX - 15, height/2 + 15 );
      text(lockedMouseYText , lockedMouseX - 50, yTextY + 10);
      text(dist, distTextX, distTextY - 5);
      arc(center.x, center.y, 100, 100, angleToMouse, 0);
      text(displayedAngleToMouse + " radians",radiansTextX,radiansTextY);
    } else if (mouse.x >= 250 && mouse.y <= 250) {
      //q2
      text(lockedMouseXText, xTextX - 15, height/2 + 15 );
      text(lockedMouseYText, lockedMouseX + 5, yTextY + 10);
      text(dist, distTextX - 50, distTextY - 5);
      arc(center.x, center.y, 100, 100, angleToMouse, 0);
      text(displayedAngleToMouse + " radians",radiansTextX,radiansTextY);
    } else if (lockedMouseX <= 250 && mouse.y >= 250) {
      //q3
      text(lockedMouseXText, xTextX - 15, height/2 -5 );
      text(lockedMouseYText, lockedMouseX - 50, yTextY );
      text(dist, distTextX, distTextY +15);
      arc(center.x, center.y, 100, 100, 0, angleToMouse);
      text(displayedAngleToMouse + " radians",radiansTextX,radiansTextY+10);
    } else if (mouse.x >= 250 && mouse.y >= 250) {
      //q4
      text(lockedMouseXText, xTextX - 15, height/2 -5 );
      text(lockedMouseYText, lockedMouseX + 5, yTextY );
      text(dist, distTextX - 50, distTextY +15);
      arc(center.x, center.y, 100, 100, 0, angleToMouse);
      text(displayedAngleToMouse + "radians",radiansTextX,radiansTextY+10);
    }
    
     //yellow line
    pushMatrix();
    strokeWeight(5);
    stroke(#EAEA07);
    line(center.x, center.y, lockedMouseX, lockedMouseY);
    popMatrix();
  } else {
    // normal behavior
    pushMatrix();
    strokeWeight(5);
    stroke(#EAEA07);
    line(center.x, center.y, mouse.x, mouse.y);
    popMatrix();
        textSize(13);
    text("[space] : toggle unit circle (off)", 7, 17);
    float xTextX = center.x + mouse.x/2 - 125;
    float yTextY = center.y + mouse.y/2 - 125;
    float dist = dist(center.x, center.y, mouse.x, mouse.y);


    float distTextX = center.x + mouse.x/2 - 125;
    float distTextY = center.y + mouse.y/2 - 125;
    pushMatrix();
    strokeWeight(3);
    stroke(#BFBFBF);
    line(center.x, center.y, mouse.x, center.y);
    line(mouse.x, center.y, mouse.x, mouse.y);
    popMatrix();

    //q1
    if (mouse.x <= 250 && mouse.y <= 250) {
      //q1
      text(mouse.x-250, xTextX - 15, height/2 + 15 );
      text(mouse.y-250, mouse.x - 50, yTextY + 10);
      text(dist, distTextX, distTextY - 5);
    } else if (mouse.x >= 250 && mouse.y <= 250) {
      //q2
      text(mouse.x-250, xTextX - 15, height/2 + 15 );
      text(mouse.y-250, mouse.x + 5, yTextY + 10);
      text(dist, distTextX - 50, distTextY - 5);
    } else if (mouse.x <= 250 && mouse.y >= 250) {
      //q3
      text(mouse.x-250, xTextX - 15, height/2 -5 );
      text(mouse.y-250, mouse.x - 50, yTextY );
      text(dist, distTextX, distTextY +15);
    } else if (mouse.x >= 250 && mouse.y >= 250) {
      //q4
      text(mouse.x-250, xTextX - 15, height/2 -5 );
      text(mouse.y-250, mouse.x + 5, yTextY );
      text(dist, distTextX - 50, distTextY +15);
    }
  }
  pSpaceKey = spaceKey;
}
void keyPressed() {
  println(keyCode);
  if (keyCode == 32) spaceKey = true;
}
void keyReleased() {
  if (keyCode == 32) spaceKey = false;
}
