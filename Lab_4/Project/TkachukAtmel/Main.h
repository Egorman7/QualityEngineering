// ######################################################################################
// #                                                                                    #
// #  This module selects the controlled physical system                                #
// #                                                                                    #
// ######################################################################################

#ifndef MAIN_H_
    #define MAIN_H_

// ######################################################################################
// #  Uncomment the controlled physical system                                          #
// ######################################################################################

    //#define PSPU_3AxisPortal
    //#define PSPU_ProductionCell
    #define PSPU_Elevator3Floor
    //#define PSPU_Elevator4Floor
    //#define PSPU_Elevator4FloorClassic
    //#define PSPU_Pump
    //#define PSPU_Warehouse
    //#define PSPU_Maze
    //#define PSPU_DigitalDemoBoardPSPU

    
// ######################################################################################
// #  Physical system specific libraries -- DO NOT CHANGE ANYTHING BELOW! --            #
// ######################################################################################

    #ifdef PSPU_3AxisPortal
        #include "PhysicalSystems/3AxisPortal.h"
    #endif

    #ifdef PSPU_ProductionCell
        #include "PhysicalSystems/ProductionCell.h"
    #endif

    #ifdef PSPU_Elevator3Floor
        #include "PhysicalSystems/Elevator3Floor.h"
    #endif

    #ifdef PSPU_Elevator4Floor
        #include "PhysicalSystems/Elevator4Floor.h"
    #endif
    
    #ifdef PSPU_Elevator4FloorClassic
        #include "PhysicalSystems/Elevator4Floor.h"
    #endif

    #ifdef PSPU_Pump
        #include "PhysicalSystems/Pump.h"
    #endif

    #ifdef PSPU_Warehouse
        #include "PhysicalSystems/Warehouse.h"
    #endif

    #ifdef PSPU_Maze
        #include "PhysicalSystems/Maze.h"
    #endif
    
    #ifdef PSPU_DigitalDemoBoardPSPU
        #include "PhysicalSystems/DigitalDemoBoardPSPU.h"
    #endif
    
#endif