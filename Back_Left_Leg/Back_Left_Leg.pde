import spacebrew.*;

String server="sandbox.spacebrew.cc";
String name="Back Left";
String description ="";

int ball = 360;

Spacebrew sb;

void setup() {
  frameRate(240);
  size(500, 400);

  // instantiate the spacebrewConnection variable
  sb = new Spacebrew( this );

  // declare your publishers
  sb.addPublish( "back_left", "boolean", true ); 


  // declare your subscribers
  

  // connect to spacebre
  sb.connect(server, name, description );
}
void draw() {
  background(0,0,255);
    ellipse(ball, (height/2) + 5, 30, 30);
}

void mousePressed() {
  // send message to spacebrew
    sb.send( "back_left", true);
   if (mouseX >= 0 && mouseX <= width - 20) {
    ball = mouseX;
   }
}
void mouseReleased() {
  // send message to spacebrew
  sb.send( "back_left", false);
}

