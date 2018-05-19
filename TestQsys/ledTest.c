#define switches (volatile unsigned int *) 0x41100
#define LEDs (volatile unsigned int *) 0x410f0
#define encoderInCM (volatile unsigned int *) 0x410e0
#define targetDirection (unsigned int *) 0x41060
#define FRSensorInCM (volatile unsigned int *) 0x410d0
#define FLSensorInCM (volatile unsigned int *) 0x410c0
#define RSensorInCM (volatile unsigned int *) 0x410a0
#define LSensorInCM (volatile unsigned int *) 0x410c0
#define BRSensorInCM (volatile unsigned int *) 0x41070
#define BLSensorInCM (volatile unsigned int *) 0x41090
#define driveSpeedPercentage (unsigned int *) 0x41080
#define reverse (unsigned int *) 0x41020
#define challengeSelect (volatile unsigned int *) 0x41000
#define redLight (unsigned int *) 0x41050
#define yellowLight (unsigned int *) 0x41040
#define greenLight (unsigned int *) 0x41030
#define encoderReset (unsigned int *) 0x41010


void StartSteps();
void Wait(float Seconds);
void ResetDirection();
float GetSteps(int Format);
void Move(float Speed);
int TurnData(int Degree, int Output);


void main()
{
	*LEDs = 63; 

//Steps function
int currentEncoderValue;
int currentChallenge = 20;
int setUp;
//Challenge1 specifics
int CurrentEvent = -1;



	while (1)
	{
		
		//C test
		*driveSpeedPercentage = 60;
		*reverse = 1;
		*encoderReset = 1;
		*targetDirection = 90;
		//Check if challangeChange
		if(currentChallenge !=  *challengeSelect && 1 ==3)
		{
			currentChallenge = *challengeSelect;
			CurrentEvent = 0;
			setUp = 0;
		}
			//Challenge 1
			if(*challengeSelect == 0 && 1 == 3)
			{
				//Run one time or Event 0
				if(setUp == 0)
				{
					Wait(5);
					StartSteps();
					*driveSpeedPercentage = 50;
					setUp = 1;
				}
				//Check If meters reached
				if((GetSteps(1) >= 2 && CurrentEvent == 0) || (CurrentEvent == 1 && GetSteps(1) >= TurnData(90, 1)))
				{
					CurrentEvent++;
					//Event 1
					if(CurrentEvent == 1)
					{
						StartSteps();
						*targetDirection = 90;
						*driveSpeedPercentage = 25;
					}
					//Event 2
					if(CurrentEvent == 2)
					{
						*driveSpeedPercentage = 0;
						currentChallenge = -1;
					}	

				}
			}
			//Challenge 2
			if(*challengeSelect == 1)
			{
				//Checks to see if anything is within 1 meter
				if(*FRSensorInCM * 100 > 1 && *FLSensorInCM * 100 > 1)
				{
					//Runs if anything is more than 1 meters
					*driveSpeedPercentage = 35;
				}
				else{*driveSpeedPercentage = 0;}
			}
			//Challenge 3
			if(*challengeSelect == 2)
			{
				//Setup robot
				if(setUp == 0)
				{
					StartSteps();
					CurrentEvent = 0;
					setUp = 1;
				}
				//Event 0 drive forward
				if(CurrentEvent == 0)
				{
					*driveSpeedPercentage = 25;
					//Event 0 complete
					if(GetSteps(1) >= 3 - TurnData(270,1))
					{
						CurrentEvent++;
						StartSteps();
					}
				}
				//Event 1 turn left
				if(CurrentEvent == 1)
				{
					*targetDirection = 270;
					*driveSpeedPercentage = 35;
					//Event 1 complete
					if(GetSteps(1) >= 4 - TurnData(270, 1))
					{
						CurrentEvent++; 
					}
				}
				//Event 2 turn around
				if(CurrentEvent == 2)
				{
					*targetDirection = 90;
					*driveSpeedPercentage = 25;
					//Event 2 complete
					
				}
			}
	}
	
}

int TurnData(int Degree, int Output)
{
	//Get total distance until target reached
	if(Output == 0)
	{
		return 0; //Total distance travled until target direction reached
	}
	//Get distance overshot when target direction achieved
	if(Output == 1)
	{
		return 0; //Total distance forward it moved to achieve target direcition, substract this distance from target distances
	}
	//Get distance travled without turn interference from turning point to target direction
	if(Output == 2)
	{
		return 0; //Gets distance traveled from turning point and target direction  with out extra distance from turning, smaller than turning
	}
}
void Move(float Speed)
{
	if(Speed > 0)
	{
		*reverse = 0;
		*driveSpeedPercentage = Speed;
	}
	else if(Speed < 0)
	{
		*reverse = 1;
		*driveSpeedPercentage = (Speed * -1);
	}
	else{
		*reverse = 0;
		*driveSpeedPercentage = 0;
	}
}
void StartSteps()
{
	*encoderReset = 1;
}
float GetSteps(int Format)
{
	*encoderReset = 0;
	//Centimeters
	if(Format == 0)
	{
		return *encoderInCM;
	}
	//Meters
	if(Format == 1)
	{
		return (*encoderInCM) * 0.01;
	}
}

void ResetDirection(){
	//resetFunction = 0;
	//resetFunction = 1;
}

void Wait(float Seconds)
{
	ResetDirection();
	int Total = Seconds * 25000000;		
	while(Seconds < Total)
	{Seconds++;}
}
