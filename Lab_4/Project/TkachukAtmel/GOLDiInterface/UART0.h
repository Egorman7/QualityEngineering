// ######################################################################################
// #                                                                                    #
// #  This module is needed for the communication with the GOLDi infrastructure         #
// #                                                                                    #
// ######################################################################################

#ifndef _UART0_H
    #define _UART0_H

    #define BAUD    250000

    extern void UART0_init();
    extern void UART0_put_char(char data);

#endif