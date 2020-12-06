#include <avr/io.h>

int main()
{

    uint8_t in = PINB;
    if (in & (PINB))
    {
        PORTC = 0x05;
    }
    
    in = PINB & (1 << 2);
    
    if (in & (PINB))
    {
        PORTC = 0x50;
    }
}

