// ######################################################################################
// #                                                                                    #
// #  This module implements the users design                                           #
// #                                                                                    #
// ######################################################################################

#ifndef _USERDESIGN_H
    #define _USERDESIGN_H

    #include "../Main.h"
    extern void StateMachineInit(void);                                                     // This function inits the state machine
    extern void StateMachineUpdate(void);                                                   // This function updated the state machine

// ######################################################################################
// #  Add a new state for state maschine here                                           #
// ######################################################################################
    typedef enum
    {
		GOING_UP,
		GOING_DOWN,
		ON_1,
		ON_2,
		ON_3,
		DOOR1_OPEN,
		DOOR1_CLOSE,
		DOOR2_OPEN,
		DOOR2_CLOSE,
		DOOR3_OPEN,
		DOOR3_CLOSE
    } AutomatStates_t;
    
#endif 