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
  sb.addPublish( "front_left", "boolean", true ); 


  // declare your subscribers
  sb.addSubscribe( "change_background", "boolean" );

  // connect to spacebre
  sb.connect(server, name, description );
}
void draw() {
  background(0,255,0);
    ellipse(ball, (height/2) + 5, 30, 30);
}

void mousePressed() {
  // send message to spacebrew
    sb.send( "front_left", true);
   if (mouseX >= 0 && mouseX <= width - 20) {
    ball = mouseX;
   }
}
void mouseReleased() {
  // send message to spacebrew
  sb.send( "front_left", false);
}

