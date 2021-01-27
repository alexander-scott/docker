#include <avr/io.h>

int main()
{
    PORTC = PINB ? 0x05 : 0;
    PORTC = PINB & (1 << 2) ? 0x50 : 1;
}
