// ######################################################################################
// #                                                                                    #
// #  This module defines sensors & actuators for physical system 'Elevator3Floor'      #
// #                                                                                    #
// ######################################################################################

#ifndef _ELEVATOR3FLOOR_H
    #define _ELEVATOR3FLOOR_H

// ######################################################################################
// #  48bit width sensor vector                                                         #
// ######################################################################################
    typedef struct
    {
        unsigned ElevatorOnFloor1:1;                                                        // x0
        unsigned ElevatorOnFloor2:1;                                                        // x1
        unsigned ElevatorOnFloor3:1;                                                        // x2
        unsigned ElevatorAboveFloor1:1;                                                     // x3
        unsigned ElevatorBelowFloor2:1;                                                     // x4
        unsigned ElevatorAboveFloor2:1;                                                     // x5
        unsigned ElevatorBelowFloor3:1;                                                     // x6
        unsigned Floor1DoorOpen:1;                                                          // x7
        unsigned Floor1DoorClosed:1;                                                        // x8
        unsigned Floor2DoorOpen:1;                                                          // x9
        unsigned Floor2DoorClosed:1;                                                        // x10
        unsigned Floor3DoorOpen:1;                                                          // x11
        unsigned Floor3DoorClosed:1;                                                        // x12
        unsigned LightBarrierFloor1:1;                                                      // x13
        unsigned LightBarrierFloor2:1;                                                      // x14
        unsigned Light_barrier_floor_3:1;                                                   // x15
        unsigned CallButtonFloor1:1;                                                        // x16
        unsigned CallButtonFloor2Up:1;                                                      // x17
        unsigned CallButtonFloor2Down:1;                                                    // x18
        unsigned CallButtonFloor3:1;                                                        // x19
        unsigned ElevatorControlFloor1:1;                                                   // x20
        unsigned ElevatorControlFloor2:1;                                                   // x21
        unsigned ElevatorControlFloor3:1;                                                   // x22
        unsigned ElevatorControlAlert:1;                                                    // x23
        unsigned ElevatorControlEmergencyStop:1;                                            // x24
        unsigned SimulationOverload:1;                                                      // x25
        unsigned Reserve0:1;                                                                // unused
        unsigned Reserve1:1;                                                                // unused
        unsigned Reserve2:1;                                                                // unused
        unsigned Reserve3:1;                                                                // unused
        unsigned Reserve4:1;                                                                // unused
        unsigned Reserve5:1;                                                                // unused
        unsigned int Reserve6;                                                              // unused
    } Sensor_t;          

// ######################################################################################
// #  48bit width actuator vector                                                       #
// ######################################################################################               
    typedef struct
    {
        unsigned DriveUpwards:1;                                                            // y0
        unsigned DriveDownwards:1;                                                          // y1
        unsigned DriveSlowly:1;                                                             // y2
        unsigned DoorFloor1Open:1;                                                          // y3
        unsigned DoorFloor1Close:1;                                                         // y4
        unsigned DoorFloor2Open:1;                                                          // y5
        unsigned DoorFloor2Close:1;                                                         // y6
        unsigned DoorFloor3Open:1;                                                          // y7
        unsigned DoorFloor3Close:1;                                                         // y8
        unsigned CallDisplayFloor1:1;                                                       // y9
        unsigned CallDisplayFloor2Upward:1;                                                 // y10
        unsigned CallDisplayFloor2Downward:1;                                               // y11
        unsigned CallDisplayFloor3Downward:1;                                               // y12
        unsigned IndicatorDisplayFloor1:1;                                                  // y13
        unsigned IndicatorDisplayFloor2:1;                                                  // y14
        unsigned IndicatorDisplayFloor3:1;                                                  // y15
        unsigned DriveDirectionDisplayDownward:1;                                           // y16
        unsigned DriveDirectionDisplayUpward:1;                                             // y17
        unsigned ElevatorControlIndicatorDisplayFloor1:1;                                   // y18
        unsigned ElevatorControlIndicatorDisplayFloor2:1;                                   // y19
        unsigned ElevatorControlIndicatorDisplayFloor3:1;                                   // y20
        unsigned ElevatorControlAlert:1;                                                    // y21
        unsigned ElevatorControlEmergencyStop:1;                                            // y22
        unsigned ElevatorControlOverload:1;                                                 // y23
        unsigned char Reserve0:1;                                                           // unused
        unsigned int Reserve1;                                                              // unused
    } Actuator_t;

    #define SensorPointer (uint8_t *)&Sensors
    #define ActuatorPointer (uint8_t *)&Actuators

    extern Sensor_t Sensors;
    extern Actuator_t Actuators;

#endif