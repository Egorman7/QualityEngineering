// ######################################################################################
// #                                                                                    #
// #  This module implements the users design                                           #
// #                                                                                    #
// ######################################################################################

#include <util/delay.h>
#include "UserDesign.h"

AutomatStates_t State;
int flag, open1, open2, open3;


// ######################################################################################
// #  This function initializes the finite state machine with start state               #
// ######################################################################################
void StateMachineInit(void)
{
    State = ON_1;
	flag = 1;
	open1 = open2 = open3 = 0;
}

// ######################################################################################
// #  This function updates the current state of the finite state machine               #
// ######################################################################################
void StateMachineUpdate(void)
{
	if(Sensors.ElevatorControlFloor1) {
		Actuators.ElevatorControlIndicatorDisplayFloor1 = 1;
		open1 = 1;}
	if(Sensors.ElevatorControlFloor2) {
		Actuators.ElevatorControlIndicatorDisplayFloor2 = 1;
		open2 = 1;}
	if(Sensors.ElevatorControlFloor3) {
		Actuators.ElevatorControlIndicatorDisplayFloor3 = 1;
		open3 = 1;}
    switch (State)
    {
		case ON_1:
			if(open1 == 1){
				State = DOOR1_OPEN;
			} else if(Sensors.Floor1DoorClosed) {
				Actuators.DoorFloor1Close = 0;
				Actuators.DriveUpwards = 1;
				State = GOING_UP;
				flag = 1;
			}
			break;
		case DOOR1_OPEN:
			if(Sensors.Floor1DoorClosed){
				Actuators.DoorFloor1Open = 1;
				State = DOOR1_CLOSE;
			}
			break;
		case DOOR1_CLOSE:
			_delay_ms(2000);
			Actuators.DoorFloor1Open = 0;
			if(Sensors.Floor1DoorOpen){
				Actuators.DoorFloor1Close = 1;
				_delay_ms(2000);
				Actuators.ElevatorControlIndicatorDisplayFloor1 = 0;
				open1 = 0;
				State = ON_1;
			}
			break;
		case ON_2:
			if(open2 == 1){
				State = DOOR2_OPEN;
			} else if(Sensors.Floor2DoorClosed){
				Actuators.DoorFloor2Close = 0;
				if(flag == 1) {
					Actuators.DriveUpwards = 1;
					State = GOING_UP;
				} else {
					Actuators.DriveDownwards = 1;
					State = GOING_DOWN;
				}
			}
			break;
		case DOOR2_OPEN:
			if(Sensors.Floor2DoorClosed){
				Actuators.DoorFloor2Open = 1;
				State = DOOR2_CLOSE;
			}
			break;
		case DOOR2_CLOSE:
			_delay_ms(2000);
			Actuators.DoorFloor2Open = 0;
			if(Sensors.Floor2DoorOpen){
				Actuators.DoorFloor2Close = 1;
				_delay_ms(2000);
				Actuators.ElevatorControlIndicatorDisplayFloor2 = 0;
				open2 = 0;
				State = ON_2;
			}
			break;
		case ON_3:
			if(open3 == 1){
				State = DOOR3_OPEN;
			} else if(Sensors.Floor3DoorClosed) {
				Actuators.DoorFloor3Close = 0;
				Actuators.DriveDownwards = 1;
				State = GOING_DOWN;
				flag = 0;
			}
			break;
		case DOOR3_OPEN:
			if(Sensors.Floor3DoorClosed){
				Actuators.DoorFloor3Open = 1;
				State = DOOR3_CLOSE;
			}
			break;
		case DOOR3_CLOSE:
			_delay_ms(2000);
			Actuators.DoorFloor3Open = 0;
			if(Sensors.Floor3DoorOpen){
				Actuators.DoorFloor3Close = 1;
				_delay_ms(2000);
				Actuators.ElevatorControlIndicatorDisplayFloor3 = 0;
				open3 = 0;
				State = ON_3;
			}
			break;
		case GOING_UP:
			if(Sensors.ElevatorOnFloor3){
				Actuators.DriveUpwards = 0;
				State = ON_3;
			}
			if(Sensors.ElevatorOnFloor2) {
				Actuators.DriveUpwards = 0;
				State = ON_2;
			}
			break;
		case GOING_DOWN:
			if(Sensors.ElevatorOnFloor1){
				Actuators.DriveDownwards = 0;
				State = ON_1;
			}
			if(Sensors.ElevatorOnFloor2) {
				Actuators.DriveDownwards = 0;
				State = ON_2;
			}
			break;
    }
}