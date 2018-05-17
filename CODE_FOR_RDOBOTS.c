
#define encoderInCM (volatile char *) 0x20e0
#define targetDirection (char *) 0x20f0
#define FRSensorInCM (volatile char *) 0x20b0
#define FLSensorInCM (volatile char *) 0x20a0
#define RSensorInCM (volatile char *) 0x2090
#define LSensorInCM (volatile char *) 0x2080
#define BRSensorInCM (volatile char *) 0x2060
#define BLSensorInCM (volatile char *) 0x2070
#define driveSpeedPercentage (char *) 0x20e0
#define reverse (char *) 0x20c0
//#define challengeSelect (volatile char *)
#define leftMagnetic (volatile char *) 0x250
#define rightMagnetic (volatile char *) 0x2040
#define redLight (char *) 0x2000
#define yellowLight (char *) 0x2010
#define greenLight (char *) 0x2020
//#define resetFunction (char *) 0x
#define encoderReset (char *) 0x2030

void main()
{ 
//Steps function
/*int currentEncoderValue;
int currentChallenge = -1;
bool setUp;
//Challenge1 specifics
int c1CurrentEvent = 0;
*/
	while (1)
	{
		//C test
		*driveSpeedPercentage = 63;
		/*
		//Check if challangeChange
		if(currentChallenge != challengeSelect)
		{
			currentChallenge = challangeChange;
			c1MeterEvent = 0;
			setUp = false;
		}
			//Challenge 1
			if(challengeSelect == 0)
			{
				//Run one time or Event 0
				if(setUp == false)
				{
					Wait(5);
					StartSteps();
					driveSpeedPercentage = 50;
				}
				//Check If meters reached
				if((GetSteps("Meters") >= 2 && c1CurrentEvent == 0) || (c1CurrentEvent == 1 && GetSteps("Meters") >= 3.5))
				{
					c1CurrentEvent++;
					//Event 1
					if(c1CurrentEvent == 1)
					{
						StartSteps();
						targetDirection = 90;
						driveSpeedPercentage = 25;
					}
					//Event 2
					if(c1CurrentEvent == 2)
					{
						driveSpeedPercentage = 0;
						challangeSelect = -1;
					}	

				}
				setUp = true;
			}*/
	}
	
}/*
void Move(float Speed)
{
	if(Speed > 0)
	{
		reverse = false;
		driveSpeedPercentage = Speed;
	}
	else if(Speed < 0)
	{
		reverse = true;
		driveSpeedPercentage = (Speed * -1);
	}
	else{
		reverse = false;
		driveSpeedPercentage = 0;
	}
}
void StartSteps()
{
	encoderReset = 1;
}
float GetSteps(string Format)
{
	encoderReset = 0;
	//Centimeters
	if(Format == "Centimeters")
	{
		return encoderInCM;
	}
	//Meters
	if(Format == "Meters")
	{
		return (encoderInCM) * 0.01;
	}
}
void ResetDirection(){
	resetFunction = 0;
	resetFunction = 1;
}
void Wait(float Seconds){	
{
	ResetDirection();
	int Total = Seconds * 25000000;	
	while(Seconds < Total)
	{Seconds++;}
}

*/



