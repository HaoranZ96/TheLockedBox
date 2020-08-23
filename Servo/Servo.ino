#include <Servo.h>

Servo servo1;
Servo servo2;

int angel1;
int angel2;

int generalDelay;
int servoDelay;
int servoSelect;

void setup() {

  servo1.attach(9);
  servo2.attach(10);
  servo1.write(0);
  servo2.write(0);

}

void loop() {

  generalDelay = random(500,5000);
  servoDelay = random(200,1000);
  servoSelect = (int)random(0,2);
  angel1 = random(120,180);
  angel2 = random(120,180);

  if (servoSelect == 0) {
      servo1.write(angel1);
      delay(servoDelay);
      servo2.write(angel2);
    } else if (servoSelect == 1) {
      servo1.write(angel1);
    } else {
      servo2.write(angel2);
    }

  delay(generalDelay);
  
}
