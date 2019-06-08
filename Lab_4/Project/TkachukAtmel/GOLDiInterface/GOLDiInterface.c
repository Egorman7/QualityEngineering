// ######################################################################################
// #                                                                                    #
// #  This module is needed for the communication with the GOLDi infrastructure         #
// #                                                                                    #
// ######################################################################################

#include <stdint.h>
#include <util/delay.h>

#include "GOLDiInterface.h"
#include "UART0.h"

#include "../UserDesign/UserDesign.h"

uint8_t *GOLDiInterfaceOutputBuffer;
uint8_t *GOLDiInterfaceInputBuffer;

uint8_t ReceiveIndex;
uint8_t TmpBuffer[6];

// ######################################################################################
// #  This function initializes the bus interface                                       #
// ######################################################################################
void GOLDiInterfaceInit(void)
{
    UART0_init();
    
    GOLDiInterfaceOutputBuffer = (uint8_t *)&Actuators;
    GOLDiInterfaceInputBuffer = (uint8_t *)&Sensors;
    ReceiveIndex = 0;
}
   
// ######################################################################################
// #  This function sends data (actuators) to the GOLDi bus                             #
// ######################################################################################
void GOLDiInterfaceSendData(void)
{
    UART0_put_char(0xFF);
    
    for (uint8_t i=0; i<6;i++)
    {
        if(GOLDiInterfaceOutputBuffer[i] >= 0x80)
        {
            UART0_put_char(0x80);
            UART0_put_char(GOLDiInterfaceOutputBuffer[i]-0x80);
        }
        else
        {
            UART0_put_char(0);
            UART0_put_char(GOLDiInterfaceOutputBuffer[i]);
        }
    }
    
    UART0_put_char(0xFE);
}

// ######################################################################################
// #  This functions receives data (sensors) from the GOLDi bus                         #
// ######################################################################################
void GOLDiInterfaceNewData(uint8_t Data)
{
    switch(Data)
    {
        case 0xFF:
            //start data transfer
            ReceiveIndex=0;
            break;
        case 0xFE:
            //data transfer ended
            for (uint8_t i=0; i<6;i++)
                GOLDiInterfaceInputBuffer[i] = TmpBuffer[i];
            ReceiveIndex=0;
            break;
        default:
            if(ReceiveIndex%2 == 1)
                TmpBuffer[ReceiveIndex/2]+= Data;
            else
                TmpBuffer[ReceiveIndex/2] = Data;
            ReceiveIndex++;
            break;
    }
}