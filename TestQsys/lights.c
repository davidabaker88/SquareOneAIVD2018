#define switches (volatile char *) 0x2010
#define leds (char *) 0x2000
void main()
{ while (1){

int switchValues = (int) *switches;
if(switchValues > 128){
	int num1 = switchValues & 4;
	int num2 = (switchValues>>2)%4;
num2 = num2 + num1;
*leds = num2;
}
else{
*leds = *switches<<1;

}
}
}