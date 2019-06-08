// ######################################################################################
// #                                                                                    #
// #  This module is needed for the communication with the GOLDi infrastructure         #
// #                                                                                    #
// ######################################################################################

#include <avr/io.h>   
#include <stdint.h>
#include <avr/interrupt.h>
#include "UART0.h"
#include "GOLDiInterface.h"

// ######################################################################################
// #  This functions receives bytes from the GOLDi bus                                  #
// ######################################################################################
ISR(USART0_RX_vect)
{
    uint8_t Data = UDR0;
    GOLDiInterfaceNewData(Data);
}

// ######################################################################################
// #  This functions initialize the serial port 'UART0'                                 #
// ######################################################################################
void UART0_init()
{
    UBRR0L = (F_CPU / (BAUD * 16L) - 1);
    UCSR0B = ((1<<RXEN0) | (1<<TXEN0) | (1<<RXCIE0));
    sei();
}

// ######################################################################################
// #  This functions sends one byte to the GOLDi bus                                    #
// ######################################################################################
void UART0_put_char(char data)
{
    while (!(UCSR0A & (1<<UDRE0)));
    UDR0=data;
}