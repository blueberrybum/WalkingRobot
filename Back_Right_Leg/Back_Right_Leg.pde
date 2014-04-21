import spacebrew.*;

String server="sandbox.spacebrew.cc";
String name="Muffin Man";
String description ="";

int ball = 360;

Spacebrew sb;

void setup() {
  frameRate(240);
  size(500, 400);

  // instantiate the spacebrewConnection variable
  sb = new Spacebrew( this );

  // declare your publishers
  sb.addPublish( "back_right", "boolean", true ); 




  // connect to spacebrew
  sb.connect(server, name, description );
}
void draw() {
  background(255,200,42);
    ellipse(ball, (height/2) + 5, 30, 30);
}

void mousePressed() {
  // send message to spacebrew
    sb.send( "back_right", true);
   if (mouseX >= 0 && mouseX <= width - 20) {
    ball = mouseX;
   }
}
void mouseReleased() {
  // send message to spacebrew
  sb.send( "back_right", false);
}

