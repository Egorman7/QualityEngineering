// ######################################################################################
// #                                                                                    #
// #  This module implements the users design                                           #
// #                                                                                    #
// ######################################################################################

#include "GOLDiInterface/GOLDiInterface.h"
#include "UserDesign/UserDesign.h"

int main(void)
{
    GOLDiInterfaceInit();                                                                       // Initialize the bus interface
    StateMachineInit();                                                                         // Initialize the finite state machine
    
    while(1)
    {
        StateMachineUpdate();                                                                   // Update the FSM
        GOLDiInterfaceSendData();                                                               // Send new actuators to the GOLDi bus
    }
}