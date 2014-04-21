import spacebrew.*;
import processing.serial.*;
import cc.arduino.*;

String server="sandbox.spacebrew.cc";
String name="The Count of Monte Cristo";
String description ="";
int move = 0;

Spacebrew sb;

Arduino arduino;

void setup() {
  size(360, 200);

  println(Arduino.list());
  
  sb = new Spacebrew( this );
   sb.connect(server, name, description );
   arduino = new Arduino(this, "/dev/tty.usbmodem1421", 57600);

  sb.addPublish( "button_pressed", "boolean", true ); 

  sb.addSubscribe( "back_left", "boolean" );
  sb.addSubscribe( "back_right", "boolean");
  sb.addSubscribe( "front_left", "boolean");
  sb.addSubscribe( "front_right", "boolean");
  
  // Configure digital pins 6, 9, 10, and 11 to control servo motors.
  arduino.pinMode(11, Arduino.SERVO);
  arduino.pinMode(10, Arduino.SERVO);
  arduino.pinMode(9, Arduino.SERVO);
  arduino.pinMode(6, Arduino.SERVO);
  
}

void draw() {
  background(0);
  
}

void onBooleanMessage( String name, boolean value ){
  println("got bool message " + name + " : " + value);
  if(name.equals("back_left") && value == true){
   arduino.servoWrite(9, constrain(0, 0, 180)); 
  } else{
    arduino.servoWrite(9, constrain(360, 0, 180));
  }
  if(name.equals("front_left") && value == true){
     arduino.servoWrite(6, constrain(360, 0, 180)); 
  } else{
    arduino.servoWrite(6, constrain(0, 0, 180));
  }
    if(name.equals("front_right") && value == true){
     arduino.servoWrite(11, constrain(0, 0, 180)); 
  } else{
    arduino.servoWrite(11, constrain(360, 0, 180));
  }
   if(name.equals("back_right") && value == true){
     arduino.servoWrite(10, constrain(0, 0, 180)); 
  } else{
    arduino.servoWrite(10, constrain(360, 0, 180));
  }
    
}
