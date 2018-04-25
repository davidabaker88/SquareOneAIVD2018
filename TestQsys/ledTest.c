#define switches (volatile char *) 0x2010
#define leds (char *) 0x2000
void main()
{ while (1)
*leds = (*switches>>1); //| (*switches>>7);
}
