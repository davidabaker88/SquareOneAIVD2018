#include <gyro.h>
#include <dGPS.h>
#include <PID_v1.h>
#include <Adafruit_BNO055.h>
#include <Adafruit_Sensor.h>
#include <buffer.h>

/*Input
 * TD 52:44
 * WheelPosIn 15
 * ResetPos 53
 */

 /*Output
  * MD 22
  * MPWM 2
  */

void steering(float degreeIn);

const double STEERING_P = 5.0;
const double STEERING_I = 0;
const double STEERING_D = 0;

const int MD_PIN = 22;
const int MPWM_PIN = 2;
const int WHEELPOSIN_PIN = 15;
const int RESETPOS_PIN = 53;
const int TD_PIN[] = {44, 45, 46, 47, 48, 49, 50, 51, 52};

double in, out, sp;
double SETPOINT = 0;
double pidIn;
PID pid{ &pidIn, &out, &SETPOINT, STEERING_P, STEERING_I, STEERING_D, DIRECT};

bool enablePID;

const int GYRO_SENSOR_ID = 55;

Gyro gyro{ GYRO_SENSOR_ID };

dGPS gps;

void setup() {
  pinMode(LED_BUILTIN, OUTPUT);
  pinMode(MD_PIN, OUTPUT);
  pinMode(MPWM_PIN, OUTPUT);
  pinMode(WHEELPOSIN_PIN,INPUT);
  pinMode(RESETPOS_PIN, INPUT);
   for(int i = 44; i < 52; i++)
    {
        pinMode(i, INPUT);
    }
  int targetDirection = 0;
  
 int length = sizeof(TD_PIN) / sizeof(TD_PIN[0]);

  int num = 0;
  for (int i = 0; i < length; i++)
    if (digitalRead(TD_PIN[i]) == 1)
      num += lround(pow(2, i));

  targetDirection = num;
  
  sp = targetDirection;
  
  Serial.begin(9600);
  
  pid.SetMode(AUTOMATIC);
  pid.SetOutputLimits(-50, 50);
  
  enablePID = true;

  gyro.setup();
}

void loop() {
  if (digitalRead(RESETPOS_PIN) == HIGH){
    gyro.setOrientation(Gyro::kXAxis);
  }
  gyro.loop();

   if (enablePID)
  {
    in = gyro.getOrientation(Gyro::kXAxis);

    int wheelPos = (analogRead(WHEELPOSIN_PIN) - 512) / 9.76 ;

    if (abs(sp - in) <= 180)
      pidIn = sp - in;
    else pidIn = sp - in + 360;

    pid.Compute();
    steering(out, wheelPos);
  }
  Serial.print("sp: ");
  Serial.println(sp);
  Serial.print("in: ");
  Serial.println(in);
}

void steering(float degreeIn, int steeringPos){
  Serial.print("degreeIn: ");
  Serial.println(degreeIn);
  if ((steeringPos <= degreeIn + 1) && (steeringPos >= degreeIn - 1)){
  analogWrite(MPWM_PIN, 0);
 } else if(steeringPos >= degreeIn){
  analogWrite(MPWM_PIN, 255);
  digitalWrite(MD_PIN, LOW);
  Serial.print("Reverse");
  } else if(steeringPos <= degreeIn){
    analogWrite(MPWM_PIN, 255);
    digitalWrite(MD_PIN, HIGH);
    Serial.print("Forward");
  }
 }
 
 int ToDecimal(const int pins[], int length = -1)
{
  if (length == -1)
 length = sizeof(pins) / sizeof(pins[0]);

  int num = 0;
  for (int i = 0; i < length; i++)
    if (digitalRead(pins[i]) == 1)
      num += lround(pow(2, i));

  return num;
}

