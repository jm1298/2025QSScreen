#import crap!!
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine
from PySide6.QtCore import QObject, Slot, Signal, QTimer, QUrl

import zmq

import os
import sys
from datetime import datetime

#find where the script is running from
script_dir = os.path.dirname(os.path.realpath(__file__))
os.chdir(script_dir)

#import zmq   #comment out for windows
import json
 #comment out for windows
context = zmq.Context()
socket = context.socket(zmq.PULL)
socket.connect("tcp://127.0.0.1:5555")

rpm_value = 0

global selfTestVal
selfTestVal = 0

voltsCalc = None


class MainWindow(QObject):
    def __init__(self):
        QObject.__init__(self)


        
        # Define timer.
        # self.timer = QTimer()
        # self.timer.timeout.connect(self.updateData)
        
        # self.timer.start()

        #define a QTimer
        #   What is a QTimer? It recusively calls a function. In this case, it
        #   calls the "general" function, which updates most display values.
        #   Update speed: quick (calls very often)
        self.timer = QTimer()                               #make the timer
        #self.timer.setInterval(1000)                       #enable if wanted. Probably do not need
        self.timer.timeout.connect(self.updateData)         #connect the time
        self.timer.start()                                  #start the timer
        
        #define the Temperature QTime
        #   Originally (v2024) used to only update CPU temp. Could be used for
        #   more.
        #   Update speed: slow (does not call often)
        self.tempTimer = QTimer()
        self.tempTimer.setInterval(5000)                    #set timer interval. Probably milliseconds?
        self.tempTimer.timeout.connect(self.updateTemp)
        self.tempTimer.start()


    ### Header Gauges ###
    updateIntakeTemp = Signal(str)
    updateTime = Signal(str)
    updateDate = Signal(str)
    updateDrivemode = Signal(int)

    ### Home Screen Gauges ###
    updateGearSelector = Signal(int)
    updateRPM = Signal(int)
    updateEngTemp = Signal(int)
    updateFuelLevel = Signal(int)
    updateHydPSI = Signal(int)
    updateHydTemp = Signal(int)
    updateHydTempRaw = Signal(int)
    updateSpeedo = Signal(int)
    updateCEL = Signal(str)
    updateOilPress = Signal(str)
    updateBattLight = Signal(str)
    updateWarnLight = Signal(str)
    updateInfoIcon = Signal(str)
    updateTurnRight = Signal(str)
    updateTurnLeft = Signal(str)


    ### Drivetrain Gauges ###
    updateHydHighPressA = Signal(int)
    updateHydHighPressB = Signal(int)
    updateChargePress = Signal(int)
    updateSwashPOS = Signal(int)
    updateSwashLimit = Signal(int)
    updateHydControlCurrent = Signal(int)
    updateHydMotorRPM = Signal(int)
    updateHydFluidLevel = Signal(str)
    hydFluidLevelRaw = Signal(int)

    ### Engine Gauges ###
    updateEngLoad = Signal(int)
    updateAccelPos = Signal(int)
    updateFuelRate = Signal(int)
    updateOilPressGauge = Signal(int)
    updateBattVolts = Signal(int)
    updateBarometric = Signal(int)
    
    ### Data View ###
    updateHydTempVolts = Signal(int)
    updateFuelVolts = Signal(int)

    updateAccelPosRaw = Signal(int)
    updateEngLoadRaw = Signal(int)
    updateRPMraw = Signal(int)
    updateFuelRateRaw = Signal(int)
    updateIntakeTempRaw = Signal(int)
    updateBattVoltsRaw = Signal(int)
    updateBarometricRaw = Signal(int)

    updateSteerVelocityRaw = Signal(int)
    updateRightTurn = Signal(int)
    updateeLeftTurn = Signal(int)

    updateBrakeSwitch = Signal(int)

    updateSteerCurrent = Signal(int)
    updatep1volts = Signal(int)
    updatep2volts = Signal(int)
    
    ######## Set Up Slots and qTimers ########
    @Slot(str)
    def updateTemp(self):
        self.updateTime.emit(datetime.now().strftime("%H:%M"))      #update time
        self.updateDate.emit(datetime.now().strftime("%m/%d/%Y"))   #update date

    @Slot(str)
    def exitScreen(self, value):
        sys.exit(0)
        


    @Slot(str)
    def updateData(self):
         #comment out for windows
        global rpm_value

        try:
            message = socket.recv_json(flags=zmq.NOBLOCK)
            #if message["id"] == 0x100:  # Modify based on your CAN message structure
                #rpm_value = message["data"][1] * 10  # Example conversion
                #print(f"RPM: {rpm_value}")

            ########## Front CCM ##########
            if message["id"] == 0x18FEF702:
                hydTempRaw = (message["data"][0])                                   #Hydraulic temperature
                hydTemp = (hydTempRaw * (9/5) +32)                                  #Convert to Fahrenheit    
                #print("Hyd Temp: ", hydTemp)
                self.updateHydTempRaw.emit(hydTempRaw)
                self.updateHydTemp.emit(hydTemp)

                hydLevelRaw = message["data"][1]                                    #Hydraulic fluid level
                self.hydFluidLevelRaw.emit(hydLevelRaw)
                if hydLevelRaw == 0:
                    self.updateHydFluidLevel.emit("Low")
                elif hydLevelRaw == 1:
                    self.updateHydFluidLevel.emit("Okay")

                fuelLevel = message["data"][2]                                      #Fuel level
                #print("Fuel Level: ", fuelLevel)
                self.updateFuelLevel.emit(fuelLevel)

                hydTempVoltage = message["data"][3] + (message["data"][4] << 8)     #Hyd temp voltage
                #print("Hydraulic Temp Voltage: ", (hydTempVoltage/100))
                self.updateHydTempVolts.emit(hydTempVoltage)

                fuelVoltage = message["data"][5] + (message["data"][6] << 8)        #Fuel voltage
                self.updateFuelVolts.emit(fuelVoltage)
                


            ########## Mid CCM ##########
            if message["id"] == 0x010F01A0A:  #Mid CCM ID
                hydMotorSpeed = message["data"][0] + (message["data"][1] << 8)      #Hydraulic motor speed
                #print("Hyd Motor Speed: ", hydMotorSpeed)
                self.updateHydMotorRPM.emit(hydMotorSpeed)
                
                wheelSpeed = message["data"][2] + (message["data"][3] << 8)         #Wheel speed
                #print("Wheel Speed: ", wheelSpeed)
                self.updateSpeedo.emit(wheelSpeed)

                brakeSwitch = message["data"][4]                                    #brake switch
                self.updateBrakeSwitch.emit(brakeSwitch)
                


            ########## Pump ECU ##########
            if message["id"] == 0x10F01A09: #Pump ECU ID
                hydPressA = message["data"][0] + (message["data"][1] << 8)          #Hydraulic Pressure A
                #print("Hyd Press A: ", hydPressA)
                self.updateHydHighPressA.emit(hydPressA)

                hydPressB = message["data"][2] + (message["data"][3] << 8)          #Hydraulic Pressure A
                #print("Hyd Press B: ", hydPressB)
                self.updateHydHighPressB.emit(hydPressB)

                steerCurrent = message["data"][4] + (message["data"][5] << 8)       #steering current
                self.updateSteerCurrent.emit(steerCurrent)

                pumpCurrent = message["data"][6] + (message["data"][7] << 8)        #pump control current
                #print("Pump Current: ", pumpCurrent)
                self.updateHydControlCurrent.emit(pumpCurrent)

            if message["id"] == 0x18FEF701:                                         #swashplate position
                swashPOS = message["data"][0]
                #print("Swashplate Position: ", swashPOS)
                self.updateSwashPOS.emit(swashPOS)

                swashLimit = message["data"][1]                                     #swashplate limit
                #print("Swashplate Limit: ", swashLimit)
                self.updateSwashLimit.emit(swashLimit)

                p1volts = message["data"][2] + (message["data"][3] << 8)            #p1 volts
                self.updatep1volts.emit(p1volts)

                p2volts = message["data"][4] + (message["data"][5] << 8)            #p2 volts
                self.updatep2volts.emit(p2volts)

                driveMode = message["data"][6]                                      #drive mode
                #print("Drive Mode: ", driveMode)
                self.updateDrivemode.emit(driveMode)

            ######### Steering ECU #########
            if message["id"] == 0xCFD9201:
                steerVelocityRaw = message["data"][0] + (message["data"][1] << 8)   #steering velocity
                self.updateSteerVelocityRaw.emit(steerVelocityRaw)

                rightTurn = message["data"][2]                                      #right turn signal
                self.updateRightTurn.emit(rightTurn)

                lefTturn = message["data"][3]                                       #left turn signal
                self.updateeLeftTurn.emit(lefTturn)

            ########## Engine ECU ##########
            if message["id"] == 0x0CF00400:                                         #engine rpm
                raw_rpm = message["data"][3] + (message["data"][4] << 8)
                self.updateRPMraw.emit(int(raw_rpm))
                rpm = raw_rpm * 0.125
                #print("RPM: ", rpm)
                self.updateRPM.emit(int(rpm)) 
                     
            if message["id"] == 0x18FEF700:                                         #battery voltage
                raw_volts = message["data"][4] + (message["data"][5] << 8)
                self.updateBattVoltsRaw.emit(raw_volts)
                volts = raw_volts * 0.05
                #print("Volts: ", volts)
                self.updateBattVolts.emit(volts*10)

                if volts < 11.5:
                    self.updateBattLight.emit("On")
                else:
                    self.updateBattLight.emit("Off")

            if message["id"] == 0x18FEF500:                                         #intake manifold pressure 
                raw_barometric = message["data"][0]
                self.updateBarometricRaw.emit(raw_barometric)
                barometric = raw_barometric * 0.5 // 3.386
                #print("Barometric: ", barometric)
                self.updateBarometric.emit(barometric*100)

            if message["id"] == 0x18FEEE00:                                         #intake air temp
                raw_intakeTemp = message["data"][0]
                self.updateIntakeTempRaw.emit(raw_intakeTemp)
                intakeTemp = f"{((raw_intakeTemp - 40) * (9/5)) + 32:.1f}"
                intIntakeTemp = int(((raw_intakeTemp - 40) * (9/5)) + 32)
                #print("Intake Temp: ", intakeTemp)
                self.updateIntakeTemp.emit(str(intakeTemp) + " °F")
                self.updateEngTemp.emit(intIntakeTemp)

            if message["id"] == 0x0CF00300:                                         #accelerator position
                accelPosRaw = message["data"][0]
                self.updateAccelPosRaw.emit(accelPosRaw)
                accelPos = accelPosRaw * 0.004
                #print("Accel Pos: ", accelPos)
                self.updateAccelPos.emit(int(accelPos))

                engLoadRaw = message["data"][2]*100                                     #engine load
                self.updateEngLoadRaw.emit(engLoadRaw)
                engLoad = engLoadRaw * 0.01
                print("Engine Load: ", engLoad)
                self.updateEngLoad.emit(int(engLoad))

            if message["id"] == 0x18FEF200:                                         #fuel rate
                fuelRateRaw = message["data"][0] + (message["data"][1] << 8)
                self.updateFuelRateRaw.emit(fuelRateRaw)
                fuelRate = fuelRateRaw * 0.05
                #print("Fuel Rate: ", fuelRate)
                self.updateFuelRate.emit(int(fuelRate))

            if message["id"] == 0x18FD0700:                                         #oil pressure
                oilPress = message["data"][1]
                #print("Oil press status:", oilPress)

                bitval = (oilPress >> 3) & 0x01
                print("Oil press bit value:", bitval)

                if oilPress == 0:
                    self.updateOilPressGauge.emit(63)
                    #self.updateOilPress.emit("Off")
                else:
                    self.updateOilPressGauge.emit(63)
                    #self.updateOilPress.emit("On")


    


                

        except zmq.Again:
            pass  # No new data
            
        
        ### Header Gauges ###
        
        #self.updateIntakeTemp.emit("??" + " °F")                    #update intake temp
        #self.updateDrivemode.emit(1)
        

        self.updateCEL.emit("Off")                  #Home
        self.updateOilPress.emit("Off")             #Home                       just on/off, use other value for engine page gauge
        #self.updateBattLight.emit("On")            #Home
        self.updateWarnLight.emit("Off")            #Home
        self.updateInfoIcon.emit("Off")             #Home

        #-Gauges----------------------------        #-where used?-------------
        #self.updateRPM.emit(int(0))              #Home, engine, drivetrain
        self.updateGearSelector.emit(int(1))        #Home
        #self.updateEngTemp.emit(int(69))            #Home, engine
        #self.updateFuelLevel.emit(int(0))          #Home

        #self.updateHydTemp.emit(int(0))            #Home, drivetrain
        #self.updateSpeedo.emit(int(0))              #Home, left bar
        
        self.updateTurnRight.emit("Off")            #Home
        self.updateTurnLeft.emit("Off")             #Home
        
        ### Drivetrain Gagues ###
        #self.updateHydHighPressA.emit(0)         #Drivetrain, home
        #self.updateHydHighPressB.emit(0)         #Drivetrain
        self.updateChargePress.emit(0)            #Drivetrain
        #self.updateSwashPOS.emit(0)                #Drivetrain
        #self.updateSwashLimit.emit(0)
        #self.updateHydControlCurrent.emit(0)
        #self.updateHydMotorRPM.emit(0)
        #self.updateHydFluidLevel.emit("Okay")


        ### Engine Gauges ###
        #self.updateEngLoad.emit(0)                 #Engine, Drivetrain
        #self.updateAccelPos.emit(0)                #Engine
        #self.updateFuelRate.emit(0)                #Engine
        #self.updateOilPressGauge.emit(0)          #Engine
        #if voltsCalc is not None:
        #    self.updateBattVolts.emit(voltsCalc)              #Engine
        #self.updateBattVolts.emit(volts)              #Engine
        #self.updateBarometric.emit(301)            #Engine

        



app = QGuiApplication(sys.argv)
engine = QQmlApplicationEngine()


"""
main = MainWindow()
engine.rootContext().setContextProperty("backend", main)
#Load QML File
qml_file = "main.qml"
engine.load(QUrl.fromLocalFile(qml_file))
if not engine.rootObjects():
    sys.exit(-1)
sys.exit(app.exec())
"""




main = MainWindow()
engine.rootContext().setContextProperty("backend", main)
#Load QML File
qml_file = "main.qml"
engine.load(QUrl.fromLocalFile(qml_file))
if not engine.rootObjects():
    sys.exit(-1)
sys.exit(app.exec())


while 1 > 0:
    onUpdateTemperature(5)