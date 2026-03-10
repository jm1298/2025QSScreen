import QtQuick
import QtQuick.Window
import QtQuick.Controls 6.5
import "controls"
import QtQuick.Layouts 6.5
import "Icons"
import "Buttons"
import "Drivetrain"
import "Engine"
import "Settings"
import QtQuick.Window 2.15

Window {
    id: window
    width: 1920
    height: 1080
    visible: true
    title: qsTr("QS25 Display")
    visibility: "FullScreen"

    StackLayout {
        id: screens
        y: 100
        width: 1720
        height: 980
        anchors.right: rectangle.right
        anchors.bottom: rectangle.top
        anchors.leftMargin: -1922
        anchors.bottomMargin: -1080
        currentIndex: 0


        /*#################### Homepage ####################*/
        Image {
            id: homepage
            width: 100
            height: 100
            source: "../images/home_background_png.png"
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            fillMode: Image.Stretch

            RPMGuage {
                id: rPMGuage
                anchors.verticalCenter: parent.verticalCenter
                rotation: -2.5
                //rpmtimelineCurrentFrame: 1000
                anchors.verticalCenterOffset: 0
                anchors.horizontalCenterOffset: -260
                anchors.horizontalCenter: parent.horizontalCenter

                Component.onCompleted: {
                backend.updateRPM.connect((value) => {
                    //console.log("Received RPM:", value);
                    rpmtimelineCurrentFrame = value;  // Update gauge
                    });
                }
            }

            SpeedGuage {
                id: speedGuage
                anchors.verticalCenter: parent.verticalCenter
                speedTimelineCurrentFrame: 0
                rotation: 2.5
                anchors.horizontalCenterOffset: 260
                anchors.horizontalCenter: parent.horizontalCenter

                Component.onCompleted: {
                backend.updateSpeedo.connect((speedValue) => {
                    //console.log("Received speed:", speedValue);
                    speedTimelineCurrentFrame = speedValue;  // Update gauge
                    });
                }
                
            }

            GearIndicator {
                id: gearIndicator
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenterOffset: 0
                //currentGearTimelineCurrentFrame: 0
                anchors.verticalCenterOffset: 109
                anchors.horizontalCenter: parent.horizontalCenter

                Component.onCompleted: {
                backend.updateGearSelector.connect((gearValue) => {
                    //console.log("Received Gear:", gearValue);
                    currentGearTimelineCurrentFrame = gearValue;  // Update gauge
                    });
                }
            }

            ExhtTEmp {
                id: exhtTEmp
                y: 714
                anchors.left: parent.left
                anchors.bottom: parent.bottom
                anchors.leftMargin: 30
                anchors.bottomMargin: -20

                Component.onCompleted: {
                backend.updateEngTemp.connect((engTempValue) => {
                    //console.log("Received Eng Temp:", engTempValue);
                    exhaustTempCurrentFrame = engTempValue;  // Update gauge
                    });
                }
            }

            Row {
                id: row
                y: 0
                width: 470
                height: 80
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 60
                padding: 10
                spacing: 10
                anchors.horizontalCenter: parent.horizontalCenter

                InfoIcon {
                    id: infoIcon
                    width: 80
                    height: 80
                    state: "Off"
                }

                WarningIcon {
                    id: warningIcon
                    width: 80
                    height: 80
                    state: "On"

                    Component.onCompleted: {
                    backend.updateWarnLight.connect((warnLightValue) => {
                        warningIcon.state = warnLightValue;  // Update gauge
                        });
                    }
                }

                StopIcon {
                    id: batteryLight //was a stop icon in previous version, too lazy to rename file
                    width: 80
                    height: 80
                    focusPolicy: Qt.NoFocus
                    state: "On"

                    Component.onCompleted: {
                    backend.updateBattLight.connect((battLightValue) => {
                        batteryLight.state = battLightValue;  // Update gauge
                        });
                    }
                }

                OilIcon {
                    id: oilIcon
                    width: 80
                    height: 80
                    state: "On"

                    Component.onCompleted: {
                    backend.updateOilPress.connect((oilPressValue) => {
                        oilIcon.state = oilPressValue;  // Update gauge
                        });
                    }
                }

                CELicon {
                    id: cELicon
                    width: 80
                    height: 80
                    state: "On"

                    Component.onCompleted: {
                    backend.updateCEL.connect((celValue) => {
                        cELicon.state = celValue;  // Update gauge
                        });
                    }
                }


            }

            TurnSignalIcon {
                id: turnSignalIcon
                anchors.top: parent.top
                anchors.rightMargin: -822
                anchors.topMargin: 20
                anchors.horizontalCenterOffset: 200
                anchors.horizontalCenter: parent.horizontalCenter

                Component.onCompleted: {
                backend.updateTurnRight.connect((signalRightValue) => {
                    turnSignalIcon.state = signalRightValue;  // Update gauge
                    });
                }
            }

            TurnSignalIcon {
                id: turnSignalIcon1
                anchors.top: parent.top
                anchors.topMargin: 20
                rotation: 180
                anchors.horizontalCenterOffset: -200
                anchors.horizontalCenter: parent.horizontalCenter

                Component.onCompleted: {
                backend.updateTurnLeft.connect((signalLeftValue) => {
                    turnSignalIcon1.state = signalLeftValue;  // Update gauge
                    });
                }
            }

            Rectangle {
                id: rectangle122
                y: 643
                width: 200
                height: 100
                color: "#00ffffff"
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 140
                anchors.horizontalCenter: parent.horizontalCenter

                Image {
                    id: image13
                    width: 60
                    height: 60
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 0
                    source: "../images/Engine_Hour_Meter_ISO.png"
                    sourceSize.height: 100
                    sourceSize.width: 100
                    fillMode: Image.PreserveAspectFit
                }

                Text {
                    id: text26
                    width: 150
                    opacity: 1
                    color: "#494949"
                    text: qsTr("13.5")
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 65
                    font.pixelSize: 40
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    font.weight: Font.DemiBold
                }
            }
            
            FuelGauges {
                id: fuelGauges
                x: 43
                y: 64

                Component.onCompleted: {
                backend.updateFuelLevel.connect((fuelLevelValue) => {
                    //console.log("Received Eng Temp:", fuelLevelValue);
                    fuelLevelCurrentFrame = fuelLevelValue;  // Update gauge
                    });
                }
            }

            HydPress {
                id: hydPress
                x: 1390
                y: 64

                Component.onCompleted: {
                backend.updateHydHighPressA.connect((hydPSIvalue) => {
                    //console.log("Received Hydraulic PSI:", hydPSIvalue);
                    hydraulicPSICurrentFrame = hydPSIvalue;  // Update gauge
                    });
                }
            }

            HydTemp {
                id: hydTemp
                x: 1390
                y: 700

                Component.onCompleted: {
                backend.updateHydTemp.connect((hydTempValue) => {
                    //console.log("Received Hydraulic temp:", hydTempValue);
                    hydTempCurrentFrame = hydTempValue;  // Update gauge
                    });
                }
            }
        }


        /*#################### Light Page ####################*/
        Image {
            id: lightpage
            width: 100
            height: 100
            horizontalAlignment: Image.AlignHCenter
            verticalAlignment: Image.AlignBottom
            source: "../images/LightScreenBackroudn.png"
            sourceSize.height: 1080
            sourceSize.width: 1920
            Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
            Layout.rightMargin: 0
            Layout.fillWidth: false
            Layout.fillHeight: true
            Layout.leftMargin: 0
            fillMode: Image.Stretch

            /*LightModeSwitch {
                id: lightModeSwitch
                x: 1403
                y: 39
                focusPolicy: Qt.StrongFocus
                hoverEnabled: false
                checked: false
            }*/

            StackLayout {
                id: stackLayout
                width: 1359
                height: 757
                anchors.verticalCenter: parent.verticalCenter
                anchors.verticalCenterOffset: 50
                anchors.horizontalCenterOffset: -13
                currentIndex: lightModeSwitch.mode
                anchors.horizontalCenter: parent.horizontalCenter

                Image {
                    id: image11
                    source: "../images/tractorSideNew.png"
                    transformOrigin: Item.Center
                    fillMode: Image.PreserveAspectFit
                    anchors.horizontalCenter: lightpage.horizontalCenter



                    FrontHeadlightButton {
                        id: frontHeadlightButton
                        x: 734
                        y: 282
                        memorystate: false

                        Connections {
                            target: frontHeadLightButton
                            onClicked:backend.frontHeadLightButtonPressed(frontHeadlightButton.memorystate)
                        }

                        RunningLightButton {
                            id: runningLightButton
                            x: 0
                            y: 95
                            memorystate: false

                            Connections {
                                target:runningLightButton
                                onClicked:backend.runningLightButtonPressed(runningLightButton.memorystate)
                            }
                        }

                        UnderGlowButton {
                            id: underGlowButton
                            x: 0
                            y: 329
                            memorystate: false

                            Connections {
                                target: underGlowButton
                                onClicked:backend.underGlowButtonPressed(underGlowButton.memorystate)
                            }
                        }
                    }

                    FrontWorkLights {
                        id: frontWorkLights
                        x: 139
                        y: 390
                        memorystate: false

                        Connections {
                            target: fronWorkLightButton
                            onClicked:backend.frontWorkLightButtonPressed(frontWorkLights.memorystate)
                        }

                        RearWorkLightButton {
                            id: rearWorkLightButton
                            x: 1096
                            y: 0
                            memorystate: false

                            Connections {
                                target: rearWorkLightButton
                                onClicked:backend.rearWorkLightButtonPressed(rearWorkLightButton.memorystate)
                            }
                        }
                    }
                }

                Image {
                    id: image12
                    width: 100
                    height: 100
                    source: "../images/TractorSideV1.png"
                    fillMode: Image.PreserveAspectFit
                    RearWorkLightButton {
                        id: rearWorkLightButton1
                        x: 1039
                        y: 356
                        memorystate: false

                        Connections {
                            target: rearWorkLightButton1
                            onClicked:backend.rearWorkLightButton1Pressed(rearWorkLightButton1.memorystate)
                        }
                    }

                    FrontHeadlightButton {
                        id: frontHeadlightButton1
                        x: 661
                        y: 325
                        memorystate: false
                        
                        Connections {
                            target: frontHeadlightButton1
                            onClicked:backend.frontHeadlightButton1Pressed(frontHeadlightButton1.memorystate)
                        }
                    }

                    FrontWorkLights {
                        id: frontWorkLights1
                        x: 210
                        y: 359
                        memorystate: false

                        Connections {
                            target: frontWorkLights1
                            onClicked:backend.frontWorkLights1Pressed(frontWorkLights1.memorystate)
                        }
                    }

                    UnderGlowButton {
                        id: underGlowButton1
                        x: 645
                        y: 572
                        memorystate: false

                        Connections {
                            target: underGlowButton1
                            onClicked:backend.underGlowButton1Pressed(underGlowButton1.memorystate)
                        }
                    }

                    RunningLightButton {
                        id: runningLightButton1
                        x: 661
                        y: 413
                        memorystate: false

                        Connections {
                            target: runningLightButton1
                            onClicked:backend.runningLightButton1Pressed(runningLightButton1.memorystate)
                        }
                    }
                }
            }
        }


        /*#################### Engine Page ####################*/
        Image {
            id: enginePage
            width: 100
            height: 100
            horizontalAlignment: Image.AlignHCenter
            verticalAlignment: Image.AlignBottom
            source: "../images/NewTestBackround.png"
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            sourceSize.width: 1920
            fillMode: Image.TileHorizontally
            Layout.rightMargin: 0
            Layout.leftMargin: 200
            Layout.fillWidth: false
            Layout.fillHeight: true


            Rectangle {
                id: stupidRectangleEngine
                x: 197
                y: 0
                width: 1520
                height: 980
                color: "#00ffffff"

                Row {
                    id: engineRow
                    anchors.bottom: parent.bottom
                    anchors.top: parent.top
                    anchors.left: parent.left
                    anchors.right: parent.right
                    padding: 10
                    spacing: 10
                    anchors.horizontalCenter: parent.horizontalCenter

                    Column {
                        id: leftColumnEngine
                        anchors.bottom: parent.bottom
                        anchors.top: parent.top
                        anchors.left: parent.left
                        anchors.right: parent.horizontalCenter
                        rightPadding: 10
                        bottomPadding: 10
                        leftPadding: 150
                        topPadding: 100
                        spacing: 40

                        LongEngineRPM {
                            id: longEngineRPM1

                            Component.onCompleted: {
                                backend.updateRPM.connect((value) => {
                                    longEngineRPM_timelineCurrentFrame = value;  // Update gauge
                                });
                            }

                            Text {
                                id: engineTitle
                                y: -75
                                color: "#0b0b0b"
                                text: qsTr("Engine Data")
                                font.pixelSize: 40
                                horizontalAlignment: Text.AlignLeft
                                font.italic: true
                                font.bold: true
                                font.weight: Font.DemiBold
                                anchors.left: parent.left
                            }

                        }

                        EngineLoad {
                            id: engineLoad1

                            Component.onCompleted: {
                                backend.updateEngLoad.connect((engineLoadValue) => {
                                    engineLoadTimelineCurrentFrame = engineLoadValue;  // Update gauge
                                });
                            }
                        }

                        AcceleratorPos {
                            id: acceleratorPos

                            Component.onCompleted: {
                                backend.updateAccelPos.connect((updateAccelPosValue) => {
                                    acceleratorPos_timelineCurrentFrame = updateAccelPosValue;  // Update gauge
                                });
                            }
                        }

                        FuelRate {
                            id: fuelRate

                            Component.onCompleted: {
                                backend.updateFuelRate.connect((updateFuelRateValue) => {
                                    fuelRate_timelineCurrentFrame = updateFuelRateValue;  // Update gauge
                                });
                            }
                        }



                    }

                    Column {
                        id: rightColumnEngine
                        anchors.bottom: parent.bottom
                        anchors.top: parent.top
                        anchors.left: parent.horizontalCenter
                        anchors.right: parent.right
                        rightPadding: 10
                        bottomPadding: 10
                        leftPadding: 70
                        topPadding: 100
                        spacing: 40

                        LongEngineOilPressure {
                            id: longEngineOilPressure

                            Component.onCompleted: {
                                backend.updateOilPressGauge.connect((updateOilPressGaugeValue) => {
                                    engineOilPressure_timelineCurrentFrame = updateOilPressGaugeValue;  // Update gauge
                                });
                            }
                        }

                        LongEngineTemp {
                            id: longEngineTemp

                            Component.onCompleted: {
                                backend.updateEngTemp.connect((engTempValue) => {
                                    longEngineTemp_timelineCurrentFrame = engTempValue;  // Update gauge
                                });
                            }

                        }

                        BatteryVoltage {
                            id: batteryVoltage
                            //batteryVolageTimeline

                            Component.onCompleted: {
                                backend.updateBattVolts.connect((updateBattVoltsValue) => {
                                    batteryVolageTimelineCurrentFrame = updateBattVoltsValue;  // Update gauge
                                });
                            }

                        }

                        BarometricPressure {
                            id: barometricPressure
                            //barometricPressureTimeline

                            Component.onCompleted: {
                                backend.updateBarometric.connect((updateBarometricValue) => {
                                    barometricPressureTimelineCurrentFrame = updateBarometricValue;  // Update gauge
                                });
                            }

                        }
                    }
                }




            }




        }


        /*#################### Drivetrain Page ####################*/
        Image {
            id: drivetrainPage
            width: 100
            height: 100
            horizontalAlignment: Image.AlignHCenter
            verticalAlignment: Image.AlignBottom
            source: "../images/NewTestBackround.png"
            fillMode: Image.Stretch
            Layout.rightMargin: 0
            Layout.leftMargin: 0
            Layout.fillWidth: false
            Layout.fillHeight: true
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

            Rectangle {
                id: stupidRectangle
                x: 197
                y: 0
                width: 1520
                height: 980
                color: "#00ffffff"

                Row {
                    id: drivetrainRow
                    anchors.bottom: parent.bottom
                    anchors.top: parent.top
                    anchors.left: parent.left
                    anchors.right: parent.right
                    padding: 10
                    spacing: 10
                    anchors.horizontalCenter: parent.horizontalCenter

                    Column {
                        id: leftColumnDrivetrain
                        anchors.bottom: parent.bottom
                        anchors.top: parent.top
                        anchors.left: parent.left
                        anchors.right: parent.horizontalCenter
                        rightPadding: 10
                        bottomPadding: 10
                        leftPadding: 150
                        topPadding: 100
                        spacing: 40

                        HydHighPressure {
                            id: hydHighPressureA

                            Component.onCompleted: {
                            backend.updateHydHighPressA.connect((hydHighPressAValue) => {
                                hydHighPressACurrentFrame = (hydHighPressAValue);  // Update gauge
                                });
                            }

                            Text {
                                id: drivetrainTitle
                                y: -75
                                color: "#0b0b0b"
                                text: qsTr("Hydraulic System Data")
                                font.pixelSize: 40
                                horizontalAlignment: Text.AlignLeft
                                font.italic: true
                                font.bold: true
                                font.weight: Font.DemiBold
                                anchors.left: parent.left
                            }
                        }

                        HydHighPressure1 {
                            id: hydHighPressureB

                            Component.onCompleted: {
                            backend.updateHydHighPressB.connect((hydHighPressBValue) => {
                                hydHighPressBCurrentFrame = (hydHighPressBValue);  // Update gauge
                                });
                            }
                        }



                        LongHydrTemp {
                            id: longHydrTemp

                            Component.onCompleted: {
                            backend.updateHydTemp.connect((hydTempValue) => {
                                longHydTempTimelineCurrentFrame = hydTempValue;
                                });
                            }
                        }

                        SwashPosition {
                            id: swashPosition

                            Component.onCompleted: {
                            backend.updateSwashPOS.connect((updateSwashPOSvalue) => {
                                swashPositionTimelineCurrentFrame = updateSwashPOSvalue;
                                });
                            }
                        }

                        SwashLimit {
                            id: swashLimit

                            Component.onCompleted: {
                            backend.updateSwashLimit.connect((updateSwashLimitValue) => {
                                swashLimitTimelineCurrentFrame = updateSwashLimitValue;
                                });
                            }

                            Text {
                                id: fluidLevelText
                                color: "#0b0b0b"
                                text: qsTr("Hydraulic Fluid Level: ")
                                font.pixelSize: 25
                                anchors.top: parent.bottom
                                anchors.topMargin: 20
                                font.bold: true
                                font.weight: Font.DemiBold

                                Text {
                                    id: fluidLevelOkay
                                    color: "#0b0b0b"
                                    text: qsTr("Low")
                                    font.pixelSize: 25
                                    horizontalAlignment: Text.AlignLeft
                                    font.bold: true
                                    font.weight: Font.DemiBold
                                    anchors.left: parent.right
                                    anchors.verticalCenter: parent.certicalCenter

                                    Component.onCompleted: {
                                    backend.updateHydFluidLevel.connect((HydFluidLevelValue) => {
                                        fluidLevelOkay.text = HydFluidLevelValue;
                                        });
                                    }
                                }
                            }
                        }


                    }

                    Column {
                        id: rightColumnDrivetrain
                        anchors.bottom: parent.bottom
                        anchors.top: parent.top
                        anchors.left: parent.horizontalCenter
                        anchors.right: parent.right
                        rightPadding: 10
                        bottomPadding: 10
                        leftPadding: 70
                        topPadding: 100
                        spacing: 40

                        HydChargePressure {
                            id: hydChargePressure

                            Component.onCompleted: {
                            backend.updateChargePress.connect((updateChargePressValue) => {
                                hydChargePressureTimelineCurrentFrame = (updateChargePressValue);  // Update gauge
                                });
                            }

                        }

                        HydCurrent {
                            id: hydCurrent

                            Component.onCompleted: {
                            backend.updateHydControlCurrent.connect((updateHydControlCurrentValue) => {
                                controlCurrentTimelineCurrentFrame = (updateHydControlCurrentValue);
                                });
                            }
                        }

                        HydMotorRPM {
                            id: hydMotorRPM
                            height: 150         //push gauge below lower

                            Component.onCompleted: {
                            backend.updateHydMotorRPM.connect((updateHydMotorRPMvalue) => {
                                hydMotorRPMtimelineCurrentFrame = (updateHydMotorRPMvalue);
                                });
                            }
                        }



                        LongEngineRPM {
                            id: longEngineRPM
                            height: 100         //push gauge above higher

                            Text {
                                id: engineText
                                color: "#0b0b0b"
                                text: qsTr("Engine Data")
                                font.pixelSize: 30
                                horizontalAlignment: Text.AlignLeft
                                font.italic: true
                                font.bold: true
                                font.weight: Font.DemiBold
                                anchors.left: parent.left
                                anchors.bottom: parent.top
                            }

                            Component.onCompleted: {
                                backend.updateRPM.connect((value) => {
                                    longEngineRPM_timelineCurrentFrame = value;  // Update gauge
                                });
                            }
                        }

                        EngineLoad {
                            id: engineLoad

                            Component.onCompleted: {
                                backend.updateEngLoad.connect((engineLoadValue) => {
                                    engineLoadTimelineCurrentFrame = engineLoadValue;  // Update gauge
                                });
                            }
                        }
                    }
                }
            }
        }

        /*#################### Settings Page ####################*/
        Image {
            id: settingspage
            width: 100
            height: 100
            horizontalAlignment: Image.AlignHCenter
            verticalAlignment: Image.AlignBottom
            source: "../images/BackroudnPlain.png"
            fillMode: Image.Stretch
            Layout.rightMargin: 0
            Layout.leftMargin: 0
            Layout.fillWidth: false
            Layout.fillHeight: true
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

            StackLayout {
                id: stackLayout1
                x: 197
                y: 0
                width: 1520
                height: 980

                currentIndex: 0
                //0 for main menu
                //1 for maintenance instructions
                //2 for sensor data
                //3 for stopwatch?
                //4 for datalogging?
                //5 for exit confirmation
                //6 for second exit confirmation

                /*#######################################################*/
                //settings
                Rectangle {
                    id: settings
                    width: parent.width
                    height: parent.height
                    visible: true
                    color: "#00ffffff"
                    anchors.left: parent.left
                    anchors.top: parent.top

                    Image {
                        id: newTestBackround0
                        anchors.top: parent.top
                        anchors.left: parent.left
                        source: "../images/NewTestBackround.png"
                        fillMode: Image.PreserveAspectFit
                    }

                    Text {
                        id: settingsTitle
                        color: "#0b0b0b"
                        text: qsTr("Settings")
                        font.pixelSize: 40
                        horizontalAlignment: Text.AlignHCenter
                        font.italic: false
                        font.bold: true
                        font.weight: Font.DemiBold

                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.top: parent.top
                        anchors.topMargin: 40
                    }

                    Row {
                        id: settingsButtonRow
                        anchors.horizontalCenter: parent.horizontalCenter

                        anchors.top: parent.top
                        anchors.topMargin: 300

                        spacing: 20

                        MaintenanceButton {
                            id: maintenanceButton
                            hoverEnabled: false

                            Connections {
                                target: maintenanceButton
                                onClicked: stackLayout1.currentIndex = 1
                            }
                        }

                        SensorButton {
                            id: sensorButton
                            hoverEnabled: false

                            Connections {
                                target: sensorButton
                                onClicked: stackLayout1.currentIndex = 2
                            }

                            Connections {
                                target: sensorButton
                                onClicked: sensorsStack.currentIndex = 0
                                //console.log: "BUTTON PRESSED!!!"
                            }

                            Connections {
                                target: sensorButton
                                onClicked: functionLine.visible = false
                            }


                        }

                        /*StopwatchButton {
                            id: stopwatchButton
                            hoverEnabled: false

                            Connections {
                                target: stopwatchButton
                                onClicked: stackLayout1.currentIndex = 3
                            }
                        }

                        DataloggingButton {
                            id: dataloggingButton
                            hoverEnabled: false

                            Connections {
                                target: dataloggingButton
                                onClicked: stackLayout1.currentIndex = 4
                            }
                        }*/

                        ExitScreenButton {
                            id: exitScreenButton1
                            hoverEnabled: false

                            Connections {
                                target: exitScreenButton1
                                onClicked: stackLayout1.currentIndex = 5
                                //onClicked:backend.frontWorkLightButtonPressed(frontWorkLights.memorystate)
                            }
                        }
                    }






                }

                /*#######################################################*/
                //  maintenance
                /*#######################################################*/

                Rectangle {
                    id: maintenance
                    width: 200
                    height: 200
                    visible: true
                    color: "#ffffff"

                    Image {
                        id: backroundService2
                        x: 980
                        source: "../images/BackroundService.png"
                        height: 980
                        width: 1220
                    }

                    StackLayout {
                        id: maintStack
                        width: parent.width
                        height: parnet.height
                        currentIndex: 0

                        Image {
                            id: backroundService
                            source: "../images/BackroundService.png"
                            height: 980
                            //for some reason this doesn't work so load it a again??

                            Image {
                                id: backroundService1
                                source: "../images/BackroundService.png"
                                height: 980
                                width: 1220

                                CloseButtonSettigns {
                                    id: closeButtonSettigns
                                    x: 41
                                    y: 855

                                    Connections {
                                        target: closeButtonSettigns
                                        onClicked: stackLayout1.currentIndex = 0
                                        //onClicked:backend.frontWorkLightButtonPressed(frontWorkLights.memorystate)
                                    }
                                }
                            }

                            Rectangle {
                                id: rectangle123
                                x: 0
                                y: 0
                                width: 1220
                                height: 100
                                color: "#00ffffff"
                                border.width: 0
                                Text {
                                    id: text83
                                    text: qsTr("Maintnenance")
                                    anchors.verticalCenter: parent.verticalCenter
                                    font.pixelSize: 50
                                    font.styleName: "Semibold"
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }

                                Rectangle {
                                    id: rectangle124
                                    width: 1220
                                    height: 7
                                    color: "#000000"
                                    anchors.bottom: parent.bottom
                                    anchors.bottomMargin: 0
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }

                                Column {
                                    id: column9
                                    width: 200
                                    height: 400
                                    anchors.top: parent.top
                                    anchors.topMargin: 100



                                    Rectangle {
                                        id: rectangle125
                                        width: 1220
                                        height: 80
                                        color: "#00ffffff"
                                        border.width: 0
                                        Rectangle {
                                            id: rectangle126
                                            x: -610
                                            y: -115
                                            width: 1220
                                            height: 2
                                            color: "#000000"
                                            anchors.bottom: parent.bottom
                                            anchors.bottomMargin: 0
                                            anchors.horizontalCenter: parent.horizontalCenter
                                        }

                                        Text {
                                            id: text84
                                            text: qsTr("Engine Oil Change")
                                            anchors.verticalCenter: parent.verticalCenter
                                            anchors.left: parent.left
                                            anchors.leftMargin: 40
                                            font.pixelSize: 30
                                            horizontalAlignment: Text.AlignLeft
                                            font.weight: Font.DemiBold
                                        }

                                        MouseArea {
                                            id: mouseArea13
                                            anchors.fill: parent
                                            Connections {
                                                target: mouseArea13
                                                onClicked: {
                                                    maintStack.currentIndex = 1
                                                    //engOilChangeComponent.stackIndex = 0
                                                }
                                            }

                                            /*Connections {
                                                target: mouseArea13
                                                onClicked: stackLayout5.currentIndex = 0
                                            }

                                            Connections {
                                                target: mouseArea13
                                                onClicked: rectangle133.y = 0
                                            }*/
                                        }

                                        Text {
                                            id: text139
                                            text: qsTr("100")
                                            anchors.verticalCenter: parent.verticalCenter
                                            anchors.right: parent.right
                                            anchors.rightMargin: 80
                                            font.pixelSize: 60
                                            horizontalAlignment: Text.AlignLeft
                                            font.weight: Font.DemiBold
                                        }

                                        Image {
                                            id: image25
                                            width: 80
                                            height: 80
                                            anchors.verticalCenter: parent.verticalCenter
                                            anchors.right: parent.right
                                            anchors.rightMargin: 180
                                            source: "../images/Engine_Hour_Meter_ISO.png"
                                            sourceSize.height: 100
                                            sourceSize.width: 100
                                            fillMode: Image.PreserveAspectFit
                                        }
                                    }

                                    Rectangle {
                                        id: rectangle127
                                        width: 1220
                                        height: 80
                                        color: "#00ffffff"
                                        border.width: 0
                                        Rectangle {
                                            id: rectangle128
                                            x: -610
                                            y: -115
                                            width: 1220
                                            height: 2
                                            color: "#000000"
                                            anchors.bottom: parent.bottom
                                            anchors.bottomMargin: 0
                                            anchors.horizontalCenter: parent.horizontalCenter
                                        }

                                        Text {
                                            id: text85
                                            text: qsTr("Hydraulic Oil Change")
                                            anchors.verticalCenter: parent.verticalCenter
                                            anchors.left: parent.left
                                            anchors.leftMargin: 40
                                            font.pixelSize: 30
                                            horizontalAlignment: Text.AlignLeft
                                            font.weight: Font.DemiBold
                                        }

                                        MouseArea {
                                            id: mouseArea14
                                            anchors.fill: parent

                                            Connections {
                                                target: mouseArea14
                                                onClicked: {
                                                    maintStack.currentIndex = 2
                                                    //engOilChangeComponent.stackIndex = 0
                                                }
                                            }

                                            /*Connections {
                                                target: mouseArea14
                                                onClicked: stackLayout5.currentIndex = 0
                                            }

                                            Connections {
                                                target: mouseArea14
                                                onClicked: rectangle133.y = 0
                                            }*/
                                        }
                                    }

                                    Rectangle {
                                        id: rectangle129
                                        width: 1220
                                        height: 80
                                        color: "#00ffffff"
                                        border.width: 0
                                        Rectangle {
                                            id: rectangle130
                                            x: -610
                                            y: -115
                                            width: 1220
                                            height: 2
                                            color: "#000000"
                                            anchors.bottom: parent.bottom
                                            anchors.bottomMargin: 0
                                            anchors.horizontalCenter: parent.horizontalCenter
                                        }

                                        Text {
                                            id: text86
                                            text: qsTr("Transmission Oil Change")
                                            anchors.verticalCenter: parent.verticalCenter
                                            anchors.left: parent.left
                                            anchors.leftMargin: 40
                                            font.pixelSize: 30
                                            horizontalAlignment: Text.AlignLeft
                                            font.weight: Font.DemiBold
                                        }

                                        MouseArea {
                                            id: mouseArea15
                                            anchors.fill: parent
                                        }
                                    }

                                    Rectangle {
                                        id: rectangle131
                                        width: 1220
                                        height: 80
                                        color: "#00ffffff"
                                        border.width: 0
                                        Rectangle {
                                            id: rectangle132
                                            x: -610
                                            y: -115
                                            width: 1220
                                            height: 2
                                            color: "#000000"
                                            anchors.bottom: parent.bottom
                                            anchors.bottomMargin: 0
                                            anchors.horizontalCenter: parent.horizontalCenter
                                        }

                                        Text {
                                            id: text87
                                            text: qsTr("Spark Plug Replacment")
                                            anchors.verticalCenter: parent.verticalCenter
                                            anchors.left: parent.left
                                            anchors.leftMargin: 40
                                            font.pixelSize: 30
                                            horizontalAlignment: Text.AlignLeft
                                            font.weight: Font.DemiBold
                                        }

                                        MouseArea {
                                            id: mouseArea16
                                            anchors.fill: parent
                                        }
                                    }
                                }
                            }
                        }

                        EngOilChange {
                            id: engOilChange
                            x: 0
                            y: 0

                            onRequestStackChange: maintStack.currentIndex = newIndex
                            //this makes an error of some sort... but still works??
                        }

                        HydOilChange {
                            id: hydOilChange
                            x: 0
                            y: 0

                            onRequestStackChange: stackLayout1.currentIndex = newIndex
                        }

                        AirFilterService {
                            id: airFilterService
                            x: 0
                            y: 0
                        }
                    }


                }

                /*#######################################################*/
                //  sensors
                /*#######################################################*/
                Rectangle {
                    id: sensors
                    width: 200
                    height: 200
                    visible: true
                    color: "#ffffff"

                    Image {
                        id: newTestBackround9
                        anchors.top: parent.top
                        anchors.left: parent.left
                        source: "../images/NewTestBackround.png"
                        fillMode: Image.PreserveAspectFit
                    }

                    Rectangle {
                        id: functionLine
                        x: 88
                        y: 105
                        width: 5
                        height: 490
                        color: "#000000"
                        visible: false

                        Rectangle {
                            id: topBar
                            x: -88
                            y: 40
                            visible: true

                            width: sensors.width
                            height: 5
                            color: "#000000"

                            Rectangle {
                                id: bar1
                                y: 50
                                visible: true

                                width: sensors.width
                                height: 5
                                color: "#000000"

                                Text {
                                    id: barText1
                                    x: 56
                                    y: -40
                                    text: "1"
                                    color: "#0b0b0b"
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignHCenter
                                    font.italic: false
                                    font.bold: true
                                    font.weight: Font.DemiBold
                                }

                                Rectangle {
                                    id: bar2
                                    y: 50
                                    visible: true

                                    width: sensors.width
                                    height: 5
                                    color: "#000000"

                                    Text {
                                        id: barText2
                                        x: 56
                                        y: -40
                                        text: "2"
                                        color: "#0b0b0b"
                                        font.pixelSize: 30
                                        horizontalAlignment: Text.AlignHCenter
                                        font.italic: false
                                        font.bold: true
                                        font.weight: Font.DemiBold
                                    }

                                    Rectangle {
                                        id: bar3
                                        y: 50
                                        visible: true

                                        width: sensors.width
                                        height: 5
                                        color: "#000000"

                                        Text {
                                            id: barText3
                                            x: 56
                                            y: -40
                                            text: "3"
                                            color: "#0b0b0b"
                                            font.pixelSize: 30
                                            horizontalAlignment: Text.AlignHCenter
                                            font.italic: false
                                            font.bold: true
                                            font.weight: Font.DemiBold
                                        }

                                        Rectangle {
                                            id: bar4
                                            y: 50

                                            width: sensors.width
                                            height: 5
                                            color: "#000000"
                                            visible: true

                                            Text {
                                                id: barText4
                                                x: 56
                                                y: -40
                                                text: "4"
                                                color: "#0b0b0b"
                                                font.pixelSize: 30
                                                horizontalAlignment: Text.AlignHCenter
                                                font.italic: false
                                                font.bold: true
                                                font.weight: Font.DemiBold
                                            }

                                            Rectangle {
                                                id: bar5
                                                y: 50

                                                width: sensors.width
                                                height: 5
                                                color: "#000000"
                                                visible: fa

                                                Text {
                                                    id: barText5
                                                    x: 56
                                                    y: -40
                                                    text: "5"
                                                    color: "#0b0b0b"
                                                    font.pixelSize: 30
                                                    horizontalAlignment: Text.AlignHCenter
                                                    font.italic: false
                                                    font.bold: true
                                                    font.weight: Font.DemiBold
                                                }


                                                Rectangle {
                                                    id: bar6
                                                    y: 50

                                                    width: sensors.width
                                                    height: 5
                                                    color: "#000000"
                                                    visible: true

                                                    Text {
                                                        id: barText6
                                                        x: 56
                                                        y: -40
                                                        text: "6"
                                                        color: "#0b0b0b"
                                                        font.pixelSize: 30
                                                        horizontalAlignment: Text.AlignHCenter
                                                        font.italic: false
                                                        font.bold: true
                                                        font.weight: Font.DemiBold
                                                    }

                                                    Rectangle {
                                                        id: bar7
                                                        y: 50
                                                        visible: true

                                                        width: sensors.width
                                                        height: 5
                                                        color: "#000000"

                                                        Text {
                                                            id: barText7
                                                            x: 56
                                                            y: -40
                                                            text: "7"
                                                            color: "#0b0b0b"
                                                            font.pixelSize: 30
                                                            horizontalAlignment: Text.AlignHCenter
                                                            font.italic: false
                                                            font.bold: true
                                                            font.weight: Font.DemiBold
                                                        }

                                                        Rectangle {
                                                            id: bar8
                                                            y: 50
                                                            visible: true
                                                            width: sensors.width
                                                            height: 5
                                                            color: "#000000"

                                                            Text {
                                                                id: barText8
                                                                x: 56
                                                                y: -40
                                                                text: "8"
                                                                color: "#0b0b0b"
                                                                font.pixelSize: 30
                                                                horizontalAlignment: Text.AlignHCenter
                                                                font.italic: false
                                                                font.bold: true
                                                                font.weight: Font.DemiBold
                                                            }

                                                            Rectangle {
                                                                id: bar9
                                                                y: 50
                                                                visible: true

                                                                width: sensors.width
                                                                height: 5
                                                                color: "#000000"

                                                                Text {
                                                                    id: barText9
                                                                    x: 56
                                                                    y: -40
                                                                    text: "9"
                                                                    color: "#0b0b0b"
                                                                    font.pixelSize: 30
                                                                    horizontalAlignment: Text.AlignHCenter
                                                                    font.italic: false
                                                                    font.bold: true
                                                                    font.weight: Font.DemiBold
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }

                            Text {
                                id: sensorNumber
                                text: "No. "
                                color: "#0b0b0b"
                                font.pixelSize: 30
                                horizontalAlignment: Text.AlignHCenter
                                font.italic: false
                                font.bold: true
                                font.weight: Font.DemiBold

                                anchors.left: parent.left
                                anchors.leftMargin: 20
                                anchors.bottom: parent.top
                                anchors.bottomMargin: 5

                                Text {
                                    id: sensorFunction
                                    text: "Function"
                                    color: "#0b0b0b"
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignHCenter
                                    font.italic: false
                                    font.bold: true
                                    font.weight: Font.DemiBold

                                    anchors.left: parent.right
                                    anchors.leftMargin: 25
                                    anchors.bottom: parent.bottom

                                    Text {
                                        id: sensorRange
                                        text: "Range"
                                        color: "#0b0b0b"
                                        font.pixelSize: 30
                                        horizontalAlignment: Text.AlignHCenter
                                        font.italic: false
                                        font.bold: true
                                        font.weight: Font.DemiBold

                                        anchors.left: parent.right
                                        anchors.leftMargin: 220
                                        anchors.bottom: parent.bottom

                                        Text {
                                            id: sensorRawVal
                                            text: "Raw Value"
                                            color: "#0b0b0b"
                                            font.pixelSize: 30
                                            horizontalAlignment: Text.AlignHCenter
                                            font.italic: false
                                            font.bold: true
                                            font.weight: Font.DemiBold

                                            anchors.left: parent.right
                                            anchors.leftMargin: 45
                                            anchors.bottom: parent.bottom

                                            Text {
                                                id: sensorMultiplier
                                                text: "Multiplier"
                                                color: "#0b0b0b"
                                                font.pixelSize: 30
                                                horizontalAlignment: Text.AlignHCenter
                                                font.italic: false
                                                font.bold: true
                                                font.weight: Font.DemiBold

                                                anchors.left: parent.right
                                                anchors.leftMargin: 18
                                                anchors.bottom: parent.bottom

                                                Text {
                                                    id: sensorDecodeVal
                                                    text: "Decoded Value"
                                                    color: "#0b0b0b"
                                                    font.pixelSize: 30
                                                    horizontalAlignment: Text.AlignHCenter
                                                    font.italic: false
                                                    font.bold: true
                                                    font.weight: Font.DemiBold

                                                    anchors.left: parent.right
                                                    anchors.leftMargin: 18
                                                    anchors.bottom: parent.bottom

                                                    Text {
                                                        id: unitVal
                                                        text: "Unit"
                                                        color: "#0b0b0b"
                                                        font.pixelSize: 30
                                                        horizontalAlignment: Text.AlignHCenter
                                                        font.italic: false
                                                        font.bold: true
                                                        font.weight: Font.DemiBold

                                                        anchors.left: parent.right
                                                        anchors.leftMargin: 20
                                                        anchors.bottom: parent.bottom

                                                        Text {
                                                            id: minVal
                                                            text: "Min"
                                                            color: "#0b0b0b"
                                                            font.pixelSize: 30
                                                            horizontalAlignment: Text.AlignHCenter
                                                            font.italic: false
                                                            font.bold: true
                                                            font.weight: Font.DemiBold

                                                            anchors.left: parent.right
                                                            anchors.leftMargin: 90
                                                            anchors.bottom: parent.bottom

                                                            Text {
                                                                id: maxVal
                                                                text: "Max"
                                                                color: "#0b0b0b"
                                                                font.pixelSize: 30
                                                                horizontalAlignment: Text.AlignHCenter
                                                                font.italic: false
                                                                font.bold: true
                                                                font.weight: Font.DemiBold

                                                                anchors.left: parent.right
                                                                anchors.leftMargin: 75
                                                                anchors.bottom: parent.bottom
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }

                        Rectangle {
                            x: 337
                            y: 0
                            width: 5
                            height: functionLine.height
                            color: "#000000"

                            Rectangle {
                                x: 136
                                y: 0
                                width: 5
                                height: functionLine.height
                                color: "#000000"

                                Rectangle {
                                    x: 167
                                    y: 0
                                    width: 5
                                    height: functionLine.height
                                    color: "#000000"

                                    Rectangle {
                                        x: 160
                                        y: 0
                                        width: 5
                                        height: functionLine.height
                                        color: "#000000"

                                        Rectangle {
                                            x: 230
                                            y: 0
                                            width: 5
                                            height: functionLine.height
                                            color: "#000000"

                                            Rectangle {
                                                x: 149
                                                y: 0
                                                width: 5
                                                height: functionLine.height
                                                color: "#000000"

                                                Rectangle {
                                                    x: 125
                                                    y: 0
                                                    width: 5
                                                    height: functionLine.height
                                                    color: "#000000"
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }



                StackLayout {
                    id: sensorsStack
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: parent.width
                    height: parent.height
                    currentIndex: 0
                    //0 for menu
                    //1 for front ecm
                    //2 for engine
                    //3 for joystick
                    //4 for console ecm
                    //5 for steering ecm
                    //6 for mid ecm
                    //7 for pump ecm first page
                    //8 for pump ecm second page

                    //###### MENU ######//
                    Rectangle {
                        id: sensorsStackIndex0
                        anchors.horizontalCenter: parent.horizontalCenter
                        width: parent.width
                        height: parent.height
                        color: "#00ffffff"

                        Image {
                            id: bOOYAHTRATURRRR
                            anchors.horizontalCenter: parent.horizontalCenter
                            y: 195
                            width: 928
                            height: 563
                            source: "../images/BOO-YAH TRATURRRR.png"
                            fillMode: Image.PreserveAspectFit
                        }

                        Image {
                            id: tRATURRRRArrows
                            anchors.top: bOOYAHTRATURRRR.top
                            anchors.topMargin: -10

                            anchors.left: bOOYAHTRATURRRR.left
                            anchors.leftMargin: 10

                            source: "../images/TRATURRRR arrows.png"
                            fillMode: Image.PreserveAspectFit
                        }

                        Row {
                            id: sensorUpperRow
                            spacing: 100
                            anchors.bottom: bOOYAHTRATURRRR.top
                            anchors.horizontalCenter: bOOYAHTRATURRRR.horizontalCenter

                            GenaricButtonGrey {
                                id: genaricButtonGrey
                                buttonText: "Front ECM"

                                Connections {
                                    target: genaricButtonGrey
                                    onClicked: sensorsStack.currentIndex = 1
                                }

                                Connections {
                                    target: genaricButtonGrey
                                    onClicked: functionLine.visible = true
                                }

                                Connections {
                                    target: genaricButtonGrey
                                    onClicked: bar6.visible = false
                                }

                                Connections {
                                    target: genaricButtonGrey
                                    onClicked: bar8.visible = true
                                }

                                Connections {
                                    target: genaricButtonGrey
                                    onClicked: bar4.visible = true
                                }

                                Connections {
                                    target: genaricButtonGrey
                                    onClicked: functionLine.height = 290
                                }
                            }

                            GenaricButtonGrey {
                                id: genaricButtonGrey1
                                buttonText: "Engine"

                                Connections {
                                    target: genaricButtonGrey1
                                    onClicked: sensorsStack.currentIndex = 2
                                }

                                Connections {
                                    target: genaricButtonGrey1
                                    onClicked: functionLine.visible = true
                                }

                                Connections {
                                    target: genaricButtonGrey1
                                    onClicked: bar6.visible = true
                                }

                                Connections {
                                    target: genaricButtonGrey1
                                    onClicked: bar8.visible = false
                                }

                                Connections {
                                    target: genaricButtonGrey1
                                    onClicked: bar4.visible = true
                                }

                                Connections {
                                    target: genaricButtonGrey1
                                    onClicked: functionLine.height = 390
                                }
                            }

                            GenaricButtonGrey {
                                id: genaricButtonGrey2
                                buttonText: "Joystick"

                                Connections {
                                    target: genaricButtonGrey2
                                    onClicked: sensorsStack.currentIndex = 3
                                }

                                Connections {
                                    target: genaricButtonGrey2
                                    onClicked: functionLine.visible = true
                                }

                                Connections {
                                    target: genaricButtonGrey2
                                    onClicked: bar4.visible = true
                                }

                                Connections {
                                    target: genaricButtonGrey2
                                    onClicked: bar8.visible = true
                                }

                                Connections {
                                    target: genaricButtonGrey2
                                    onClicked: bar6.visible = true
                                }

                                Connections {
                                    target: genaricButtonGrey2
                                    onClicked: functionLine.height = 490
                                }
                            }

                            GenaricButtonGrey {
                                id: genaricButtonGrey3
                                buttonText: "Console ECM"

                                Connections {
                                    target: genaricButtonGrey3
                                    onClicked: sensorsStack.currentIndex = 4
                                }

                                Connections {
                                    target: genaricButtonGrey3
                                    onClicked: functionLine.visible = true
                                }

                                Connections {
                                    target: genaricButtonGrey3
                                    onClicked: bar4.visible = true
                                }

                                Connections {
                                    target: genaricButtonGrey6
                                    onClicked: bar8.visible = true
                                }

                                Connections {
                                    target: genaricButtonGrey3
                                    onClicked: bar6.visible = true
                                }

                                Connections {
                                    target: genaricButtonGrey3
                                    onClicked: functionLine.height = 490
                                }
                            }
                        }

                        Row {
                            id: sensorLowerRow
                            spacing: sensorUpperRow.spacing
                            anchors.top: bOOYAHTRATURRRR.bottom
                            anchors.horizontalCenter: bOOYAHTRATURRRR.horizontalCenter

                            Rectangle {
                                id: placeholderRowFillerUpper
                                width: 200
                                height: 60
                                color: "#00ffffff"

                            }

                            GenaricButtonGrey {
                                id: genaricButtonGrey4
                                buttonText: "Steering ECM"

                                Connections {
                                    target: genaricButtonGrey4
                                    onClicked: sensorsStack.currentIndex = 5
                                }

                                Connections {
                                    target: genaricButtonGrey4
                                    onClicked: functionLine.visible = true
                                }

                                Connections {
                                    target: genaricButtonGrey4
                                    onClicked: bar4.visible = false
                                }

                                Connections {
                                    target: genaricButtonGrey4
                                    onClicked: functionLine.height = 190
                                }
                            }

                            GenaricButtonGrey {
                                id: genaricButtonGrey5
                                buttonText: "Mid ECM"

                                Connections {
                                    target: genaricButtonGrey5
                                    onClicked: sensorsStack.currentIndex = 6
                                }

                                Connections {
                                    target: genaricButtonGrey5
                                    onClicked: functionLine.visible = true
                                }

                                Connections {
                                    target: genaricButtonGrey5
                                    onClicked: bar4.visible = false
                                }

                                Connections {
                                    target: genaricButtonGrey5
                                    onClicked: functionLine.height = 190
                                }
                            }

                            GenaricButtonGrey {
                                id: genaricButtonGrey6
                                buttonText: "Pump ECM"

                                Connections {
                                    target: genaricButtonGrey6
                                    onClicked: sensorsStack.currentIndex = 7
                                }

                                Connections {
                                    target: genaricButtonGrey6
                                    onClicked: functionLine.visible = true
                                }

                                Connections {
                                    target: genaricButtonGrey6
                                    onClicked: bar4.visible = true
                                }

                                Connections {
                                    target: genaricButtonGrey6
                                    onClicked: bar8.visible = true
                                }

                                Connections {
                                    target: genaricButtonGrey6
                                    onClicked: bar6.visible = true
                                }

                                Connections {
                                    target: genaricButtonGrey6
                                    onClicked: functionLine.height = 490
                                }
                            }
                        }

                        CloseButtonSettigns {
                            id: closeButtonSensors
                            x: 41
                            y: 855

                            Connections {
                                target: closeButtonSensors
                                onClicked: stackLayout1.currentIndex = 0
                                //onClicked:backend.frontWorkLightButtonPressed(frontWorkLights.memorystate)
                            }
                        }

                        Text {
                            id: sensorsTitle
                            color: "#0b0b0b"
                            text: qsTr("Select an ECM to view its data:")
                            font.pixelSize: 40
                            horizontalAlignment: Text.AlignHCenter
                            font.italic: false
                            font.bold: true
                            font.weight: Font.DemiBold

                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.top: parent.top
                            anchors.topMargin: 40
                        }
                    }

                    //### front ECM ###//
                    Rectangle {
                        id: sensorsStackIndex1
                        anchors.horizontalCenter: parent.horizontalCenter
                        width: parent.width
                        height: parent.height
                        color: "#00ffffff"

                        Text {
                            id: frontECMTitle
                            color: "#0b0b0b"
                            text: qsTr("Front ECM Data")
                            font.pixelSize: 40
                            horizontalAlignment: Text.AlignHCenter
                            font.italic: true
                            font.bold: true
                            font.weight: Font.DemiBold

                            anchors.left: parent.left
                            anchors.leftMargin: 20
                            anchors.top: parent.top
                            anchors.topMargin: 20
                        }

                        Text {
                            id: frontECM_c1l1
                            x: 100
                            y: 155
                            text: "Reservoir Temp."
                            color: "#0b0b0b"
                            font.pixelSize: 30
                            horizontalAlignment: Text.AlignLeft
                            font.italic: false
                            font.bold: false
                            font.weight: Font.normal

                            Text {
                                id: frontECM_c1l2
                                x: 0
                                y: 50
                                text: "Reservoir Level Switch"
                                color: "#0b0b0b"
                                font.pixelSize: 30
                                horizontalAlignment: Text.AlignLeft
                                font.italic: false
                                font.bold: false
                                font.weight: Font.normal

                                Text {
                                    id: frontECM_c1l3
                                    x: 0
                                    y: 50
                                    text: "Fuel Level"
                                    color: "#0b0b0b"
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignLeft
                                    font.italic: false
                                    font.bold: false
                                    font.weight: Font.normal

                                    Text {
                                        id: frontECM_c1l4
                                        x: 0
                                        y: 50
                                        text: "Reservoir Temp Voltage"
                                        color: "#0b0b0b"
                                        font.pixelSize: 30
                                        horizontalAlignment: Text.AlignLeft
                                        font.italic: false
                                        font.bold: false
                                        font.weight: Font.normal

                                        Text {
                                            id: frontECM_c1l5
                                            x: 0
                                            y: 50
                                            text: "Fuel Level Voltage"
                                            color: "#0b0b0b"
                                            font.pixelSize: 30
                                            horizontalAlignment: Text.AlignLeft
                                            font.italic: false
                                            font.bold: false
                                            font.weight: Font.normal

                                            Text {
                                                id: frontECM_c2l5
                                                anchors.left: parent.left
                                                anchors.leftMargin: 340
                                                y: 0
                                                text: "0-5"
                                                color: "#0b0b0b"
                                                font.pixelSize: 30
                                                horizontalAlignment: Text.AlignLeft
                                                font.italic: false
                                                font.bold: false
                                                font.weight: Font.normal

                                                Text {
                                                    id: frontECM_c3l5
                                                    anchors.left: parent.left
                                                    anchors.leftMargin: 135
                                                    y: 0
                                                    text: "???"
                                                    color: "#0b0b0b"
                                                    font.pixelSize: 30
                                                    horizontalAlignment: Text.AlignLeft
                                                    font.italic: false
                                                    font.bold: false
                                                    font.weight: Font.normal

                                                    Component.onCompleted: {
                                                    backend.updateFuelVolts.connect((fuelVolts) => {
                                                        frontECM_c3l5.text = fuelVolts;
                                                        });
                                                    }

                                                    Text {
                                                        id: frontECM_c4l5
                                                        anchors.left: parent.left
                                                        anchors.leftMargin: 167
                                                        y: 0
                                                        text: "100"
                                                        color: "#0b0b0b"
                                                        font.pixelSize: 30
                                                        horizontalAlignment: Text.AlignLeft
                                                        font.italic: false
                                                        font.bold: false
                                                        font.weight: Font.normal

                                                        Text {
                                                            id: frontECM_c5l5
                                                            anchors.left: parent.left
                                                            anchors.leftMargin: 160
                                                            y: 0
                                                            text: "???"
                                                            color: "#0b0b0b"
                                                            font.pixelSize: 30
                                                            horizontalAlignment: Text.AlignLeft
                                                            font.italic: false
                                                            font.bold: false
                                                            font.weight: Font.normal

                                                            Component.onCompleted: {
                                                            backend.updateFuelVolts.connect((fuelVolts) => {
                                                                frontECM_c5l5.text = (fuelVolts * 100);
                                                                });
                                                            }


                                                            Text {
                                                                id: frontECM_c6l5
                                                                anchors.left: parent.left
                                                                anchors.leftMargin: 227
                                                                y: 0
                                                                text: "volts"
                                                                color: "#0b0b0b"
                                                                font.pixelSize: 30
                                                                horizontalAlignment: Text.AlignLeft
                                                                font.italic: false
                                                                font.bold: false
                                                                font.weight: Font.normal

                                                                Text {
                                                                    id: frontECM_c7l5
                                                                    anchors.left: parent.left
                                                                    anchors.leftMargin: 150
                                                                    y: 0
                                                                    text: "???"
                                                                    color: "#0b0b0b"
                                                                    font.pixelSize: 30
                                                                    horizontalAlignment: Text.AlignLeft
                                                                    font.italic: false
                                                                    font.bold: false
                                                                    font.weight: Font.normal

                                                                    Text {
                                                                        id: frontECM_c8l5
                                                                        anchors.left: parent.left
                                                                        anchors.leftMargin: 128
                                                                        y: 0
                                                                        text: "???"
                                                                        color: "#0b0b0b"
                                                                        font.pixelSize: 30
                                                                        horizontalAlignment: Text.AlignLeft
                                                                        font.italic: false
                                                                        font.bold: false
                                                                        font.weight: Font.normal
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }

                                        Text {
                                            id: frontECM_c2l4
                                            anchors.left: parent.left
                                            anchors.leftMargin: 340
                                            y: 0
                                            text: "0-5"
                                            color: "#0b0b0b"
                                            font.pixelSize: 30
                                            horizontalAlignment: Text.AlignLeft
                                            font.italic: false
                                            font.bold: false
                                            font.weight: Font.normal

                                            Text {
                                                id: frontECM_c3l4
                                                anchors.left: parent.left
                                                anchors.leftMargin: 135
                                                y: 0
                                                text: "???"
                                                color: "#0b0b0b"
                                                font.pixelSize: 30
                                                horizontalAlignment: Text.AlignLeft
                                                font.italic: false
                                                font.bold: false
                                                font.weight: Font.normal

                                                Component.onCompleted: {
                                                backend.updateHydTempVolts.connect((hydTempVolts) => {
                                                    frontECM_c3l4.text = hydTempVolts;
                                                    });
                                                }

                                                Text {
                                                    id: frontECM_c4l4
                                                    anchors.left: parent.left
                                                    anchors.leftMargin: 167
                                                    y: 0
                                                    text: "100"
                                                    color: "#0b0b0b"
                                                    font.pixelSize: 30
                                                    horizontalAlignment: Text.AlignLeft
                                                    font.italic: false
                                                    font.bold: false
                                                    font.weight: Font.normal

                                                    Text {
                                                        id: frontECM_c5l4
                                                        anchors.left: parent.left
                                                        anchors.leftMargin: 160
                                                        y: 0
                                                        text: "???"
                                                        color: "#0b0b0b"
                                                        font.pixelSize: 30
                                                        horizontalAlignment: Text.AlignLeft
                                                        font.italic: false
                                                        font.bold: false
                                                        font.weight: Font.normal

                                                        Component.onCompleted: {
                                                        backend.updateHydTempVolts.connect((hydTempVolts) => {
                                                            frontECM_c5l4.text = (hydTempVolts * 100);
                                                            });
                                                        }

                                                        Text {
                                                            id: frontECM_c6l4
                                                            anchors.left: parent.left
                                                            anchors.leftMargin: 227
                                                            y: 0
                                                            text: "volts"
                                                            color: "#0b0b0b"
                                                            font.pixelSize: 30
                                                            horizontalAlignment: Text.AlignLeft
                                                            font.italic: false
                                                            font.bold: false
                                                            font.weight: Font.normal

                                                            Text {
                                                                id: frontECM_c7l4
                                                                anchors.left: parent.left
                                                                anchors.leftMargin: 150
                                                                y: 0
                                                                text: "???"
                                                                color: "#0b0b0b"
                                                                font.pixelSize: 30
                                                                horizontalAlignment: Text.AlignLeft
                                                                font.italic: false
                                                                font.bold: false
                                                                font.weight: Font.normal

                                                                Text {
                                                                    id: frontECM_c8l4
                                                                    anchors.left: parent.left
                                                                    anchors.leftMargin: 128
                                                                    y: 0
                                                                    text: "???"
                                                                    color: "#0b0b0b"
                                                                    font.pixelSize: 30
                                                                    horizontalAlignment: Text.AlignLeft
                                                                    font.italic: false
                                                                    font.bold: false
                                                                    font.weight: Font.normal
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }

                                    Text {
                                        id: frontECM_c2l3
                                        anchors.left: parent.left
                                        anchors.leftMargin: 340
                                        y: 0
                                        text: "0-100"
                                        color: "#0b0b0b"
                                        font.pixelSize: 30
                                        horizontalAlignment: Text.AlignLeft
                                        font.italic: false
                                        font.bold: false
                                        font.weight: Font.normal

                                        Text {
                                            id: frontECM_c3l3
                                            anchors.left: parent.left
                                            anchors.leftMargin: 135
                                            y: 0
                                            text: "???"
                                            color: "#0b0b0b"
                                            font.pixelSize: 30
                                            horizontalAlignment: Text.AlignLeft
                                            font.italic: false
                                            font.bold: false
                                            font.weight: Font.normal

                                            Component.onCompleted: {
                                            backend.updateFuelLevel.connect((fuelLevelValue) => {
                                                frontECM_c3l3.text = fuelLevelValue;
                                                });
                                            }

                                            Text {
                                                id: frontECM_c4l3
                                                anchors.left: parent.left
                                                anchors.leftMargin: 167
                                                y: 0
                                                text: "1"
                                                color: "#0b0b0b"
                                                font.pixelSize: 30
                                                horizontalAlignment: Text.AlignLeft
                                                font.italic: false
                                                font.bold: false
                                                font.weight: Font.normal

                                                Text {
                                                    id: frontECM_c5l3
                                                    anchors.left: parent.left
                                                    anchors.leftMargin: 160
                                                    y: 0
                                                    text: "???"
                                                    color: "#0b0b0b"
                                                    font.pixelSize: 30
                                                    horizontalAlignment: Text.AlignLeft
                                                    font.italic: false
                                                    font.bold: false
                                                    font.weight: Font.normal

                                                    Component.onCompleted: {
                                                    backend.updateFuelLevel.connect((fuelLevelValue) => {
                                                        frontECM_c5l3.text = fuelLevelValue;
                                                        });
                                                    }

                                                    Text {
                                                        id: frontECM_c6l3
                                                        anchors.left: parent.left
                                                        anchors.leftMargin: 227
                                                        y: 0
                                                        text: "%"
                                                        color: "#0b0b0b"
                                                        font.pixelSize: 30
                                                        horizontalAlignment: Text.AlignLeft
                                                        font.italic: false
                                                        font.bold: false
                                                        font.weight: Font.normal

                                                        Text {
                                                            id: frontECM_c7l3
                                                            anchors.left: parent.left
                                                            anchors.leftMargin: 150
                                                            y: 0
                                                            text: "???"
                                                            color: "#0b0b0b"
                                                            font.pixelSize: 30
                                                            horizontalAlignment: Text.AlignLeft
                                                            font.italic: false
                                                            font.bold: false
                                                            font.weight: Font.normal

                                                            Text {
                                                                id: frontECM_c8l3
                                                                anchors.left: parent.left
                                                                anchors.leftMargin: 128
                                                                y: 0
                                                                text: "???"
                                                                color: "#0b0b0b"
                                                                font.pixelSize: 30
                                                                horizontalAlignment: Text.AlignLeft
                                                                font.italic: false
                                                                font.bold: false
                                                                font.weight: Font.normal
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }

                                Text {
                                    id: frontECM_c2l2
                                    anchors.left: parent.left
                                    anchors.leftMargin: 340
                                    y: 0
                                    text: "0-1"
                                    color: "#0b0b0b"
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignLeft
                                    font.italic: false
                                    font.bold: false
                                    font.weight: Font.normal

                                    Text {
                                        id: frontECM_c3l2
                                        anchors.left: parent.left
                                        anchors.leftMargin: 135
                                        y: 0
                                        text: "???"
                                        color: "#0b0b0b"
                                        font.pixelSize: 30
                                        horizontalAlignment: Text.AlignLeft
                                        font.italic: false
                                        font.bold: false
                                        font.weight: Font.normal

                                        Component.onCompleted: {
                                        backend.hydFluidLevelRaw.connect((HydFluidLevelRaw) => {
                                            frontECM_c3l2.text = HydFluidLevelRaw;
                                            });
                                        }



                                        Text {
                                            id: frontECM_c4l2
                                            anchors.left: parent.left
                                            anchors.leftMargin: 167
                                            y: 0
                                            text: "Low/Okay"
                                            color: "#0b0b0b"
                                            font.pixelSize: 30
                                            horizontalAlignment: Text.AlignLeft
                                            font.italic: false
                                            font.bold: false
                                            font.weight: Font.normal

                                            Text {
                                                id: frontECM_c5l2
                                                anchors.left: parent.left
                                                anchors.leftMargin: 160
                                                y: 0
                                                text: "???"
                                                color: "#0b0b0b"
                                                font.pixelSize: 30
                                                horizontalAlignment: Text.AlignLeft
                                                font.italic: false
                                                font.bold: false
                                                font.weight: Font.normal

                                                Component.onCompleted: {
                                                backend.updateHydFluidLevel.connect((HydFluidLevelValue) => {
                                                    frontECM_c5l2.text = HydFluidLevelValue;
                                                    });
                                                }

                                                Text {
                                                    id: frontECM_c6l2
                                                    anchors.left: parent.left
                                                    anchors.leftMargin: 227
                                                    y: 0
                                                    text: "-"
                                                    color: "#0b0b0b"
                                                    font.pixelSize: 30
                                                    horizontalAlignment: Text.AlignLeft
                                                    font.italic: false
                                                    font.bold: false
                                                    font.weight: Font.normal

                                                    Text {
                                                        id: frontECM_c7l2
                                                        anchors.left: parent.left
                                                        anchors.leftMargin: 150
                                                        y: 0
                                                        text: "-"
                                                        color: "#0b0b0b"
                                                        font.pixelSize: 30
                                                        horizontalAlignment: Text.AlignLeft
                                                        font.italic: false
                                                        font.bold: false
                                                        font.weight: Font.normal

                                                        Text {
                                                            id: frontECM_c8l2
                                                            anchors.left: parent.left
                                                            anchors.leftMargin: 128
                                                            y: 0
                                                            text: "-"
                                                            color: "#0b0b0b"
                                                            font.pixelSize: 30
                                                            horizontalAlignment: Text.AlignLeft
                                                            font.italic: false
                                                            font.bold: false
                                                            font.weight: Font.normal
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }

                            Text {
                                id: frontECM_c2l1
                                anchors.left: parent.left
                                anchors.leftMargin: 340
                                y: 0
                                text: "0-255"
                                color: "#0b0b0b"
                                font.pixelSize: 30
                                horizontalAlignment: Text.AlignLeft
                                font.italic: false
                                font.bold: false
                                font.weight: Font.normal

                                Text {
                                    id: frontECM_c3l1
                                    anchors.left: parent.left
                                    anchors.leftMargin: 135
                                    y: 0
                                    text: "???"
                                    color: "#0b0b0b"
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignLeft
                                    font.italic: false
                                    font.bold: false
                                    font.weight: Font.normal

                                    Component.onCompleted: {
                                    backend.updateHydTempRaw.connect((hydTempValueRaw) => {
                                        frontECM_c3l1.text = hydTempValueRaw;
                                        });
                                    }

                                    Text {
                                        id: frontECM_c4l1
                                        anchors.left: parent.left
                                        anchors.leftMargin: 167
                                        y: 0
                                        text: "*(9/5)+32"
                                        color: "#0b0b0b"
                                        font.pixelSize: 30
                                        horizontalAlignment: Text.AlignLeft
                                        font.italic: false
                                        font.bold: false
                                        font.weight: Font.normal

                                        Text {
                                            id: frontECM_c5l1
                                            anchors.left: parent.left
                                            anchors.leftMargin: 160
                                            y: 0
                                            text: "???"
                                            color: "#0b0b0b"
                                            font.pixelSize: 30
                                            horizontalAlignment: Text.AlignLeft
                                            font.italic: false
                                            font.bold: false
                                            font.weight: Font.normal

                                            Component.onCompleted: {
                                            backend.updateHydTemp.connect((hydTempValue) => {
                                                frontECM_c3l1.text = hydTempValue;
                                                });
                                            }

                                            Text {
                                                id: frontECM_c6l1
                                                anchors.left: parent.left
                                                anchors.leftMargin: 227
                                                y: 0
                                                text: "°F"
                                                color: "#0b0b0b"
                                                font.pixelSize: 30
                                                horizontalAlignment: Text.AlignLeft
                                                font.italic: false
                                                font.bold: false
                                                font.weight: Font.normal

                                                Text {
                                                    id: frontECM_c7l1
                                                    anchors.left: parent.left
                                                    anchors.leftMargin: 150
                                                    y: 0
                                                    text: "???"
                                                    color: "#0b0b0b"
                                                    font.pixelSize: 30
                                                    horizontalAlignment: Text.AlignLeft
                                                    font.italic: false
                                                    font.bold: false
                                                    font.weight: Font.normal

                                                    Text {
                                                        id: frontECM_c8l1
                                                        anchors.left: parent.left
                                                        anchors.leftMargin: 128
                                                        y: 0
                                                        text: "???"
                                                        color: "#0b0b0b"
                                                        font.pixelSize: 30
                                                        horizontalAlignment: Text.AlignLeft
                                                        font.italic: false
                                                        font.bold: false
                                                        font.weight: Font.normal
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }

                        CloseButtonSettigns {
                            id: closeButtonFrontECM
                            x: 41
                            y: 855

                            Connections {
                                target: closeButtonFrontECM
                                onClicked: sensorsStack.currentIndex = 0
                                //console.log: "BUTTON PRESSED!!!"
                            }

                            Connections {
                                target: closeButtonFrontECM
                                onClicked: functionLine.visible = false
                            }
                        }
                    }

                    //### engine ###//
                    Rectangle {
                        id: sensorsStackIndex2
                        anchors.horizontalCenter: parent.horizontalCenter
                        width: parent.width
                        height: parent.height
                        color: "#00ffffff"

                        Text {
                            id: engineTitleDataview
                            color: "#0b0b0b"
                            text: qsTr("Engine Data")
                            font.pixelSize: 40
                            horizontalAlignment: Text.AlignHCenter
                            font.italic: true
                            font.bold: true
                            font.weight: Font.DemiBold

                            anchors.left: parent.left
                            anchors.leftMargin: 20
                            anchors.top: parent.top
                            anchors.topMargin: 20
                        }

                        Text {
                            id: engine_c1l1
                            x: 100
                            y: 155
                            text: "Accelerator Pedal Pos."
                            color: "#0b0b0b"
                            font.pixelSize: 30
                            horizontalAlignment: Text.AlignLeft
                            font.italic: false
                            font.bold: false
                            font.weight: Font.normal

                            Text {
                                id: engine_c1l2
                                x: 0
                                y: 50
                                text: "% Load"
                                color: "#0b0b0b"
                                font.pixelSize: 30
                                horizontalAlignment: Text.AlignLeft
                                font.italic: false
                                font.bold: false
                                font.weight: Font.normal

                                Text {
                                    id: engine_c1l3
                                    x: 0
                                    y: 50
                                    text: "Engine Speed"
                                    color: "#0b0b0b"
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignLeft
                                    font.italic: false
                                    font.bold: false
                                    font.weight: Font.normal

                                    Text {
                                        id: engine_c1l4
                                        x: 0
                                        y: 50
                                        text: "Fuel Rate"
                                        color: "#0b0b0b"
                                        font.pixelSize: 30
                                        horizontalAlignment: Text.AlignLeft
                                        font.italic: false
                                        font.bold: false
                                        font.weight: Font.normal

                                        Text {
                                            id: engine_c1l5
                                            x: 0
                                            y: 50
                                            text: "Intake Air Temperature"
                                            color: "#0b0b0b"
                                            font.pixelSize: 30
                                            horizontalAlignment: Text.AlignLeft
                                            font.italic: false
                                            font.bold: false
                                            font.weight: Font.normal

                                            Text {
                                                id: engine_c1l6
                                                x: 0
                                                y: 50
                                                text: "Battery Voltage"
                                                color: "#0b0b0b"
                                                font.pixelSize: 30
                                                horizontalAlignment: Text.AlignLeft
                                                font.italic: false
                                                font.bold: false
                                                font.weight: Font.normal

                                                Text {
                                                    id: engine_c1l7
                                                    x: 0
                                                    y: 50
                                                    text: "Air Intake Pressure"
                                                    color: "#0b0b0b"
                                                    font.pixelSize: 30
                                                    horizontalAlignment: Text.AlignLeft
                                                    font.italic: false
                                                    font.bold: false
                                                    font.weight: Font.normal

                                                    Text {
                                                        id: engine_c2l7
                                                        anchors.left: parent.left
                                                        anchors.leftMargin: 340
                                                        y: 0
                                                        text: "-"
                                                        color: "#0b0b0b"
                                                        font.pixelSize: 30
                                                        horizontalAlignment: Text.AlignLeft
                                                        font.italic: false
                                                        font.bold: false
                                                        font.weight: Font.normal

                                                        Text {
                                                            id: engine_c3l7
                                                            anchors.left: parent.left
                                                            anchors.leftMargin: 135
                                                            y: 0
                                                            text: "???"
                                                            color: "#0b0b0b"
                                                            font.pixelSize: 30
                                                            horizontalAlignment: Text.AlignLeft
                                                            font.italic: false
                                                            font.bold: false
                                                            font.weight: Font.normal

                                                            Component.onCompleted: {
                                                                backend.updateBarometricRaw.connect((updateBarometricRawValue) => {
                                                                    engine_c3l7.text = updateBarometricRawValue;  // Update gauge
                                                                });
                                                            }

                                                            Text {
                                                                id: engine_c4l7
                                                                anchors.left: parent.left
                                                                anchors.leftMargin: 167
                                                                y: 0
                                                                text: "*1 - 40"
                                                                color: "#0b0b0b"
                                                                font.pixelSize: 30
                                                                horizontalAlignment: Text.AlignLeft
                                                                font.italic: false
                                                                font.bold: false
                                                                font.weight: Font.normal

                                                                Text {
                                                                    id: engine_c5l7
                                                                    anchors.left: parent.left
                                                                    anchors.leftMargin: 160
                                                                    y: 0
                                                                    text: "???"
                                                                    color: "#0b0b0b"
                                                                    font.pixelSize: 30
                                                                    horizontalAlignment: Text.AlignLeft
                                                                    font.italic: false
                                                                    font.bold: false
                                                                    font.weight: Font.normal

                                                                    Component.onCompleted: {
                                                                        backend.updateBarometric.connect((updateBarometricValue) => {
                                                                            engine_c5l7.text = updateBarometricValue;  // Update gauge
                                                                        });
                                                                    }

                                                                    Text {
                                                                        id: engine_c6l7
                                                                        anchors.left: parent.left
                                                                        anchors.leftMargin: 227
                                                                        y: 0
                                                                        text: "inHg"
                                                                        color: "#0b0b0b"
                                                                        font.pixelSize: 30
                                                                        horizontalAlignment: Text.AlignLeft
                                                                        font.italic: false
                                                                        font.bold: false
                                                                        font.weight: Font.normal

                                                                        Text {
                                                                            id: engine_c7l7
                                                                            anchors.left: parent.left
                                                                            anchors.leftMargin: 150
                                                                            y: 0
                                                                            text: "???"
                                                                            color: "#0b0b0b"
                                                                            font.pixelSize: 30
                                                                            horizontalAlignment: Text.AlignLeft
                                                                            font.italic: false
                                                                            font.bold: false
                                                                            font.weight: Font.normal

                                                                            Text {
                                                                                id: engine_c8l7
                                                                                anchors.left: parent.left
                                                                                anchors.leftMargin: 128
                                                                                y: 0
                                                                                text: "???"
                                                                                color: "#0b0b0b"
                                                                                font.pixelSize: 30
                                                                                horizontalAlignment: Text.AlignLeft
                                                                                font.italic: false
                                                                                font.bold: false
                                                                                font.weight: Font.normal
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }

                                                Text {
                                                    id: engine_c2l6
                                                    anchors.left: parent.left
                                                    anchors.leftMargin: 340
                                                    y: 0
                                                    text: "0 - 3212"
                                                    color: "#0b0b0b"
                                                    font.pixelSize: 30
                                                    horizontalAlignment: Text.AlignLeft
                                                    font.italic: false
                                                    font.bold: false
                                                    font.weight: Font.normal

                                                    Text {
                                                        id: engine_c3l6
                                                        anchors.left: parent.left
                                                        anchors.leftMargin: 135
                                                        y: 0
                                                        text: "???"
                                                        color: "#0b0b0b"
                                                        font.pixelSize: 30
                                                        horizontalAlignment: Text.AlignLeft
                                                        font.italic: false
                                                        font.bold: false
                                                        font.weight: Font.normal

                                                        Component.onCompleted: {
                                                            backend.updateBattVoltsRaw.connect((updateBattVoltsRawValue) => {
                                                                engine_c3l6.text = updateBattVoltsRawValue;  // Update gauge
                                                            });
                                                        }

                                                        Text {
                                                            id: engine_c4l6
                                                            anchors.left: parent.left
                                                            anchors.leftMargin: 167
                                                            y: 0
                                                            text: "0.05"
                                                            color: "#0b0b0b"
                                                            font.pixelSize: 30
                                                            horizontalAlignment: Text.AlignLeft
                                                            font.italic: false
                                                            font.bold: false
                                                            font.weight: Font.normal

                                                            Text {
                                                                id: engine_c5l6
                                                                anchors.left: parent.left
                                                                anchors.leftMargin: 160
                                                                y: 0
                                                                text: "???"
                                                                color: "#0b0b0b"
                                                                font.pixelSize: 30
                                                                horizontalAlignment: Text.AlignLeft
                                                                font.italic: false
                                                                font.bold: false
                                                                font.weight: Font.normal

                                                                Component.onCompleted: {
                                                                    backend.updateBattVolts.connect((updateBattVoltsValue) => {
                                                                        engine_c5l6.text = updateBattVoltsValue;  // Update gauge
                                                                    });
                                                                }

                                                                Text {
                                                                    id: engine_c6l6
                                                                    anchors.left: parent.left
                                                                    anchors.leftMargin: 227
                                                                    y: 0
                                                                    text: "volts"
                                                                    color: "#0b0b0b"
                                                                    font.pixelSize: 30
                                                                    horizontalAlignment: Text.AlignLeft
                                                                    font.italic: false
                                                                    font.bold: false
                                                                    font.weight: Font.normal

                                                                    Text {
                                                                        id: engine_c7l6
                                                                        anchors.left: parent.left
                                                                        anchors.leftMargin: 150
                                                                        y: 0
                                                                        text: "???"
                                                                        color: "#0b0b0b"
                                                                        font.pixelSize: 30
                                                                        horizontalAlignment: Text.AlignLeft
                                                                        font.italic: false
                                                                        font.bold: false
                                                                        font.weight: Font.normal

                                                                        Text {
                                                                            id: engine_c8l6
                                                                            anchors.left: parent.left
                                                                            anchors.leftMargin: 128
                                                                            y: 0
                                                                            text: "???"
                                                                            color: "#0b0b0b"
                                                                            font.pixelSize: 30
                                                                            horizontalAlignment: Text.AlignLeft
                                                                            font.italic: false
                                                                            font.bold: false
                                                                            font.weight: Font.normal
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }

                                            Text {
                                                id: engine_c2l5
                                                anchors.left: parent.left
                                                anchors.leftMargin: 340
                                                y: 0
                                                text: "-40 - 210"
                                                color: "#0b0b0b"
                                                font.pixelSize: 30
                                                horizontalAlignment: Text.AlignLeft
                                                font.italic: false
                                                font.bold: false
                                                font.weight: Font.normal

                                                Text {
                                                    id: engine_c3l5
                                                    anchors.left: parent.left
                                                    anchors.leftMargin: 135
                                                    y: 0
                                                    text: "???"
                                                    color: "#0b0b0b"
                                                    font.pixelSize: 30
                                                    horizontalAlignment: Text.AlignLeft
                                                    font.italic: false
                                                    font.bold: false
                                                    font.weight: Font.normal

                                                    Component.onCompleted: {
                                                    backend.updateIntakeTempRaw.connect((intakeTempRawValue) => {
                                                        engine_c3l5.text = intakeTempRawValue;
                                                        });
                                                    }

                                                    Text {
                                                        id: engine_c4l5
                                                        anchors.left: parent.left
                                                        anchors.leftMargin: 167
                                                        y: 0
                                                        text: "*1 - 40"
                                                        color: "#0b0b0b"
                                                        font.pixelSize: 30
                                                        horizontalAlignment: Text.AlignLeft
                                                        font.italic: false
                                                        font.bold: false
                                                        font.weight: Font.normal

                                                        Text {
                                                            id: engine_c5l5
                                                            anchors.left: parent.left
                                                            anchors.leftMargin: 160
                                                            y: 0
                                                            text: "???"
                                                            color: "#0b0b0b"
                                                            font.pixelSize: 30
                                                            horizontalAlignment: Text.AlignLeft
                                                            font.italic: false
                                                            font.bold: false
                                                            font.weight: Font.normal

                                                            Component.onCompleted: {
                                                            backend.updateIntakeTemp.connect((intakeTempValue) => {
                                                                engine_c5l5.text = intakeTempValue;
                                                                });
                                                            }

                                                            Text {
                                                                id: engine_c6l5
                                                                anchors.left: parent.left
                                                                anchors.leftMargin: 227
                                                                y: 0
                                                                text: "°F"
                                                                color: "#0b0b0b"
                                                                font.pixelSize: 30
                                                                horizontalAlignment: Text.AlignLeft
                                                                font.italic: false
                                                                font.bold: false
                                                                font.weight: Font.normal

                                                                Text {
                                                                    id: engine_c7l5
                                                                    anchors.left: parent.left
                                                                    anchors.leftMargin: 150
                                                                    y: 0
                                                                    text: "???"
                                                                    color: "#0b0b0b"
                                                                    font.pixelSize: 30
                                                                    horizontalAlignment: Text.AlignLeft
                                                                    font.italic: false
                                                                    font.bold: false
                                                                    font.weight: Font.normal

                                                                    Text {
                                                                        id: engine_c8l5
                                                                        anchors.left: parent.left
                                                                        anchors.leftMargin: 128
                                                                        y: 0
                                                                        text: "???"
                                                                        color: "#0b0b0b"
                                                                        font.pixelSize: 30
                                                                        horizontalAlignment: Text.AlignLeft
                                                                        font.italic: false
                                                                        font.bold: false
                                                                        font.weight: Font.normal
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }

                                        Text {
                                            id: engine_c2l4
                                            anchors.left: parent.left
                                            anchors.leftMargin: 340
                                            y: 0
                                            text: "0 - 3000"
                                            color: "#0b0b0b"
                                            font.pixelSize: 30
                                            horizontalAlignment: Text.AlignLeft
                                            font.italic: false
                                            font.bold: false
                                            font.weight: Font.normal

                                            Text {
                                                id: engine_c3l4
                                                anchors.left: parent.left
                                                anchors.leftMargin: 135
                                                y: 0
                                                text: "???"
                                                color: "#0b0b0b"
                                                font.pixelSize: 30
                                                horizontalAlignment: Text.AlignLeft
                                                font.italic: false
                                                font.bold: false
                                                font.weight: Font.normal

                                                Component.onCompleted: {
                                                    backend.updateFuelRateRaw.connect((updateFuelRateRawValue) => {
                                                        engine_c3l4.text = updateFuelRateRawValue;  // Update gauge
                                                    });
                                                }

                                                Text {
                                                    id: engine_c4l4
                                                    anchors.left: parent.left
                                                    anchors.leftMargin: 167
                                                    y: 0
                                                    text: "0.05"
                                                    color: "#0b0b0b"
                                                    font.pixelSize: 30
                                                    horizontalAlignment: Text.AlignLeft
                                                    font.italic: false
                                                    font.bold: false
                                                    font.weight: Font.normal

                                                    Text {
                                                        id: engine_c5l4
                                                        anchors.left: parent.left
                                                        anchors.leftMargin: 160
                                                        y: 0
                                                        text: "???"
                                                        color: "#0b0b0b"
                                                        font.pixelSize: 30
                                                        horizontalAlignment: Text.AlignLeft
                                                        font.italic: false
                                                        font.bold: false
                                                        font.weight: Font.normal

                                                        Component.onCompleted: {
                                                            backend.updateFuelRate.connect((updateFuelRateValue) => {
                                                                engine_c5l4.text = updateFuelRateValue;  // Update gauge
                                                            });
                                                        }

                                                        Text {
                                                            id: engine_c6l4
                                                            anchors.left: parent.left
                                                            anchors.leftMargin: 227
                                                            y: 0
                                                            text: "gal/min"
                                                            color: "#0b0b0b"
                                                            font.pixelSize: 30
                                                            horizontalAlignment: Text.AlignLeft
                                                            font.italic: false
                                                            font.bold: false
                                                            font.weight: Font.normal

                                                            Text {
                                                                id: engine_c7l4
                                                                anchors.left: parent.left
                                                                anchors.leftMargin: 150
                                                                y: 0
                                                                text: "???"
                                                                color: "#0b0b0b"
                                                                font.pixelSize: 30
                                                                horizontalAlignment: Text.AlignLeft
                                                                font.italic: false
                                                                font.bold: false
                                                                font.weight: Font.normal

                                                                Text {
                                                                    id: engine_c8l4
                                                                    anchors.left: parent.left
                                                                    anchors.leftMargin: 128
                                                                    y: 0
                                                                    text: "???"
                                                                    color: "#0b0b0b"
                                                                    font.pixelSize: 30
                                                                    horizontalAlignment: Text.AlignLeft
                                                                    font.italic: false
                                                                    font.bold: false
                                                                    font.weight: Font.normal
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }

                                    Text {
                                        id: engine_c2l3
                                        anchors.left: parent.left
                                        anchors.leftMargin: 340
                                        y: 0
                                        text: "0 - 8"
                                        color: "#0b0b0b"
                                        font.pixelSize: 30
                                        horizontalAlignment: Text.AlignLeft
                                        font.italic: false
                                        font.bold: false
                                        font.weight: Font.normal

                                        Text {
                                            id: engine_c3l3
                                            anchors.left: parent.left
                                            anchors.leftMargin: 135
                                            y: 0
                                            text: "???"
                                            color: "#0b0b0b"
                                            font.pixelSize: 30
                                            horizontalAlignment: Text.AlignLeft
                                            font.italic: false
                                            font.bold: false
                                            font.weight: Font.normal

                                            Component.onCompleted: {
                                                backend.updateRPMraw.connect((rpmRaw) => {
                                                    //console.log("Received RPM:", value);
                                                    engine_c3l3.text = rpmRaw;  // Update gauge
                                                });
                                            }

                                            Text {
                                                id: engine_c4l3
                                                anchors.left: parent.left
                                                anchors.leftMargin: 167
                                                y: 0
                                                text: "0.125"
                                                color: "#0b0b0b"
                                                font.pixelSize: 30
                                                horizontalAlignment: Text.AlignLeft
                                                font.italic: false
                                                font.bold: false
                                                font.weight: Font.normal

                                                Text {
                                                    id: fengine_c5l3
                                                    anchors.left: parent.left
                                                    anchors.leftMargin: 160
                                                    y: 0
                                                    text: "???"
                                                    color: "#0b0b0b"
                                                    font.pixelSize: 30
                                                    horizontalAlignment: Text.AlignLeft
                                                    font.italic: false
                                                    font.bold: false
                                                    font.weight: Font.normal

                                                    Component.onCompleted: {
                                                    backend.updateRPM.connect((value) => {
                                                        //console.log("Received RPM:", value);
                                                        fengine_c5l3.text = value;  // Update gauge
                                                        });
                                                    }

                                                    Text {
                                                        id: engine_c6l3
                                                        anchors.left: parent.left
                                                        anchors.leftMargin: 227
                                                        y: 0
                                                        text: "rpm"
                                                        color: "#0b0b0b"
                                                        font.pixelSize: 30
                                                        horizontalAlignment: Text.AlignLeft
                                                        font.italic: false
                                                        font.bold: false
                                                        font.weight: Font.normal

                                                        Text {
                                                            id: engine_c7l3
                                                            anchors.left: parent.left
                                                            anchors.leftMargin: 150
                                                            y: 0
                                                            text: "???"
                                                            color: "#0b0b0b"
                                                            font.pixelSize: 30
                                                            horizontalAlignment: Text.AlignLeft
                                                            font.italic: false
                                                            font.bold: false
                                                            font.weight: Font.normal

                                                            Text {
                                                                id: engine_c8l3
                                                                anchors.left: parent.left
                                                                anchors.leftMargin: 128
                                                                y: 0
                                                                text: "???"
                                                                color: "#0b0b0b"
                                                                font.pixelSize: 30
                                                                horizontalAlignment: Text.AlignLeft
                                                                font.italic: false
                                                                font.bold: false
                                                                font.weight: Font.normal
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }

                                Text {
                                    id: engine_c2l2
                                    anchors.left: parent.left
                                    anchors.leftMargin: 340
                                    y: 0
                                    text: "0 - 125"
                                    color: "#0b0b0b"
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignLeft
                                    font.italic: false
                                    font.bold: false
                                    font.weight: Font.normal

                                    Text {
                                        id: engine_c3l2
                                        anchors.left: parent.left
                                        anchors.leftMargin: 135
                                        y: 0
                                        text: "???"
                                        color: "#0b0b0b"
                                        font.pixelSize: 30
                                        horizontalAlignment: Text.AlignLeft
                                        font.italic: false
                                        font.bold: false
                                        font.weight: Font.normal

                                        Component.onCompleted: {
                                            backend.updateEngLoadRaw.connect((engineLoadValueRaw) => {
                                                engine_c3l2.text = engineLoadValueRaw;  // Update gauge
                                            });
                                        }

                                        Text {
                                            id: engine_c4l2
                                            anchors.left: parent.left
                                            anchors.leftMargin: 167
                                            y: 0
                                            text: "0.01"
                                            color: "#0b0b0b"
                                            font.pixelSize: 30
                                            horizontalAlignment: Text.AlignLeft
                                            font.italic: false
                                            font.bold: false
                                            font.weight: Font.normal

                                            Text {
                                                id: engine_c5l2
                                                anchors.left: parent.left
                                                anchors.leftMargin: 160
                                                y: 0
                                                text: "???"
                                                color: "#0b0b0b"
                                                font.pixelSize: 30
                                                horizontalAlignment: Text.AlignLeft
                                                font.italic: false
                                                font.bold: false
                                                font.weight: Font.normal

                                                Component.onCompleted: {
                                                    backend.updateEngLoad.connect((engineLoadValue) => {
                                                        engine_c5l2.text = engineLoadValue;  // Update gauge
                                                    });
                                                }

                                                Text {
                                                    id: engine_c6l2
                                                    anchors.left: parent.left
                                                    anchors.leftMargin: 227
                                                    y: 0
                                                    text: "%"
                                                    color: "#0b0b0b"
                                                    font.pixelSize: 30
                                                    horizontalAlignment: Text.AlignLeft
                                                    font.italic: false
                                                    font.bold: false
                                                    font.weight: Font.normal

                                                    Text {
                                                        id: engine_c7l2
                                                        anchors.left: parent.left
                                                        anchors.leftMargin: 150
                                                        y: 0
                                                        text: "???"
                                                        color: "#0b0b0b"
                                                        font.pixelSize: 30
                                                        horizontalAlignment: Text.AlignLeft
                                                        font.italic: false
                                                        font.bold: false
                                                        font.weight: Font.normal

                                                        Text {
                                                            id: engine_c8l2
                                                            anchors.left: parent.left
                                                            anchors.leftMargin: 128
                                                            y: 0
                                                            text: "???"
                                                            color: "#0b0b0b"
                                                            font.pixelSize: 30
                                                            horizontalAlignment: Text.AlignLeft
                                                            font.italic: false
                                                            font.bold: false
                                                            font.weight: Font.normal
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }

                            Text {
                                id: engine_c2l1
                                anchors.left: parent.left
                                anchors.leftMargin: 340
                                y: 0
                                text: "0 - 100"
                                color: "#0b0b0b"
                                font.pixelSize: 30
                                horizontalAlignment: Text.AlignLeft
                                font.italic: false
                                font.bold: false
                                font.weight: Font.normal

                                Text {
                                    id: engine_c3l1
                                    anchors.left: parent.left
                                    anchors.leftMargin: 135
                                    y: 0
                                    text: "???"
                                    color: "#0b0b0b"
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignLeft
                                    font.italic: false
                                    font.bold: false
                                    font.weight: Font.normal

                                    Component.onCompleted: {
                                        backend.updateAccelPosRaw.connect((updateAccelPosRawValue) => {
                                            engine_c3l1.text = updateAccelPosRawValue;  // Update gauge
                                        });
                                    }

                                    Text {
                                        id: engine_c4l1
                                        anchors.left: parent.left
                                        anchors.leftMargin: 167
                                        y: 0
                                        text: "0.004"
                                        color: "#0b0b0b"
                                        font.pixelSize: 30
                                        horizontalAlignment: Text.AlignLeft
                                        font.italic: false
                                        font.bold: false
                                        font.weight: Font.normal

                                        Text {
                                            id: engine_c5l1
                                            anchors.left: parent.left
                                            anchors.leftMargin: 160
                                            y: 0
                                            text: "???"
                                            color: "#0b0b0b"
                                            font.pixelSize: 30
                                            horizontalAlignment: Text.AlignLeft
                                            font.italic: false
                                            font.bold: false
                                            font.weight: Font.normal

                                            Component.onCompleted: {
                                                backend.updateAccelPos.connect((updateAccelPosValue) => {
                                                    engine_c5l1.text = updateAccelPosValue;  // Update gauge
                                                });
                                            }

                                            Text {
                                                id: engine_c6l1
                                                anchors.left: parent.left
                                                anchors.leftMargin: 227
                                                y: 0
                                                text: "%"
                                                color: "#0b0b0b"
                                                font.pixelSize: 30
                                                horizontalAlignment: Text.AlignLeft
                                                font.italic: false
                                                font.bold: false
                                                font.weight: Font.normal

                                                Text {
                                                    id: engine_c7l1
                                                    anchors.left: parent.left
                                                    anchors.leftMargin: 150
                                                    y: 0
                                                    text: "???"
                                                    color: "#0b0b0b"
                                                    font.pixelSize: 30
                                                    horizontalAlignment: Text.AlignLeft
                                                    font.italic: false
                                                    font.bold: false
                                                    font.weight: Font.normal

                                                    Text {
                                                        id: engine_c8l1
                                                        anchors.left: parent.left
                                                        anchors.leftMargin: 128
                                                        y: 0
                                                        text: "???"
                                                        color: "#0b0b0b"
                                                        font.pixelSize: 30
                                                        horizontalAlignment: Text.AlignLeft
                                                        font.italic: false
                                                        font.bold: false
                                                        font.weight: Font.normal
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }

                        CloseButtonSettigns {
                            id: closeButtonEngine
                            x: 41
                            y: 855

                            Connections {
                                target: closeButtonEngine
                                onClicked: sensorsStack.currentIndex = 0
                                //console.log: "BUTTON PRESSED!!!"
                            }

                            Connections {
                                target: closeButtonEngine
                                onClicked: functionLine.visible = false
                            }
                        }
                    }

                    //### joystick ###//
                    Rectangle {
                        id: sensorsStackIndex3
                        anchors.horizontalCenter: parent.horizontalCenter
                        width: parent.width
                        height: parent.height
                        color: "#00ffffff"

                        Text {
                            id: joystickTitle
                            color: "#0b0b0b"
                            text: qsTr("Joystick Data")
                            font.pixelSize: 40
                            horizontalAlignment: Text.AlignHCenter
                            font.italic: true
                            font.bold: true
                            font.weight: Font.DemiBold

                            anchors.left: parent.left
                            anchors.leftMargin: 20
                            anchors.top: parent.top
                            anchors.topMargin: 20
                        }

                        Text {
                            id: joystick_c1l1
                            x: 100
                            y: 155
                            text: "Not yet implemented"
                            color: "#0b0b0b"
                            font.pixelSize: 30
                            horizontalAlignment: Text.AlignLeft
                            font.italic: false
                            font.bold: false
                            font.weight: Font.normal

                            Text {
                                id: joystick_c2l1
                                y: 0
                                text: "XXXXX"
                                color: "#0b0b0b"
                                font.pixelSize: 30
                                font.bold: false
                                font.weight: Font.normal

                                anchors.left: parent.left
                                anchors.leftMargin: 340
                            }
                        }



                        CloseButtonSettigns {
                            id: closeButtonJoystick
                            x: 41
                            y: 855

                            Connections {
                                target: closeButtonJoystick
                                onClicked: sensorsStack.currentIndex = 0
                                //console.log: "BUTTON PRESSED!!!"
                            }

                            Connections {
                                target: closeButtonJoystick
                                onClicked: functionLine.visible = false
                            }
                        }
                    }

                    //### console ecm ###//
                    Rectangle {
                        id: sensorsStackIndex4
                        anchors.horizontalCenter: parent.horizontalCenter
                        width: parent.width
                        height: parent.height
                        color: "#00ffffff"

                        Text {
                            id: consoleTitle
                            color: "#0b0b0b"
                            text: qsTr("Console ECM Data")
                            font.pixelSize: 40
                            horizontalAlignment: Text.AlignHCenter
                            font.italic: true
                            font.bold: true
                            font.weight: Font.DemiBold

                            anchors.left: parent.left
                            anchors.leftMargin: 20
                            anchors.top: parent.top
                            anchors.topMargin: 20
                        }

                        Text {
                            id: console_c1l1
                            x: 100
                            y: 155
                            text: "Data unavailable"
                            color: "#0b0b0b"
                            font.pixelSize: 30
                            horizontalAlignment: Text.AlignLeft
                            font.italic: false
                            font.bold: false
                            font.weight: Font.normal

                            Text {
                                id: console_c2l1
                                y: 0
                                text: "XXXXX"
                                color: "#0b0b0b"
                                font.pixelSize: 30
                                font.bold: false
                                font.weight: Font.normal

                                anchors.left: parent.left
                                anchors.leftMargin: 340
                            }
                        }

                        CloseButtonSettigns {
                            id: closeButtonConsole
                            x: 41
                            y: 855

                            Connections {
                                target: closeButtonConsole
                                onClicked: sensorsStack.currentIndex = 0
                                //console.log: "BUTTON PRESSED!!!"
                            }

                            Connections {
                                target: closeButtonConsole
                                onClicked: functionLine.visible = false
                            }
                        }
                    }

                    //### steering ecm ###//
                    Rectangle {
                        id: sensorsStackIndex5
                        anchors.horizontalCenter: parent.horizontalCenter
                        width: parent.width
                        height: parent.height
                        color: "#00ffffff"

                        Text {
                            id: steeringTitle
                            color: "#0b0b0b"
                            text: qsTr("Steering ECM Data")
                            font.pixelSize: 40
                            horizontalAlignment: Text.AlignHCenter
                            font.italic: true
                            font.bold: true
                            font.weight: Font.DemiBold

                            anchors.left: parent.left
                            anchors.leftMargin: 20
                            anchors.top: parent.top
                            anchors.topMargin: 20
                        }

                        Text {
                            id: steering_c1l1
                            x: 100
                            y: 155
                            text: "Steering Velocity"
                            color: "#0b0b0b"
                            font.pixelSize: 30
                            horizontalAlignment: Text.AlignLeft
                            font.italic: false
                            font.bold: false
                            font.weight: Font.normal

                            Text {
                                id: steering_c2l1
                                y: 0
                                text: "-"
                                color: "#0b0b0b"
                                font.pixelSize: 30
                                font.bold: false
                                font.weight: Font.normal

                                anchors.left: parent.left
                                anchors.leftMargin: 340

                                Text {
                                    id: steering_c3l1
                                    y: 0
                                    text: "???"
                                    color: "#0b0b0b"
                                    font.pixelSize: 30
                                    font.bold: false
                                    font.weight: Font.normal

                                    anchors.left: parent.left
                                    anchors.leftMargin: 135

                                    Component.onCompleted: {
                                        backend.updateSteerVelocityRaw.connect((updateSteerVelocityRawValue) => {
                                            steering_c3l1.text = updateSteerVelocityRawValue;  // Update gauge
                                        });
                                    }

                                    Text {
                                        id: steering_c4l1
                                        y: 0
                                        text: "100"
                                        color: "#0b0b0b"
                                        font.pixelSize: 30
                                        font.bold: false
                                        font.weight: Font.normal

                                        anchors.left: parent.left
                                        anchors.leftMargin: 167

                                        Text {
                                            id: steering_c5l1
                                            y: 0
                                            text: "???"
                                            color: "#0b0b0b"
                                            font.pixelSize: 30
                                            font.bold: false
                                            font.weight: Font.normal

                                            anchors.left: parent.left
                                            anchors.leftMargin: 160

                                            Component.onCompleted: {
                                                backend.updateSteerVelocityRaw.connect((updateSteerVelocityRawValue) => {
                                                    steering_c5l1.text = (updateSteerVelocityRawValue * 100);  // Update gauge
                                                });
                                            }

                                            Text {
                                                id: steering_c6l1
                                                anchors.left: parent.left
                                                anchors.leftMargin: 227
                                                y: 0
                                                text: "rps"
                                                color: "#0b0b0b"
                                                font.pixelSize: 30
                                                horizontalAlignment: Text.AlignLeft
                                                font.italic: false
                                                font.bold: false
                                                font.weight: Font.normal

                                                Text {
                                                    id: steering_c7l1
                                                    anchors.left: parent.left
                                                    anchors.leftMargin: 150
                                                    y: 0
                                                    text: "???"
                                                    color: "#0b0b0b"
                                                    font.pixelSize: 30
                                                    horizontalAlignment: Text.AlignLeft
                                                    font.italic: false
                                                    font.bold: false
                                                    font.weight: Font.normal

                                                    Text {
                                                        id: steering_c8l1
                                                        anchors.left: parent.left
                                                        anchors.leftMargin: 128
                                                        y: 0
                                                        text: "???"
                                                        color: "#0b0b0b"
                                                        font.pixelSize: 30
                                                        horizontalAlignment: Text.AlignLeft
                                                        font.italic: false
                                                        font.bold: false
                                                        font.weight: Font.normal
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }

                            Text {
                                id: steering_c1l2
                                x: 0
                                y: 50
                                text: "Turnsignal Right"
                                color: "#0b0b0b"
                                font.pixelSize: 30
                                horizontalAlignment: Text.AlignLeft
                                font.italic: false
                                font.bold: false
                                font.weight: Font.normal

                                Text {
                                    id: steering_c2l2
                                    y: 0
                                    text: "-"
                                    color: "#0b0b0b"
                                    font.pixelSize: 30
                                    font.bold: false
                                    font.weight: Font.normal

                                    anchors.left: parent.left
                                    anchors.leftMargin: 340

                                    Text {
                                        id: steering_c3l2
                                        y: 0
                                        text: "???"
                                        color: "#0b0b0b"
                                        font.pixelSize: 30
                                        font.bold: false
                                        font.weight: Font.normal

                                        anchors.left: parent.left
                                        anchors.leftMargin: 135

                                        Component.onCompleted: {
                                            backend.updateRightTurn.connect((updateRightTurnValue) => {
                                                steering_c3l2.text = updateRightTurnValue;  // Update gauge
                                            });
                                        }

                                        Text {
                                            id: steering_c4l2
                                            y: 0
                                            text: "1"
                                            color: "#0b0b0b"
                                            font.pixelSize: 30
                                            font.bold: false
                                            font.weight: Font.normal

                                            anchors.left: parent.left
                                            anchors.leftMargin: 167

                                            Text {
                                                id: steering_c5l2
                                                y: 0
                                                text: "x"
                                                color: "#0b0b0b"
                                                font.pixelSize: 30
                                                font.bold: false
                                                font.weight: Font.normal

                                                anchors.left: parent.left
                                                anchors.leftMargin: 160

                                                Text {
                                                    id: steering_c6l2
                                                    anchors.left: parent.left
                                                    anchors.leftMargin: 227
                                                    y: 0
                                                    text: "on/off"
                                                    color: "#0b0b0b"
                                                    font.pixelSize: 30
                                                    horizontalAlignment: Text.AlignLeft
                                                    font.italic: false
                                                    font.bold: false
                                                    font.weight: Font.normal

                                                    Text {
                                                        id: steering_c7l2
                                                        anchors.left: parent.left
                                                        anchors.leftMargin: 150
                                                        y: 0
                                                        text: "-"
                                                        color: "#0b0b0b"
                                                        font.pixelSize: 30
                                                        horizontalAlignment: Text.AlignLeft
                                                        font.italic: false
                                                        font.bold: false
                                                        font.weight: Font.normal

                                                        Text {
                                                            id: steering_c8l2
                                                            anchors.left: parent.left
                                                            anchors.leftMargin: 128
                                                            y: 0
                                                            text: "-"
                                                            color: "#0b0b0b"
                                                            font.pixelSize: 30
                                                            horizontalAlignment: Text.AlignLeft
                                                            font.italic: false
                                                            font.bold: false
                                                            font.weight: Font.normal
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }

                                Text {
                                    id: steering_c1l3
                                    x: 0
                                    y: 50
                                    text: "Turnsignal Left"
                                    color: "#0b0b0b"
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignLeft
                                    font.italic: false
                                    font.bold: false
                                    font.weight: Font.normal

                                    Text {
                                        id: steering_c2l3
                                        y: 0
                                        text: "-"
                                        color: "#0b0b0b"
                                        font.pixelSize: 30
                                        font.bold: false
                                        font.weight: Font.normal

                                        anchors.left: parent.left
                                        anchors.leftMargin: 340

                                        Text {
                                            id: steering_c3l3
                                            y: 0
                                            text: "???"
                                            color: "#0b0b0b"
                                            font.pixelSize: 30
                                            font.bold: false
                                            font.weight: Font.normal

                                            anchors.left: parent.left
                                            anchors.leftMargin: 135

                                            Component.onCompleted: {
                                                backend.updateLeftTurn.connect((updateLeftTurnValue) => {
                                                    steering_c3l3.text = updateLeftTurnValue;  // Update gauge
                                                });
                                            }

                                            Text {
                                                id: steering_c4l3
                                                y: 0
                                                text: "1"
                                                color: "#0b0b0b"
                                                font.pixelSize: 30
                                                font.bold: false
                                                font.weight: Font.normal

                                                anchors.left: parent.left
                                                anchors.leftMargin: 167

                                                Text {
                                                    id: steering_c5l3
                                                    y: 0
                                                    text: "x"
                                                    color: "#0b0b0b"
                                                    font.pixelSize: 30
                                                    font.bold: false
                                                    font.weight: Font.normal

                                                    anchors.left: parent.left
                                                    anchors.leftMargin: 160

                                                    Text {
                                                        id: steering_c6l3
                                                        anchors.left: parent.left
                                                        anchors.leftMargin: 227
                                                        y: 0
                                                        text: "on/off"
                                                        color: "#0b0b0b"
                                                        font.pixelSize: 30
                                                        horizontalAlignment: Text.AlignLeft
                                                        font.italic: false
                                                        font.bold: false
                                                        font.weight: Font.normal

                                                        Text {
                                                            id: steering_c7l3
                                                            anchors.left: parent.left
                                                            anchors.leftMargin: 150
                                                            y: 0
                                                            text: "-"
                                                            color: "#0b0b0b"
                                                            font.pixelSize: 30
                                                            horizontalAlignment: Text.AlignLeft
                                                            font.italic: false
                                                            font.bold: false
                                                            font.weight: Font.normal

                                                            Text {
                                                                id: steering_c8l3
                                                                anchors.left: parent.left
                                                                anchors.leftMargin: 128
                                                                y: 0
                                                                text: "-"
                                                                color: "#0b0b0b"
                                                                font.pixelSize: 30
                                                                horizontalAlignment: Text.AlignLeft
                                                                font.italic: false
                                                                font.bold: false
                                                                font.weight: Font.normal
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }

                        CloseButtonSettigns {
                            id: closeButtonSteering
                            x: 41
                            y: 855

                            Connections {
                                target: closeButtonSteering
                                onClicked: sensorsStack.currentIndex = 0
                                //console.log: "BUTTON PRESSED!!!"
                            }

                            Connections {
                                target: closeButtonSteering
                                onClicked: functionLine.visible = false
                            }
                        }
                    }

                    //### MID ecm ###//
                    Rectangle {
                        id: sensorsStackIndex6
                        anchors.horizontalCenter: parent.horizontalCenter
                        width: parent.width
                        height: parent.height
                        color: "#00ffffff"

                        Text {
                            id: midTitle
                            color: "#0b0b0b"
                            text: qsTr("Mid ECM Data")
                            font.pixelSize: 40
                            horizontalAlignment: Text.AlignHCenter
                            font.italic: true
                            font.bold: true
                            font.weight: Font.DemiBold

                            anchors.left: parent.left
                            anchors.leftMargin: 20
                            anchors.top: parent.top
                            anchors.topMargin: 20
                        }

                        Text {
                            id: mid_c1l1
                            x: 100
                            y: 155
                            text: "Motor Speed"
                            color: "#0b0b0b"
                            font.pixelSize: 30
                            horizontalAlignment: Text.AlignLeft
                            font.italic: false
                            font.bold: false
                            font.weight: Font.normal

                            Text {
                                id: mid_c2l1
                                y: 0
                                text: "0-500"
                                color: "#0b0b0b"
                                font.pixelSize: 30
                                font.bold: false
                                font.weight: Font.normal

                                anchors.left: parent.left
                                anchors.leftMargin: 340

                                Text {
                                    id: mid_c3l1
                                    y: 0
                                    text: "???"
                                    color: "#0b0b0b"
                                    font.pixelSize: 30
                                    font.bold: false
                                    font.weight: Font.normal

                                    anchors.left: parent.left
                                    anchors.leftMargin: 135

                                    Component.onCompleted: {
                                    backend.updateHydMotorRPM.connect((updateHydMotorRPMvalue) => {
                                        mid_c3l1.text = (updateHydMotorRPMvalue);
                                        });
                                    }

                                    Text {
                                        id: mid_c4l1
                                        y: 0
                                        text: "1"
                                        color: "#0b0b0b"
                                        font.pixelSize: 30
                                        font.bold: false
                                        font.weight: Font.normal

                                        anchors.left: parent.left
                                        anchors.leftMargin: 167

                                        Text {
                                            id: mid_c5l1
                                            y: 0
                                            text: "x"
                                            color: "#0b0b0b"
                                            font.pixelSize: 30
                                            font.bold: false
                                            font.weight: Font.normal

                                            anchors.left: parent.left
                                            anchors.leftMargin: 160

                                            Text {
                                                id: mid_c6l1
                                                anchors.left: parent.left
                                                anchors.leftMargin: 227
                                                y: 0
                                                text: "rpm"
                                                color: "#0b0b0b"
                                                font.pixelSize: 30
                                                horizontalAlignment: Text.AlignLeft
                                                font.italic: false
                                                font.bold: false
                                                font.weight: Font.normal

                                                Text {
                                                    id: mid_c7l1
                                                    anchors.left: parent.left
                                                    anchors.leftMargin: 150
                                                    y: 0
                                                    text: "???"
                                                    color: "#0b0b0b"
                                                    font.pixelSize: 30
                                                    horizontalAlignment: Text.AlignLeft
                                                    font.italic: false
                                                    font.bold: false
                                                    font.weight: Font.normal

                                                    Text {
                                                        id: mid_c8l1
                                                        anchors.left: parent.left
                                                        anchors.leftMargin: 128
                                                        y: 0
                                                        text: "???"
                                                        color: "#0b0b0b"
                                                        font.pixelSize: 30
                                                        horizontalAlignment: Text.AlignLeft
                                                        font.italic: false
                                                        font.bold: false
                                                        font.weight: Font.normal
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }

                            Text {
                                id: mid_c1l2
                                x: 0
                                y: 50
                                text: "Wheel Speed"
                                color: "#0b0b0b"
                                font.pixelSize: 30
                                horizontalAlignment: Text.AlignLeft
                                font.italic: false
                                font.bold: false
                                font.weight: Font.normal

                                Text {
                                    id: mid_c2l2
                                    y: 0
                                    text: "0-15"
                                    color: "#0b0b0b"
                                    font.pixelSize: 30
                                    font.bold: false
                                    font.weight: Font.normal

                                    anchors.left: parent.left
                                    anchors.leftMargin: 340

                                    Text {
                                        id: mid_c3l2
                                        y: 0
                                        text: "???"
                                        color: "#0b0b0b"
                                        font.pixelSize: 30
                                        font.bold: false
                                        font.weight: Font.normal

                                        anchors.left: parent.left
                                        anchors.leftMargin: 135

                                        Component.onCompleted: {
                                        backend.updateSpeedo.connect((speedValue) => {
                                            mid_c3l2.text = speedValue;
                                            });
                                        }

                                        Text {
                                            id: mid_c4l2
                                            y: 0
                                            text: "10"
                                            color: "#0b0b0b"
                                            font.pixelSize: 30
                                            font.bold: false
                                            font.weight: Font.normal

                                            anchors.left: parent.left
                                            anchors.leftMargin: 167

                                            Text {
                                                id: mid_c5l2
                                                y: 0
                                                text: "???"
                                                color: "#0b0b0b"
                                                font.pixelSize: 30
                                                font.bold: false
                                                font.weight: Font.normal

                                                anchors.left: parent.left
                                                anchors.leftMargin: 160

                                                Component.onCompleted: {
                                                backend.updateSpeedo.connect((speedValue) => {
                                                    mid_c5l2.text = (speedValue * 10);
                                                    });
                                                }

                                                Text {
                                                    id: mid_c6l2
                                                    anchors.left: parent.left
                                                    anchors.leftMargin: 227
                                                    y: 0
                                                    text: "mph"
                                                    color: "#0b0b0b"
                                                    font.pixelSize: 30
                                                    horizontalAlignment: Text.AlignLeft
                                                    font.italic: false
                                                    font.bold: false
                                                    font.weight: Font.normal

                                                    Text {
                                                        id: mid_c7l2
                                                        anchors.left: parent.left
                                                        anchors.leftMargin: 150
                                                        y: 0
                                                        text: "???"
                                                        color: "#0b0b0b"
                                                        font.pixelSize: 30
                                                        horizontalAlignment: Text.AlignLeft
                                                        font.italic: false
                                                        font.bold: false
                                                        font.weight: Font.normal

                                                        Text {
                                                            id: mid_c8l2
                                                            anchors.left: parent.left
                                                            anchors.leftMargin: 128
                                                            y: 0
                                                            text: "???"
                                                            color: "#0b0b0b"
                                                            font.pixelSize: 30
                                                            horizontalAlignment: Text.AlignLeft
                                                            font.italic: false
                                                            font.bold: false
                                                            font.weight: Font.normal
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }

                                Text {
                                    id: mid_c1l3
                                    x: 0
                                    y: 50
                                    text: "Brake Switch"
                                    color: "#0b0b0b"
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignLeft
                                    font.italic: false
                                    font.bold: false
                                    font.weight: Font.normal

                                    Text {
                                        id: mid_c2l3
                                        y: 0
                                        text: "0-1"
                                        color: "#0b0b0b"
                                        font.pixelSize: 30
                                        font.bold: false
                                        font.weight: Font.normal

                                        anchors.left: parent.left
                                        anchors.leftMargin: 340

                                        Text {
                                            id: mid_c3l3
                                            y: 0
                                            text: "???"
                                            color: "#0b0b0b"
                                            font.pixelSize: 30
                                            font.bold: false
                                            font.weight: Font.normal

                                            anchors.left: parent.left
                                            anchors.leftMargin: 135

                                            Component.onCompleted: {
                                            backend.updateBrakeSwitch.connect((updateBrakeSwitchValue) => {
                                                mid_c3l3.text = updateBrakeSwitchValue;
                                                });
                                            }

                                            Text {
                                                id: mid_c4l3
                                                y: 0
                                                text: "1"
                                                color: "#0b0b0b"
                                                font.pixelSize: 30
                                                font.bold: false
                                                font.weight: Font.normal

                                                anchors.left: parent.left
                                                anchors.leftMargin: 167

                                                Text {
                                                    id: mid_c5l3
                                                    y: 0
                                                    text: "x"
                                                    color: "#0b0b0b"
                                                    font.pixelSize: 30
                                                    font.bold: false
                                                    font.weight: Font.normal

                                                    anchors.left: parent.left
                                                    anchors.leftMargin: 160

                                                    Text {
                                                        id: mid_c6l3
                                                        anchors.left: parent.left
                                                        anchors.leftMargin: 227
                                                        y: 0
                                                        text: "on/off"
                                                        color: "#0b0b0b"
                                                        font.pixelSize: 30
                                                        horizontalAlignment: Text.AlignLeft
                                                        font.italic: false
                                                        font.bold: false
                                                        font.weight: Font.normal

                                                        Text {
                                                            id: mid_c7l3
                                                            anchors.left: parent.left
                                                            anchors.leftMargin: 150
                                                            y: 0
                                                            text: "-"
                                                            color: "#0b0b0b"
                                                            font.pixelSize: 30
                                                            horizontalAlignment: Text.AlignLeft
                                                            font.italic: false
                                                            font.bold: false
                                                            font.weight: Font.normal

                                                            Text {
                                                                id: mid_c8l3
                                                                anchors.left: parent.left
                                                                anchors.leftMargin: 128
                                                                y: 0
                                                                text: "-"
                                                                color: "#0b0b0b"
                                                                font.pixelSize: 30
                                                                horizontalAlignment: Text.AlignLeft
                                                                font.italic: false
                                                                font.bold: false
                                                                font.weight: Font.normal
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }



                        CloseButtonSettigns {
                            id: closeButtonMid
                            x: 41
                            y: 855

                            Connections {
                                target: closeButtonMid
                                onClicked: sensorsStack.currentIndex = 0
                                //console.log: "BUTTON PRESSED!!!"
                            }

                            Connections {
                                target: closeButtonMid
                                onClicked: functionLine.visible = false
                            }
                        }
                    }

                    //### pump ecm ###//
                    Rectangle {
                        id: sensorsStackIndex7
                        anchors.horizontalCenter: parent.horizontalCenter
                        width: parent.width
                        height: parent.height
                        color: "#00ffffff"

                        Text {
                            id: pumpTitle
                            color: "#0b0b0b"
                            text: qsTr("Pump ECM Data")
                            font.pixelSize: 40
                            horizontalAlignment: Text.AlignHCenter
                            font.italic: true
                            font.bold: true
                            font.weight: Font.DemiBold

                            anchors.left: parent.left
                            anchors.leftMargin: 20
                            anchors.top: parent.top
                            anchors.topMargin: 20
                        }

                        Text {
                            id: pumpPage
                            x: 1105
                            y: 877
                            text: "Page 1 of 2"
                            color: "#0b0b0b"
                            font.pixelSize: 30
                            font.weight: Font.DemiBold
                        }

                        GenaricButtonGrey {
                            id: genaricButtonGreyPump
                            x: 1277
                            y: 865
                            buttonText: "Next →"

                            Connections {
                                target: genaricButtonGreyPump
                                onClicked: sensorsStack.currentIndex = 8
                            }

                            Connections {
                                target: genaricButtonGreyPump
                                onClicked: bar8.visible = false
                            }

                            Connections {
                                target: genaricButtonGreyPump
                                onClicked: functionLine.height = 390
                            }
                        }

                        GenaricButtonGrey {
                            id: genaricButtonGreyPump111
                            x: 883
                            y: 865
                            buttonText: "← Previous"
                        }

                        Text {
                            id: pump_c1l1
                            x: 100
                            y: 155
                            text: "Pump Pressure 1"
                            color: "#0b0b0b"
                            font.pixelSize: 30
                            horizontalAlignment: Text.AlignLeft
                            font.italic: false
                            font.bold: false
                            font.weight: Font.normal

                            Text {
                                id: pump_c2l1
                                y: 0
                                text: "0-4000"
                                color: "#0b0b0b"
                                font.pixelSize: 30
                                font.bold: false
                                font.weight: Font.normal

                                anchors.left: parent.left
                                anchors.leftMargin: 340

                                Text {
                                    id: pump_c3l1
                                    y: 0
                                    text: "???"
                                    color: "#0b0b0b"
                                    font.pixelSize: 30
                                    font.bold: false
                                    font.weight: Font.normal

                                    anchors.left: parent.left
                                    anchors.leftMargin: 135

                                    Component.onCompleted: {
                                    backend.updateHydHighPressA.connect((hydPSIvalue) => {
                                        pump_c3l1.text = hydPSIvalue;
                                        });
                                    }

                                    Text {
                                        id: pump_c4l1
                                        y: 0
                                        text: "1"
                                        color: "#0b0b0b"
                                        font.pixelSize: 30
                                        font.bold: false
                                        font.weight: Font.normal

                                        anchors.left: parent.left
                                        anchors.leftMargin: 167

                                        Text {
                                            id: pump_c5l1
                                            y: 0
                                            text: "x"
                                            color: "#0b0b0b"
                                            font.pixelSize: 30
                                            font.bold: false
                                            font.weight: Font.normal

                                            anchors.left: parent.left
                                            anchors.leftMargin: 160

                                            Text {
                                                id: pump_c6l1
                                                anchors.left: parent.left
                                                anchors.leftMargin: 227
                                                y: 0
                                                text: "psi"
                                                color: "#0b0b0b"
                                                font.pixelSize: 30
                                                horizontalAlignment: Text.AlignLeft
                                                font.italic: false
                                                font.bold: false
                                                font.weight: Font.normal

                                                Text {
                                                    id: pump_c7l1
                                                    anchors.left: parent.left
                                                    anchors.leftMargin: 150
                                                    y: 0
                                                    text: "???"
                                                    color: "#0b0b0b"
                                                    font.pixelSize: 30
                                                    horizontalAlignment: Text.AlignLeft
                                                    font.italic: false
                                                    font.bold: false
                                                    font.weight: Font.normal

                                                    Text {
                                                        id: pump_c8l1
                                                        anchors.left: parent.left
                                                        anchors.leftMargin: 128
                                                        y: 0
                                                        text: "???"
                                                        color: "#0b0b0b"
                                                        font.pixelSize: 30
                                                        horizontalAlignment: Text.AlignLeft
                                                        font.italic: false
                                                        font.bold: false
                                                        font.weight: Font.normal
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }

                            Text {
                                id: pump_c1l2
                                x: 0
                                y: 50
                                text: "Pump Pressure 2"
                                color: "#0b0b0b"
                                font.pixelSize: 30
                                horizontalAlignment: Text.AlignLeft
                                font.italic: false
                                font.bold: false
                                font.weight: Font.normal

                                Text {
                                    id: pump_c2l2
                                    y: 0
                                    text: "0-4000"
                                    color: "#0b0b0b"
                                    font.pixelSize: 30
                                    font.bold: false
                                    font.weight: Font.normal

                                    anchors.left: parent.left
                                    anchors.leftMargin: 340

                                    Text {
                                        id: pump_c3l2
                                        y: 0
                                        text: "???"
                                        color: "#0b0b0b"
                                        font.pixelSize: 30
                                        font.bold: false
                                        font.weight: Font.normal

                                        anchors.left: parent.left
                                        anchors.leftMargin: 135

                                        Component.onCompleted: {
                                        backend.updateHydHighPressB.connect((hydHighPressBValue) => {
                                            pump_c3l2.text = (hydHighPressBValue);  // Update gauge
                                            });
                                        }

                                        Text {
                                            id: pump_c4l2
                                            y: 0
                                            text: "1"
                                            color: "#0b0b0b"
                                            font.pixelSize: 30
                                            font.bold: false
                                            font.weight: Font.normal

                                            anchors.left: parent.left
                                            anchors.leftMargin: 167

                                            Text {
                                                id: pump_c5l2
                                                y: 0
                                                text: "x"
                                                color: "#0b0b0b"
                                                font.pixelSize: 30
                                                font.bold: false
                                                font.weight: Font.normal

                                                anchors.left: parent.left
                                                anchors.leftMargin: 160

                                                Text {
                                                    id: pump_c6l2
                                                    anchors.left: parent.left
                                                    anchors.leftMargin: 227
                                                    y: 0
                                                    text: "psi"
                                                    color: "#0b0b0b"
                                                    font.pixelSize: 30
                                                    horizontalAlignment: Text.AlignLeft
                                                    font.italic: false
                                                    font.bold: false
                                                    font.weight: Font.normal

                                                    Text {
                                                        id: pump_c7l2
                                                        anchors.left: parent.left
                                                        anchors.leftMargin: 150
                                                        y: 0
                                                        text: "???"
                                                        color: "#0b0b0b"
                                                        font.pixelSize: 30
                                                        horizontalAlignment: Text.AlignLeft
                                                        font.italic: false
                                                        font.bold: false
                                                        font.weight: Font.normal

                                                        Text {
                                                            id: pump_c8l2
                                                            anchors.left: parent.left
                                                            anchors.leftMargin: 128
                                                            y: 0
                                                            text: "???"
                                                            color: "#0b0b0b"
                                                            font.pixelSize: 30
                                                            horizontalAlignment: Text.AlignLeft
                                                            font.italic: false
                                                            font.bold: false
                                                            font.weight: Font.normal
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }

                                Text {
                                    id: pump_c1l3
                                    x: 0
                                    y: 50
                                    text: "Steer Current"
                                    color: "#0b0b0b"
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignLeft
                                    font.italic: false
                                    font.bold: false
                                    font.weight: Font.normal

                                    Text {
                                        id: pump_c2l3
                                        y: 0
                                        text: "0-1300"
                                        color: "#0b0b0b"
                                        font.pixelSize: 30
                                        font.bold: false
                                        font.weight: Font.normal

                                        anchors.left: parent.left
                                        anchors.leftMargin: 340

                                        Text {
                                            id: pump_c3l3
                                            y: 0
                                            text: "???"
                                            color: "#0b0b0b"
                                            font.pixelSize: 30
                                            font.bold: false
                                            font.weight: Font.normal

                                            anchors.left: parent.left
                                            anchors.leftMargin: 135

                                            Component.onCompleted: {
                                            backend.updateSteerCurrent.connect((updateSteerCurrentValue) => {
                                                pump_c3l3.text = (updateSteerCurrentValue);  // Update gauge
                                                });
                                            }

                                            Text {
                                                id: pump_c4l3
                                                y: 0
                                                text: "1"
                                                color: "#0b0b0b"
                                                font.pixelSize: 30
                                                font.bold: false
                                                font.weight: Font.normal

                                                anchors.left: parent.left
                                                anchors.leftMargin: 167

                                                Text {
                                                    id: pump_c5l3
                                                    y: 0
                                                    text: "x"
                                                    color: "#0b0b0b"
                                                    font.pixelSize: 30
                                                    font.bold: false
                                                    font.weight: Font.normal

                                                    anchors.left: parent.left
                                                    anchors.leftMargin: 160

                                                    Text {
                                                        id: pump_c6l3
                                                        anchors.left: parent.left
                                                        anchors.leftMargin: 227
                                                        y: 0
                                                        text: "mA"
                                                        color: "#0b0b0b"
                                                        font.pixelSize: 30
                                                        horizontalAlignment: Text.AlignLeft
                                                        font.italic: false
                                                        font.bold: false
                                                        font.weight: Font.normal

                                                        Text {
                                                            id: pump_c7l3
                                                            anchors.left: parent.left
                                                            anchors.leftMargin: 150
                                                            y: 0
                                                            text: "???"
                                                            color: "#0b0b0b"
                                                            font.pixelSize: 30
                                                            horizontalAlignment: Text.AlignLeft
                                                            font.italic: false
                                                            font.bold: false
                                                            font.weight: Font.normal

                                                            Text {
                                                                id: pump_c8l3
                                                                anchors.left: parent.left
                                                                anchors.leftMargin: 128
                                                                y: 0
                                                                text: "???"
                                                                color: "#0b0b0b"
                                                                font.pixelSize: 30
                                                                horizontalAlignment: Text.AlignLeft
                                                                font.italic: false
                                                                font.bold: false
                                                                font.weight: Font.normal
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }

                                    Text {
                                        id: pump_c1l4
                                        x: 0
                                        y: 50
                                        text: "Pump Current"
                                        color: "#0b0b0b"
                                        font.pixelSize: 30
                                        horizontalAlignment: Text.AlignLeft
                                        font.italic: false
                                        font.bold: false
                                        font.weight: Font.normal

                                        Text {
                                            id: pump_c2l4
                                            y: 0
                                            text: "0-1300"
                                            color: "#0b0b0b"
                                            font.pixelSize: 30
                                            font.bold: false
                                            font.weight: Font.normal

                                            anchors.left: parent.left
                                            anchors.leftMargin: 340

                                            Text {
                                                id: pump_c3l4
                                                y: 0
                                                text: "???"
                                                color: "#0b0b0b"
                                                font.pixelSize: 30
                                                font.bold: false
                                                font.weight: Font.normal

                                                anchors.left: parent.left
                                                anchors.leftMargin: 135

                                                Component.onCompleted: {
                                                backend.updateHydControlCurrent.connect((updateHydControlCurrentValue) => {
                                                    pump_c3l4.text = (updateHydControlCurrentValue);
                                                    });
                                                }

                                                Text {
                                                    id: pump_c4l4
                                                    y: 0
                                                    text: "1"
                                                    color: "#0b0b0b"
                                                    font.pixelSize: 30
                                                    font.bold: false
                                                    font.weight: Font.normal

                                                    anchors.left: parent.left
                                                    anchors.leftMargin: 167

                                                    Text {
                                                        id: pump_c5l4
                                                        y: 0
                                                        text: "x"
                                                        color: "#0b0b0b"
                                                        font.pixelSize: 30
                                                        font.bold: false
                                                        font.weight: Font.normal

                                                        anchors.left: parent.left
                                                        anchors.leftMargin: 160

                                                        Text {
                                                            id: pump_c6l4
                                                            anchors.left: parent.left
                                                            anchors.leftMargin: 227
                                                            y: 0
                                                            text: "mA"
                                                            color: "#0b0b0b"
                                                            font.pixelSize: 30
                                                            horizontalAlignment: Text.AlignLeft
                                                            font.italic: false
                                                            font.bold: false
                                                            font.weight: Font.normal

                                                            Text {
                                                                id: pump_c7l4
                                                                anchors.left: parent.left
                                                                anchors.leftMargin: 150
                                                                y: 0
                                                                text: "???"
                                                                color: "#0b0b0b"
                                                                font.pixelSize: 30
                                                                horizontalAlignment: Text.AlignLeft
                                                                font.italic: false
                                                                font.bold: false
                                                                font.weight: Font.normal

                                                                Text {
                                                                    id: pump_c8l4
                                                                    anchors.left: parent.left
                                                                    anchors.leftMargin: 128
                                                                    y: 0
                                                                    text: "???"
                                                                    color: "#0b0b0b"
                                                                    font.pixelSize: 30
                                                                    horizontalAlignment: Text.AlignLeft
                                                                    font.italic: false
                                                                    font.bold: false
                                                                    font.weight: Font.normal
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }

                                        Text {
                                            id: pump_c1l5
                                            x: 0
                                            y: 50
                                            text: "Swashplate Position"
                                            color: "#0b0b0b"
                                            font.pixelSize: 30
                                            horizontalAlignment: Text.AlignLeft
                                            font.italic: false
                                            font.bold: false
                                            font.weight: Font.normal

                                            Text {
                                                id: pump_c2l5
                                                y: 0
                                                text: "0-100"
                                                color: "#0b0b0b"
                                                font.pixelSize: 30
                                                font.bold: false
                                                font.weight: Font.normal

                                                anchors.left: parent.left
                                                anchors.leftMargin: 340

                                                Text {
                                                    id: pump_c3l5
                                                    y: 0
                                                    text: "???"
                                                    color: "#0b0b0b"
                                                    font.pixelSize: 30
                                                    font.bold: false
                                                    font.weight: Font.normal

                                                    anchors.left: parent.left
                                                    anchors.leftMargin: 135

                                                    Component.onCompleted: {
                                                    backend.updateSwashPOS.connect((updateSwashPOSvalue) => {
                                                        pump_c3l5.text = updateSwashPOSvalue;
                                                        });
                                                    }

                                                    Text {
                                                        id: pump_c4l5
                                                        y: 0
                                                        text: "1"
                                                        color: "#0b0b0b"
                                                        font.pixelSize: 30
                                                        font.bold: false
                                                        font.weight: Font.normal

                                                        anchors.left: parent.left
                                                        anchors.leftMargin: 167

                                                        Text {
                                                            id: pump_c5l5
                                                            y: 0
                                                            text: "x"
                                                            color: "#0b0b0b"
                                                            font.pixelSize: 30
                                                            font.bold: false
                                                            font.weight: Font.normal

                                                            anchors.left: parent.left
                                                            anchors.leftMargin: 160

                                                            Text {
                                                                id: pump_c6l5
                                                                anchors.left: parent.left
                                                                anchors.leftMargin: 227
                                                                y: 0
                                                                text: "%"
                                                                color: "#0b0b0b"
                                                                font.pixelSize: 30
                                                                horizontalAlignment: Text.AlignLeft
                                                                font.italic: false
                                                                font.bold: false
                                                                font.weight: Font.normal

                                                                Text {
                                                                    id: pump_c7l5
                                                                    anchors.left: parent.left
                                                                    anchors.leftMargin: 150
                                                                    y: 0
                                                                    text: "???"
                                                                    color: "#0b0b0b"
                                                                    font.pixelSize: 30
                                                                    horizontalAlignment: Text.AlignLeft
                                                                    font.italic: false
                                                                    font.bold: false
                                                                    font.weight: Font.normal

                                                                    Text {
                                                                        id: pump_c8l5
                                                                        anchors.left: parent.left
                                                                        anchors.leftMargin: 128
                                                                        y: 0
                                                                        text: "???"
                                                                        color: "#0b0b0b"
                                                                        font.pixelSize: 30
                                                                        horizontalAlignment: Text.AlignLeft
                                                                        font.italic: false
                                                                        font.bold: false
                                                                        font.weight: Font.normal
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }

                                            Text {
                                                id: pump_c1l6
                                                x: 0
                                                y: 50
                                                text: "Swashplate Limit"
                                                color: "#0b0b0b"
                                                font.pixelSize: 30
                                                horizontalAlignment: Text.AlignLeft
                                                font.italic: false
                                                font.bold: false
                                                font.weight: Font.normal

                                                Text {
                                                    id: pump_c2l6
                                                    y: 0
                                                    text: "0-100"
                                                    color: "#0b0b0b"
                                                    font.pixelSize: 30
                                                    font.bold: false
                                                    font.weight: Font.normal

                                                    anchors.left: parent.left
                                                    anchors.leftMargin: 340

                                                    Text {
                                                        id: pump_c3l6
                                                        y: 0
                                                        text: "???"
                                                        color: "#0b0b0b"
                                                        font.pixelSize: 30
                                                        font.bold: false
                                                        font.weight: Font.normal

                                                        anchors.left: parent.left
                                                        anchors.leftMargin: 135

                                                        Component.onCompleted: {
                                                        backend.updateSwashLimit.connect((updateSwashLimitValue) => {
                                                            pump_c3l6.text = updateSwashLimitValue;
                                                            });
                                                        }

                                                        Text {
                                                            id: pump_c4l6
                                                            y: 0
                                                            text: "1"
                                                            color: "#0b0b0b"
                                                            font.pixelSize: 30
                                                            font.bold: false
                                                            font.weight: Font.normal

                                                            anchors.left: parent.left
                                                            anchors.leftMargin: 167

                                                            Text {
                                                                id: pump_c5l6
                                                                y: 0
                                                                text: "x"
                                                                color: "#0b0b0b"
                                                                font.pixelSize: 30
                                                                font.bold: false
                                                                font.weight: Font.normal

                                                                anchors.left: parent.left
                                                                anchors.leftMargin: 160

                                                                Text {
                                                                    id: pump_c6l6
                                                                    anchors.left: parent.left
                                                                    anchors.leftMargin: 227
                                                                    y: 0
                                                                    text: "%"
                                                                    color: "#0b0b0b"
                                                                    font.pixelSize: 30
                                                                    horizontalAlignment: Text.AlignLeft
                                                                    font.italic: false
                                                                    font.bold: false
                                                                    font.weight: Font.normal

                                                                    Text {
                                                                        id: pump_c7l6
                                                                        anchors.left: parent.left
                                                                        anchors.leftMargin: 150
                                                                        y: 0
                                                                        text: "???"
                                                                        color: "#0b0b0b"
                                                                        font.pixelSize: 30
                                                                        horizontalAlignment: Text.AlignLeft
                                                                        font.italic: false
                                                                        font.bold: false
                                                                        font.weight: Font.normal

                                                                        Text {
                                                                            id: pump_c8l6
                                                                            anchors.left: parent.left
                                                                            anchors.leftMargin: 128
                                                                            y: 0
                                                                            text: "???"
                                                                            color: "#0b0b0b"
                                                                            font.pixelSize: 30
                                                                            horizontalAlignment: Text.AlignLeft
                                                                            font.italic: false
                                                                            font.bold: false
                                                                            font.weight: Font.normal
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }

                                                Text {
                                                    id: pump_c1l7
                                                    x: 0
                                                    y: 50
                                                    text: "Pump Pressure Volts 1"
                                                    color: "#0b0b0b"
                                                    font.pixelSize: 30
                                                    horizontalAlignment: Text.AlignLeft
                                                    font.italic: false
                                                    font.bold: false
                                                    font.weight: Font.normal

                                                    Text {
                                                        id: pump_c2l7
                                                        y: 0
                                                        text: "0-5"
                                                        color: "#0b0b0b"
                                                        font.pixelSize: 30
                                                        font.bold: false
                                                        font.weight: Font.normal

                                                        anchors.left: parent.left
                                                        anchors.leftMargin: 340

                                                        Text {
                                                            id: pump_c3l7
                                                            y: 0
                                                            text: "???"
                                                            color: "#0b0b0b"
                                                            font.pixelSize: 30
                                                            font.bold: false
                                                            font.weight: Font.normal

                                                            anchors.left: parent.left
                                                            anchors.leftMargin: 135

                                                            Component.onCompleted: {
                                                            backend.updatep1volts.connect((updatep1voltsValue) => {
                                                                pump_c3l7.text = updatep1voltsValue;
                                                                });
                                                            }

                                                            Text {
                                                                id: pump_c4l7
                                                                y: 0
                                                                text: "100"
                                                                color: "#0b0b0b"
                                                                font.pixelSize: 30
                                                                font.bold: false
                                                                font.weight: Font.normal

                                                                anchors.left: parent.left
                                                                anchors.leftMargin: 167

                                                                Text {
                                                                    id: pump_c5l7
                                                                    y: 0
                                                                    text: "???"
                                                                    color: "#0b0b0b"
                                                                    font.pixelSize: 30
                                                                    font.bold: false
                                                                    font.weight: Font.normal

                                                                    anchors.left: parent.left
                                                                    anchors.leftMargin: 160

                                                                    Component.onCompleted: {
                                                                    backend.updatep1volts.connect((updatep1voltsValue) => {
                                                                        pump_c5l7.text = (updatep1voltsValue * 100);
                                                                        });
                                                                    }

                                                                    Text {
                                                                        id: pump_c6l7
                                                                        anchors.left: parent.left
                                                                        anchors.leftMargin: 227
                                                                        y: 0
                                                                        text: "volts"
                                                                        color: "#0b0b0b"
                                                                        font.pixelSize: 30
                                                                        horizontalAlignment: Text.AlignLeft
                                                                        font.italic: false
                                                                        font.bold: false
                                                                        font.weight: Font.normal

                                                                        Text {
                                                                            id: pump_c7l7
                                                                            anchors.left: parent.left
                                                                            anchors.leftMargin: 150
                                                                            y: 0
                                                                            text: "???"
                                                                            color: "#0b0b0b"
                                                                            font.pixelSize: 30
                                                                            horizontalAlignment: Text.AlignLeft
                                                                            font.italic: false
                                                                            font.bold: false
                                                                            font.weight: Font.normal

                                                                            Text {
                                                                                id: pump_c8l7
                                                                                anchors.left: parent.left
                                                                                anchors.leftMargin: 128
                                                                                y: 0
                                                                                text: "???"
                                                                                color: "#0b0b0b"
                                                                                font.pixelSize: 30
                                                                                horizontalAlignment: Text.AlignLeft
                                                                                font.italic: false
                                                                                font.bold: false
                                                                                font.weight: Font.normal
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }

                                                    Text {
                                                        id: pump_c1l8
                                                        x: 0
                                                        y: 50
                                                        text: "Pump Pressure Volts 2"
                                                        color: "#0b0b0b"
                                                        font.pixelSize: 30
                                                        horizontalAlignment: Text.AlignLeft
                                                        font.italic: false
                                                        font.bold: false
                                                        font.weight: Font.normal

                                                        Text {
                                                            id: pump_c2l8
                                                            y: 0
                                                            text: "0-5"
                                                            color: "#0b0b0b"
                                                            font.pixelSize: 30
                                                            font.bold: false
                                                            font.weight: Font.normal

                                                            anchors.left: parent.left
                                                            anchors.leftMargin: 340

                                                            Text {
                                                                id: pump_c3l8
                                                                y: 0
                                                                text: "???"
                                                                color: "#0b0b0b"
                                                                font.pixelSize: 30
                                                                font.bold: false
                                                                font.weight: Font.normal

                                                                anchors.left: parent.left
                                                                anchors.leftMargin: 135

                                                                Component.onCompleted: {
                                                                backend.updatep2volts.connect((updatep2voltsValue) => {
                                                                    pump_c3l8.text = updatep2voltsValue;
                                                                    });
                                                                }

                                                                Text {
                                                                    id: pump_c4l8
                                                                    y: 0
                                                                    text: "100"
                                                                    color: "#0b0b0b"
                                                                    font.pixelSize: 30
                                                                    font.bold: false
                                                                    font.weight: Font.normal

                                                                    anchors.left: parent.left
                                                                    anchors.leftMargin: 167

                                                                    Text {
                                                                        id: pump_c5l8
                                                                        y: 0
                                                                        text: "???"
                                                                        color: "#0b0b0b"
                                                                        font.pixelSize: 30
                                                                        font.bold: false
                                                                        font.weight: Font.normal

                                                                        anchors.left: parent.left
                                                                        anchors.leftMargin: 160

                                                                        Component.onCompleted: {
                                                                        backend.updatep2volts.connect((updatep2voltsValue) => {
                                                                            pump_c5l8.text = (updatep2voltsValue * 100);
                                                                            });
                                                                        }

                                                                        Text {
                                                                            id: pump_c6l8
                                                                            anchors.left: parent.left
                                                                            anchors.leftMargin: 227
                                                                            y: 0
                                                                            text: "volts"
                                                                            color: "#0b0b0b"
                                                                            font.pixelSize: 30
                                                                            horizontalAlignment: Text.AlignLeft
                                                                            font.italic: false
                                                                            font.bold: false
                                                                            font.weight: Font.normal

                                                                            Text {
                                                                                id: pump_c7l8
                                                                                anchors.left: parent.left
                                                                                anchors.leftMargin: 150
                                                                                y: 0
                                                                                text: "???"
                                                                                color: "#0b0b0b"
                                                                                font.pixelSize: 30
                                                                                horizontalAlignment: Text.AlignLeft
                                                                                font.italic: false
                                                                                font.bold: false
                                                                                font.weight: Font.normal

                                                                                Text {
                                                                                    id: pump_c8l8
                                                                                    anchors.left: parent.left
                                                                                    anchors.leftMargin: 128
                                                                                    y: 0
                                                                                    text: "???"
                                                                                    color: "#0b0b0b"
                                                                                    font.pixelSize: 30
                                                                                    horizontalAlignment: Text.AlignLeft
                                                                                    font.italic: false
                                                                                    font.bold: false
                                                                                    font.weight: Font.normal
                                                                                }
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }

                                                        Text {
                                                            id: pump_c1l9
                                                            x: 0
                                                            y: 50
                                                            text: "Drive Mode"
                                                            color: "#0b0b0b"
                                                            font.pixelSize: 30
                                                            horizontalAlignment: Text.AlignLeft
                                                            font.italic: false
                                                            font.bold: false
                                                            font.weight: Font.normal

                                                            Text {
                                                                id: pump_c2l9
                                                                y: 0
                                                                text: "-"
                                                                color: "#0b0b0b"
                                                                font.pixelSize: 30
                                                                font.bold: false
                                                                font.weight: Font.normal

                                                                anchors.left: parent.left
                                                                anchors.leftMargin: 340

                                                                Text {
                                                                    id: pump_c3l9
                                                                    y: 0
                                                                    text: "???"
                                                                    color: "#0b0b0b"
                                                                    font.pixelSize: 30
                                                                    font.bold: false
                                                                    font.weight: Font.normal

                                                                    anchors.left: parent.left
                                                                    anchors.leftMargin: 135

                                                                    Component.onCompleted: {
                                                                        backend.updateDrivemode.connect((updateDrivemodeValue) => {
                                                                            pump_c3l9.text = (updateDrivemodeValue);  // Update gauge
                                                                        });
                                                                    }

                                                                    Text {
                                                                        id: pump_c4l9
                                                                        y: 0
                                                                        text: "1"
                                                                        color: "#0b0b0b"
                                                                        font.pixelSize: 30
                                                                        font.bold: false
                                                                        font.weight: Font.normal

                                                                        anchors.left: parent.left
                                                                        anchors.leftMargin: 167

                                                                        Text {
                                                                            id: pump_c5l9
                                                                            y: 0
                                                                            text: "x"
                                                                            color: "#0b0b0b"
                                                                            font.pixelSize: 30
                                                                            font.bold: false
                                                                            font.weight: Font.normal

                                                                            anchors.left: parent.left
                                                                            anchors.leftMargin: 160

                                                                            Text {
                                                                                id: pump_c6l9
                                                                                anchors.left: parent.left
                                                                                anchors.leftMargin: 227
                                                                                y: 0
                                                                                text: "1-4"
                                                                                color: "#0b0b0b"
                                                                                font.pixelSize: 30
                                                                                horizontalAlignment: Text.AlignLeft
                                                                                font.italic: false
                                                                                font.bold: false
                                                                                font.weight: Font.normal

                                                                                Text {
                                                                                    id: pump_c7l9
                                                                                    anchors.left: parent.left
                                                                                    anchors.leftMargin: 150
                                                                                    y: 0
                                                                                    text: "-"
                                                                                    color: "#0b0b0b"
                                                                                    font.pixelSize: 30
                                                                                    horizontalAlignment: Text.AlignLeft
                                                                                    font.italic: false
                                                                                    font.bold: false
                                                                                    font.weight: Font.normal

                                                                                    Text {
                                                                                        id: pump_c8l9
                                                                                        anchors.left: parent.left
                                                                                        anchors.leftMargin: 128
                                                                                        y: 0
                                                                                        text: "-"
                                                                                        color: "#0b0b0b"
                                                                                        font.pixelSize: 30
                                                                                        horizontalAlignment: Text.AlignLeft
                                                                                        font.italic: false
                                                                                        font.bold: false
                                                                                        font.weight: Font.normal
                                                                                    }
                                                                                }
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }



                        CloseButtonSettigns {
                            id: closeButtonPump
                            x: 41
                            y: 855

                            Connections {
                                target: closeButtonPump
                                onClicked: sensorsStack.currentIndex = 0
                                //console.log: "BUTTON PRESSED!!!"
                            }

                            Connections {
                                target: closeButtonPump
                                onClicked: functionLine.visible = false
                            }
                        }
                    }

                    //### pump2 ecm ###//
                    Rectangle {
                        id: sensorsStackIndex8
                        anchors.horizontalCenter: parent.horizontalCenter
                        width: parent.width
                        height: parent.height
                        color: "#00ffffff"

                        Text {
                            id: pump2Title
                            color: "#0b0b0b"
                            text: qsTr("Pump ECM Data")
                            font.pixelSize: 40
                            horizontalAlignment: Text.AlignHCenter
                            font.italic: true
                            font.bold: true
                            font.weight: Font.DemiBold

                            anchors.left: parent.left
                            anchors.leftMargin: 20
                            anchors.top: parent.top
                            anchors.topMargin: 20
                        }

                        Text {
                            id: pumpPage1
                            x: 1105
                            y: 877
                            text: "Page 2 of 2"
                            color: "#0b0b0b"
                            font.pixelSize: 30
                            font.weight: Font.DemiBold
                        }

                        GenaricButtonGrey {
                            id: genaricButtonGreyPump1
                            x: 1277
                            y: 865
                            buttonText: "Next →"
                        }

                        GenaricButtonGrey {
                            id: genaricButtonGreyPump11
                            x: 883
                            y: 865
                            buttonText: "← Previous"

                            Connections {
                                target: genaricButtonGreyPump11
                                onClicked: sensorsStack.currentIndex = 7
                            }

                            Connections {
                                target: genaricButtonGreyPump11
                                onClicked: bar8.visible = true
                            }

                            Connections {
                                target: genaricButtonGreyPump11
                                onClicked: functionLine.height = 490
                            }
                        }

                        Text {
                            id: pump2_c1l1
                            x: 100
                            y: 155
                            text: "Engine Speed Request"
                            color: "#0b0b0b"
                            font.pixelSize: 30
                            horizontalAlignment: Text.AlignLeft
                            font.italic: false
                            font.bold: false
                            font.weight: Font.normal

                            Text {
                                id: pump2_c2l1
                                y: 0
                                text: "-"
                                color: "#0b0b0b"
                                font.pixelSize: 30
                                font.bold: false
                                font.weight: Font.normal

                                anchors.left: parent.left
                                anchors.leftMargin: 340

                                Text {
                                    id: pump2_c3l1
                                    y: 0
                                    text: "???"
                                    color: "#0b0b0b"
                                    font.pixelSize: 30
                                    font.bold: false
                                    font.weight: Font.normal

                                    anchors.left: parent.left
                                    anchors.leftMargin: 135

                                    Text {
                                        id: pump2_c4l1
                                        y: 0
                                        text: "-"
                                        color: "#0b0b0b"
                                        font.pixelSize: 30
                                        font.bold: false
                                        font.weight: Font.normal

                                        anchors.left: parent.left
                                        anchors.leftMargin: 167

                                        Text {
                                            id: pump2_c5l1
                                            y: 0
                                            text: "???"
                                            color: "#0b0b0b"
                                            font.pixelSize: 30
                                            font.bold: false
                                            font.weight: Font.normal

                                            anchors.left: parent.left
                                            anchors.leftMargin: 160
                                        }
                                    }
                                }
                            }

                            Text {
                                id: pump2_c1l2
                                x: 0
                                y: 50
                                text: "Engine Setup 1"
                                color: "#0b0b0b"
                                font.pixelSize: 30
                                horizontalAlignment: Text.AlignLeft
                                font.italic: false
                                font.bold: false
                                font.weight: Font.normal

                                Text {
                                    id: pump2_c2l2
                                    y: 0
                                    text: "-"
                                    color: "#0b0b0b"
                                    font.pixelSize: 30
                                    font.bold: false
                                    font.weight: Font.normal

                                    anchors.left: parent.left
                                    anchors.leftMargin: 340

                                    Text {
                                        id: pump2_c3l2
                                        y: 0
                                        text: "???"
                                        color: "#0b0b0b"
                                        font.pixelSize: 30
                                        font.bold: false
                                        font.weight: Font.normal

                                        anchors.left: parent.left
                                        anchors.leftMargin: 135

                                        Text {
                                            id: pump2_c4l2
                                            y: 0
                                            text: "-"
                                            color: "#0b0b0b"
                                            font.pixelSize: 30
                                            font.bold: false
                                            font.weight: Font.normal

                                            anchors.left: parent.left
                                            anchors.leftMargin: 167

                                            Text {
                                                id: pump2_c5l2
                                                y: 0
                                                text: "???"
                                                color: "#0b0b0b"
                                                font.pixelSize: 30
                                                font.bold: false
                                                font.weight: Font.normal

                                                anchors.left: parent.left
                                                anchors.leftMargin: 160
                                            }
                                        }
                                    }
                                }

                                Text {
                                    id: pump2_c1l3
                                    x: 0
                                    y: 50
                                    text: "Engine Setup 2"
                                    color: "#0b0b0b"
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignLeft
                                    font.italic: false
                                    font.bold: false
                                    font.weight: Font.normal

                                    Text {
                                        id: pump2_c2l3
                                        y: 0
                                        text: "-"
                                        color: "#0b0b0b"
                                        font.pixelSize: 30
                                        font.bold: false
                                        font.weight: Font.normal

                                        anchors.left: parent.left
                                        anchors.leftMargin: 340

                                        Text {
                                            id: pump2_c3l3
                                            y: 0
                                            text: "???"
                                            color: "#0b0b0b"
                                            font.pixelSize: 30
                                            font.bold: false
                                            font.weight: Font.normal

                                            anchors.left: parent.left
                                            anchors.leftMargin: 135

                                            Text {
                                                id: pump2_c4l3
                                                y: 0
                                                text: "-"
                                                color: "#0b0b0b"
                                                font.pixelSize: 30
                                                font.bold: false
                                                font.weight: Font.normal

                                                anchors.left: parent.left
                                                anchors.leftMargin: 167

                                                Text {
                                                    id: pump2_c5l3
                                                    y: 0
                                                    text: "???"
                                                    color: "#0b0b0b"
                                                    font.pixelSize: 30
                                                    font.bold: false
                                                    font.weight: Font.normal

                                                    anchors.left: parent.left
                                                    anchors.leftMargin: 160
                                                }
                                            }
                                        }
                                    }

                                    Text {
                                        id: pump2_c1l4
                                        x: 0
                                        y: 50
                                        text: "Engine Setup 3"
                                        color: "#0b0b0b"
                                        font.pixelSize: 30
                                        horizontalAlignment: Text.AlignLeft
                                        font.italic: false
                                        font.bold: false
                                        font.weight: Font.normal

                                        Text {
                                            id: pump2_c2l4
                                            y: 0
                                            text: "-"
                                            color: "#0b0b0b"
                                            font.pixelSize: 30
                                            font.bold: false
                                            font.weight: Font.normal

                                            anchors.left: parent.left
                                            anchors.leftMargin: 340

                                            Text {
                                                id: pump2_c3l4
                                                y: 0
                                                text: "???"
                                                color: "#0b0b0b"
                                                font.pixelSize: 30
                                                font.bold: false
                                                font.weight: Font.normal

                                                anchors.left: parent.left
                                                anchors.leftMargin: 135

                                                Text {
                                                    id: pump2_c4l4
                                                    y: 0
                                                    text: "-"
                                                    color: "#0b0b0b"
                                                    font.pixelSize: 30
                                                    font.bold: false
                                                    font.weight: Font.normal

                                                    anchors.left: parent.left
                                                    anchors.leftMargin: 167

                                                    Text {
                                                        id: pump2_c5l4
                                                        y: 0
                                                        text: "???"
                                                        color: "#0b0b0b"
                                                        font.pixelSize: 30
                                                        font.bold: false
                                                        font.weight: Font.normal

                                                        anchors.left: parent.left
                                                        anchors.leftMargin: 160
                                                    }
                                                }
                                            }
                                        }

                                        Text {
                                            id: pump2_c1l5
                                            x: 0
                                            y: 50
                                            text: "Engine Setup 4"
                                            color: "#0b0b0b"
                                            font.pixelSize: 30
                                            horizontalAlignment: Text.AlignLeft
                                            font.italic: false
                                            font.bold: false
                                            font.weight: Font.normal

                                            Text {
                                                id: pump2_c2l5
                                                y: 0
                                                text: "-"
                                                color: "#0b0b0b"
                                                font.pixelSize: 30
                                                font.bold: false
                                                font.weight: Font.normal

                                                anchors.left: parent.left
                                                anchors.leftMargin: 340

                                                Text {
                                                    id: pump2_c3l5
                                                    y: 0
                                                    text: "???"
                                                    color: "#0b0b0b"
                                                    font.pixelSize: 30
                                                    font.bold: false
                                                    font.weight: Font.normal

                                                    anchors.left: parent.left
                                                    anchors.leftMargin: 135

                                                    Text {
                                                        id: pump2_c4l5
                                                        y: 0
                                                        text: "-"
                                                        color: "#0b0b0b"
                                                        font.pixelSize: 30
                                                        font.bold: false
                                                        font.weight: Font.normal

                                                        anchors.left: parent.left
                                                        anchors.leftMargin: 167

                                                        Text {
                                                            id: pump2_c5l5
                                                            y: 0
                                                            text: "???"
                                                            color: "#0b0b0b"
                                                            font.pixelSize: 30
                                                            font.bold: false
                                                            font.weight: Font.normal

                                                            anchors.left: parent.left
                                                            anchors.leftMargin: 160
                                                        }
                                                    }
                                                }
                                            }

                                            Text {
                                                id: pump2_c1l6
                                                x: 0
                                                y: 50
                                                text: "Engine Setup 5"
                                                color: "#0b0b0b"
                                                font.pixelSize: 30
                                                horizontalAlignment: Text.AlignLeft
                                                font.italic: false
                                                font.bold: false
                                                font.weight: Font.normal

                                                Text {
                                                    id: pump2_c2l6
                                                    y: 0
                                                    text: "-"
                                                    color: "#0b0b0b"
                                                    font.pixelSize: 30
                                                    font.bold: false
                                                    font.weight: Font.normal

                                                    anchors.left: parent.left
                                                    anchors.leftMargin: 340

                                                    Text {
                                                        id: pump2_c3l6
                                                        y: 0
                                                        text: "???"
                                                        color: "#0b0b0b"
                                                        font.pixelSize: 30
                                                        font.bold: false
                                                        font.weight: Font.normal

                                                        anchors.left: parent.left
                                                        anchors.leftMargin: 135

                                                        Text {
                                                            id: pump2_c4l6
                                                            y: 0
                                                            text: "-"
                                                            color: "#0b0b0b"
                                                            font.pixelSize: 30
                                                            font.bold: false
                                                            font.weight: Font.normal

                                                            anchors.left: parent.left
                                                            anchors.leftMargin: 167

                                                            Text {
                                                                id: pump2_c5l6
                                                                y: 0
                                                                text: "???"
                                                                color: "#0b0b0b"
                                                                font.pixelSize: 30
                                                                font.bold: false
                                                                font.weight: Font.normal

                                                                anchors.left: parent.left
                                                                anchors.leftMargin: 160
                                                            }
                                                        }
                                                    }
                                                }

                                                Text {
                                                    id: pump2_c1l7
                                                    x: 0
                                                    y: 50
                                                    text: "Engine Setup 5"
                                                    color: "#0b0b0b"
                                                    font.pixelSize: 30
                                                    horizontalAlignment: Text.AlignLeft
                                                    font.italic: false
                                                    font.bold: false
                                                    font.weight: Font.normal

                                                    Text {
                                                        id: pump2_c2l7
                                                        y: 0
                                                        text: "-"
                                                        color: "#0b0b0b"
                                                        font.pixelSize: 30
                                                        font.bold: false
                                                        font.weight: Font.normal

                                                        anchors.left: parent.left
                                                        anchors.leftMargin: 340

                                                        Text {
                                                            id: pump2_c3l7
                                                            y: 0
                                                            text: "???"
                                                            color: "#0b0b0b"
                                                            font.pixelSize: 30
                                                            font.bold: false
                                                            font.weight: Font.normal

                                                            anchors.left: parent.left
                                                            anchors.leftMargin: 135

                                                            Text {
                                                                id: pump2_c4l7
                                                                y: 0
                                                                text: "-"
                                                                color: "#0b0b0b"
                                                                font.pixelSize: 30
                                                                font.bold: false
                                                                font.weight: Font.normal

                                                                anchors.left: parent.left
                                                                anchors.leftMargin: 167

                                                                Text {
                                                                    id: pump2_c5l7
                                                                    y: 0
                                                                    text: "???"
                                                                    color: "#0b0b0b"
                                                                    font.pixelSize: 30
                                                                    font.bold: false
                                                                    font.weight: Font.normal

                                                                    anchors.left: parent.left
                                                                    anchors.leftMargin: 160
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }



                        CloseButtonSettigns {
                            id: closeButtonpump2
                            x: 41
                            y: 855

                            Connections {
                                target: closeButtonpump2
                                onClicked: sensorsStack.currentIndex = 0
                                //console.log: "BUTTON PRESSED!!!"
                            }

                            Connections {
                                target: closeButtonpump2
                                onClicked: functionLine.visible = false
                            }
                        }
                    }
                }
            }


                /*#######################################################*/
                //  stopwatch
                /*#######################################################*/
                Rectangle {
                    id: stopwatch
                    width: 200
                    height: 200
                    visible: true
                    color: "#ffffff"

                    Image {
                        id: newTestBackround8
                        anchors.top: parent.top
                        anchors.left: parent.left
                        source: "../images/NewTestBackround.png"
                        fillMode: Image.PreserveAspectFit
                    }
                }


                /*#######################################################*/
                //  datalogging
                /*#######################################################*/
                Rectangle {
                    id: datalogging
                    width: 200
                    height: 200
                    visible: true
                    color: "#ffffff"

                    Image {
                        id: newTestBackround7
                        anchors.top: parent.top
                        anchors.left: parent.left
                        source: "../images/NewTestBackround.png"
                        fillMode: Image.PreserveAspectFit
                    }
                }


                /*#######################################################*/
                //  exit menu
                /*#######################################################*/
                Rectangle {
                    id: exitConfirmation
                    width: 200
                    height: 200
                    visible: true
                    color: "#ffffff"

                    Image {
                        id: newTestBackround
                        anchors.top: parent.top
                        anchors.left: parent.left
                        source: "../images/NewTestBackround.png"
                        fillMode: Image.PreserveAspectFit
                    }

                    Text {
                        id: exitWarning
                        text: "WARNING"
                        font.pixelSize: 80
                        font.bold: true
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.top: parent.top
                        anchors.topMargin: 200

                        Text {
                            id: exitExplanation
                            text: "After exiting, the display software must be manually restarted. Gauges,
    warnings, and other data will not be visible."
                            font.pixelSize: 30
                            horizontalAlignment: Text.AlignHCenter
                            font.bold: true

                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.top: parent.bottom

                            Text {
                                id: exitExplanation1
                                text: "We do NOT reccomend exiting the display software."
                                font.pixelSize: 30
                                horizontalAlignment: Text.AlignHCenter
                                font.bold: true
                                anchors.horizontalCenter: parent.horizontalCenter
                                anchors.top: parent.bottom
                                anchors.topMargin: 30
                            }
                        }
                    }

                    ExitGoBack {
                        id: exitGoBack
                        x: 500
                        y: 491
                        hoverEnabled: false

                        Connections {
                            target: exitGoBack
                            onClicked: stackLayout1.currentIndex = 0
                        }
                    }

                    ExitProceed {
                        id: exitProceed
                        x: 660
                        y: 698
                        hoverEnabled: false

                        Connections {
                            target: exitProceed
                            onClicked: stackLayout1.currentIndex = 6
                        }
                    }


                }

                Rectangle {
                    id: exitConfirmation2
                    width: 200
                    height: 200
                    visible: true
                    color: "#ffffff"

                    Image {
                        id: newTestBackround1
                        anchors.top: parent.top
                        anchors.left: parent.left
                        source: "../images/NewTestBackround.png"
                        fillMode: Image.PreserveAspectFit
                    }

                    Text {
                        id: exitWarning1
                        text: "NOTICE"
                        font.pixelSize: 80
                        font.bold: true
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.top: parent.top
                        anchors.topMargin: 200

                        Text {
                            id: exitExplanation2
                            text: "It is reccomended to shift to neutral, shut off engine, and
chock wheels before exiting display software."
                            font.pixelSize: 30
                            horizontalAlignment: Text.AlignHCenter
                            font.bold: true

                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.top: parent.bottom

                            Text {
                                id: exitExplanation3
                                text: "By clicking 'Proceed', you understand that gauges, warnings, and other
data will not be visible until display software is restarted."
                                font.pixelSize: 30
                                horizontalAlignment: Text.AlignHCenter
                                font.bold: true
                                anchors.horizontalCenter: parent.horizontalCenter
                                anchors.top: parent.bottom
                                anchors.topMargin: 30
                            }
                        }
                    }

                    Row {
                        id: exitRow
                        anchors.horizontalCenter: parent.horizontalCenter

                        y: 607

                        spacing: 100

                        ExitGoBackLessScary {
                            id: exitGoBack1

                            hoverEnabled: false

                            Connections {
                                target: exitGoBack1
                                onClicked: stackLayout1.currentIndex = 0
                            }
                        }

                        ExitProceed {
                            id: exitProceed1

                            hoverEnabled: false

                            Connections {
                                target: exitProceed1
                                onClicked: backend.exitScreen(1)
                            }
                        }


                    }
                }
            }
        }

        Image {
            id: offRoadPage
            width: 100
            height: 100
            horizontalAlignment: Image.AlignHCenter
            verticalAlignment: Image.AlignBottom
            source: "../images/NewTestBackround.png"
            sourceSize.width: 1920
            fillMode: Image.TileHorizontally
            Layout.rightMargin: 0
            Layout.leftMargin: 200
            Layout.fillWidth: false
            Layout.fillHeight: true
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

            PitchGugage {
                id: pitchGugage
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 210
                pitchRotation: 10
            }

            RollGuage {
                id: rollGuage
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 210
                pitchRotation: 5
            }

            Compas {
                id: compas
                anchors.verticalCenter: parent.verticalCenter
                anchors.verticalCenterOffset: -220
                compneedleRotation: 310
                anchors.horizontalCenter: parent.horizontalCenter
            }

            SligGuage {
                id: sligGuage
                anchors.verticalCenter: parent.verticalCenter
                anchors.verticalCenterOffset: 250
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }


    }



    Rectangle {
        id: rectangle
        width: 1526
        height: 100
        color: "#387bd7"
        border.width: 3
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.horizontalCenter: parent.horizontalCenter

        Text {
            id: temperature
            width: 156
            height: 100
            color: "#ffffff"
            text: "?? °F"
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: -8
            anchors.left: parent.left
            anchors.leftMargin: 15
            font.pixelSize: 32
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            font.weight: Font.DemiBold

            Component.onCompleted: {
            backend.updateIntakeTemp.connect((intakeTempValue) => {
                temperature.text = intakeTempValue;
                });
            }

            Text {
                id: temperatureLabel
                width: 156
                height: 20
                color: "#ffffff"
                text: "Intake Temperature"
                font.pixelSize: 15
                horizontalAlignment: Text.AlignLeft
                font.weight: Font.DemiBold

                anchors.bottom: parent.bottom
                anchors.bottomMargin: 15

                anchors.left: parent.left
            }
        }

        DriveMode {
            id: driveMode
            anchors.right: rectangle.left
            anchors.rightMargin: -3
            anchors.bottom: rectangle2.top

            Component.onCompleted: {
                backend.updateDrivemode.connect((updateDrivemodeValue) => {
                    drivemodeTimelineCurrentFrame = (updateDrivemodeValue);  // Update gauge
                });
            }
        }

        Rectangle {
            id: rectangleTime
            x: 1523
            width: 200
            height: 100
            color: "#387bd7"
            border.width: 3
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.horizontalCenterOffset: 821
            //anchors.horizontalCenter: parent.horizontalCenter

            Text {
                id: clock
                x: 1720
                y: 9
                width: 200
                height: 66
                color: "#ffffff"
                text: "??:??"//"- - : - -"
                anchors.right: parent.right
                anchors.rightMargin: 0
                font.pixelSize: 50
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.horizontalCenterOffset: 0
                anchors.verticalCenterOffset: 0
                font.weight: Font.DemiBold
                anchors.horizontalCenter: parent.horizontalCenter

                Component.onCompleted: {
                backend.updateTime.connect((timeValue) => {
                    clock.text = timeValue;
                    });
                }

                Text {
                    id: dateReadout
                    y: 48
                    width: 200
                    height: 38
                    color: "#ffffff"
                    text: "XX/XX/20XX"
                    anchors.left: parent.left
                    anchors.leftMargin: 0

                    font.pixelSize: 15
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter

                    font.weight: Font.DemiBold

                    Component.onCompleted: {
                    backend.updateDate.connect((dateValue) => {
                        dateReadout.text = dateValue;
                        });
                    }
                }
            }
        }


    }

    Image {
        id: jtc_svg
        width: 140
        height: 84
        source: "../images/jtc_svg.svg"
        x: 800
        y: 8
        fillMode: Image.PreserveAspectFit
    }


    Rectangle {
        id: rectangle1
        x: 1695
        y: 477
        width: 200
        height: 983
        color: "#8fb4ff"
        border.width: 3
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.rightMargin: 0
        anchors.bottomMargin: 0

        Column {
            id: column
            anchors.fill: parent
            spacing: 10
            padding: 10
            leftPadding: 10
            topPadding: 10

            LightButton {
                id: lightButton
                hoverEnabled: false

                Connections {
                    target: lightButton
                    onClicked: screens.currentIndex = 1
                }

                Connections {
                    target: lightButton
                    onClicked: rectangle2.visible = true
                }

                Connections {
                    target: lightButton
                    onClicked: jtc_svg.x = 900
                }
            }

            EnginePageButton {
                id: enginePageButton
                hoverEnabled: false

                Connections {
                    target: enginePageButton
                    onClicked: screens.currentIndex = 2
                }

                Connections {
                    target: enginePageButton
                    onClicked: rectangle2.visible = true
                }

                Connections {
                    target: enginePageButton
                    onClicked: jtc_svg.x= 900
                }
            }



            DrivetrainButton {
                id: drivetrainButton
                hoverEnabled: false

                Connections {
                    target:  drivetrainButton
                    onClicked: screens.currentIndex = 3
                }

                Connections {
                    target: drivetrainButton
                    onClicked: rectangle2.visible = true
                }

                Connections {
                    target: drivetrainButton
                    onClicked: jtc_svg.x= 900
                }
            }


            SettingsButton {
                id: settingsButton
                hoverEnabled: false

                Connections {
                    target:  settingsButton
                    onClicked: screens.currentIndex = 4
                }

                Connections {
                    target: settingsButton
                    onClicked: rectangle2.visible = true
                }

                Connections {
                    target: settingsButton
                    onClicked: regularPolygonItem.anchors.rightMargin = 0
                }

                Connections {
                    target: settingsButton
                    onClicked: jtc_svg.x= 900
                }

                Connections {
                    target: settingsButton
                    onClicked: stackLayout1.currentIndex = 0
                }
            }
            HomeButton {
                id: homeButton
                hoverEnabled: false

                Connections {
                    target:  homeButton
                    onClicked: screens.currentIndex = 0
                }

                Connections {
                    target: homeButton
                    onClicked: rectangle2.visible = false
                }

                Connections {
                    target: homeButton
                    onClicked: regularPolygonItem.anchors.rightMargin = 200
                }

                Connections {
                    target: homeButton
                    onClicked: jtc_svg.x = 800
                }
            }
        }
    }

    

    Rectangle {
        id: rectangle2
        y: 97
        width: 200
        height: 983
        visible: false
        color: "#8fb4ff"
        border.width: 3
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        anchors.leftMargin: 0
        anchors.bottomMargin: 0

        Column {
            id: column1
            visible: true
            anchors.fill: parent
            padding: 10
            rightPadding: 10
            bottomPadding: 10
            leftPadding: 10
            topPadding: 10
            spacing: 10

            Rectangle {
                id: rectangle3
                width: 180
                height: 152
                color: "#387bd7"
                radius: 15
                border.color: "#000000"
                border.width: 4

                Text {
                    id: text4
                    color: "#ffffff"
                    text: "??"
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 60
                    anchors.verticalCenterOffset: -25
                    font.weight: Font.DemiBold
                    anchors.horizontalCenter: parent.horizontalCenter

                    Component.onCompleted: {
                    backend.updateRPM.connect((value) => {
                        //console.log("Received RPM:", value);
                        text4.text = value;  // Update gauge
                        });
                    }
                }

                Image {
                    id: image1
                    width: 50
                    height: 50
                    opacity: 0.8
                    anchors.verticalCenter: parent.verticalCenter
                    source: "../images/EngineSpeed.png"
                    anchors.verticalCenterOffset: 40
                    anchors.horizontalCenter: parent.horizontalCenter
                    fillMode: Image.PreserveAspectFit
                }
            }

            Rectangle {
                id: rectangle4
                width: 180
                height: 152
                visible: true
                color: "#387bd7"
                radius: 15
                border.color: "#000000"
                border.width: 4
                Text {
                    id: text5
                    color: "#ffffff"
                    text: "??"
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 60
                    font.weight: Font.DemiBold
                    anchors.verticalCenterOffset: -25
                    anchors.horizontalCenter: parent.horizontalCenter

                    Component.onCompleted: {
                    backend.updateSpeedo.connect((speedValue) => {
                        //console.log("Received speed:", speedValue);
                        text5.text = speedValue/10;  // Update gauge
                        });
                    }
                }

                Image {
                    id: image2
                    width: 70
                    height: 70
                    opacity: 0.8
                    anchors.verticalCenter: parent.verticalCenter
                    source: "../images/TractorSpeed.png"
                    anchors.horizontalCenterOffset: -10
                    fillMode: Image.PreserveAspectFit
                    anchors.verticalCenterOffset: 38
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }

            Rectangle {
                id: rectangle5
                width: 180
                height: 152
                color: "#387bd7"
                radius: 15
                border.color: "#000000"
                border.width: 4
                Text {
                    id: text6
                    color: "#ffffff"
                    text: "??"
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 60
                    font.weight: Font.DemiBold
                    anchors.verticalCenterOffset: -25
                    anchors.horizontalCenter: parent.horizontalCenter

                    Component.onCompleted: {
                        backend.updateBattVolts.connect((updateBattVoltsValue) => {
                            text6.text = updateBattVoltsValue/10;  // Update gauge
                        });
                    }
                }

                Image {
                    id: image3
                    width: 60
                    height: 60
                    opacity: 0.8
                    anchors.verticalCenter: parent.verticalCenter
                    source: "../images/batterylight.png"
                    fillMode: Image.PreserveAspectFit
                    anchors.verticalCenterOffset: 38
                    anchors.horizontalCenterOffset: 0
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }

            Rectangle {
                id: rectangle6
                width: 180
                height: 152
                color: "#387bd7"
                radius: 15
                border.color: "#000000"
                border.width: 4
                Text {
                    id: text7
                    color: "#ffffff"
                    text: qsTr("??")
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 60
                    font.weight: Font.DemiBold
                    anchors.verticalCenterOffset: -25
                    anchors.horizontalCenter: parent.horizontalCenter

                    Component.onCompleted: {
                    backend.updateFuelLevel.connect((fuelLevelValue) => {
                        //console.log("Received Eng Temp:", fuelLevelValue);
                        text7.text = fuelLevelValue;  // Update gauge
                        });
                    }
                }

                Image {
                    id: image4
                    width: 65
                    height: 65
                    opacity: 0.8
                    anchors.verticalCenter: parent.verticalCenter
                    source: "../images/FuelIcon.png"
                    fillMode: Image.PreserveAspectFit
                    anchors.verticalCenterOffset: 40
                    anchors.horizontalCenterOffset: 0
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }

            Rectangle {
                id: rectangle7
                width: 180
                height: 152
                color: "#387bd7"
                radius: 15
                border.color: "#000000"
                border.width: 4
                Text {
                    id: text8
                    color: "#ffffff"
                    text: qsTr("??")
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 60
                    font.weight: Font.DemiBold
                    anchors.verticalCenterOffset: -25
                    anchors.horizontalCenter: parent.horizontalCenter

                    Component.onCompleted: {
                    backend.updateEngTemp.connect((engTempValue) => {
                        //console.log("Received Eng Temp:", engTempValue);
                        text8.text = engTempValue;  // Update gauge
                        });
                    }
                }

                Image {
                    id: image5
                    width: 65
                    height: 65
                    opacity: 0.8
                    anchors.verticalCenter: parent.verticalCenter
                    source: "../images/engineTemp.png"
                    fillMode: Image.PreserveAspectFit
                    anchors.verticalCenterOffset: 35
                    anchors.horizontalCenterOffset: 0
                    anchors.horizontalCenter: parent.horizontalCenter
                }


            }

            Rectangle {
                id: rectangle8
                width: 180
                height: 152
                color: "#387bd7"
                radius: 15
                border.color: "#000000"
                border.width: 4
                Text {
                    id: text9
                    color: "#ffffff"
                    text: qsTr("??")
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 60
                    font.weight: Font.DemiBold
                    anchors.verticalCenterOffset: -25
                    anchors.horizontalCenter: parent.horizontalCenter

                    Component.onCompleted: {
                    backend.updateHydTemp.connect((hydTempValue) => {
                        //console.log("Received Hydraulic temp:", hydTempValue);
                        text9.text = hydTempValue;  // Update gauge
                        });
                    }
                }

                Image {
                    id: image6
                    width: 65
                    height: 65
                    opacity: 0.8
                    anchors.verticalCenter: parent.verticalCenter
                    source: "../images/hydTemp.png"
                    fillMode: Image.PreserveAspectFit
                    anchors.verticalCenterOffset: 35
                    anchors.horizontalCenterOffset: 0
                    anchors.horizontalCenter: parent.horizontalCenter
                }


            }
        }
    }

    Connections {
        target: backend
/*
        function updateGearSelector(gear) {
            gearIndicator.currentGearTimelineCurrentFrame = gear
            geartrg.text = GEARTRG
            console.log("Received gear:", gear);
        }*/


      /*#######################################################
        evil cryptic garbage from last year. should be removed.
        kept for reference, just in case...
        #######################################################

        ###
        from sam: function names and input variables match
        canbus id's. use 2023-2024 reference if needed.
        ###

        function onUpdateAPOSFB(APOSFB) {
            
        }

        function onUpdateACUFB(ACUFB) {
            acufb.text = ACUFB
        }

        function onUpdateTemperature(Temperature) {
            temperature.text = "68 F"
        }

        function onUpdateTime(Time) {
            clock.text = Time
        }

        function onUpdateASTATUS(ASTATUS) {
            astatus.text = ASTATUS
        }

        function onUpdateAERROR(AERROR) {
            aerror.text = AERROR
        }

        function onUpdateASPEEDFB(ASPEEDFB) {
            
        }

        function onUpdateTKPRES(TKPRES) {
            tkpres.text = TKPRES
            tankAirPressure.text = TKPRES
        }

        function onUpdateSHPRES(SHPRES) {
            shpres.text = SHPRES
            shockAirPressure.text = SHPRES
        }

        function onUpdateSTPRES(STPRES) {
            stpres.text = STPRES
        }

        function onUpdateTIPRES(TIPRES) {
            tipres.text = TIPRES
            tireAirPressure.text = 10
        }

        function onUpdateFSHOCK(FSHOCK) {
            
        }

        function onUpdateOPRESENT(OPRESENT) {
            
        }

        function onUpdateTKPRESV(TKPRESV) {
            tkpresv.text = TKPRESV
        }

        function onUpdateSHPRESV(SHPRESV) {
            shpresv.text = SHPRESV
            text144.text = SHPRESV
        }

        function onUpdateSTPRESV(STPRESV) {
            stpresv.text = STPRESV
        }

        function onUpdateTIPRESV(TIPRESV) {
            tipresv.text = TIPRESV
        }

        function onUpdateAPOS(APOS) {
            
        }

        function onUpdateACUR(ACUR) {
            
        }

        function onUpdateASPEED(ASPEED) {
            aspeed.text = ASPEED
        }

        function onUpdateASOFTSA(ASOFTSA) {
           
        }

        function onUpdateASOFTST(ASOFTST) {
           
        }

        function onUpdateARESV1(ARESV1) {
            
        }

        function onUpdateARESV2(ARESV2) {
           
        }

        function onUpdateGEARACT(GEARACT) {
             gearact.text = GEARACT
        }

        function onUpdateGEARTRG(GEARTRG) {
            gearIndicator.currentGearTimelineCurrentFrame = GEARTRG
            geartrg.text = GEARTRG
        }

        function onUpdateTRRS(TRRS) {
            trrs.text = TRRS
        }

        function onUpdateTRRSV(TRRSV) {
            trrsv.text = TRRSV
        }

        function onUpdateTRRLMS(TRRLMS) {
            trrlms.text = TRRLMS
        }

        function onUpdateTRLS(TRLS) {
            trls.text = TRLS
        }

        function onUpdateTRLSV(TRLSV) {
            trlsv.text = TRLSV
        }

        function onUpdateTRLLMS(TRLLMS) {
            trllms.text = TRLLMS
        }

        function onUpdateCLUPEDPOS(CLUPEDPOS) {
            clupedpos.text = CLUPEDPOS
        }

        function onUpdateCLUPEDPOSV(CLUPEDPOSV) {
            clupedposv.text = CLUPEDPOSV
        }

        function onUpdateCLUPEDLMS(CLUPEDLMS) {
            
        }

        function onUpdateCLMS1(CLMS1) {
            clms1.text = CLMS1
        }

        function onUpdateCLMS2(CLMS2) {
            clms2.text = CLMS2
        }

        function onUpdateTERROR1(TERROR1) {
            terror1.text = TERROR1
        }

        function onUpdateTERROR2(TERROR2) {
            terror2.text = TERROR2
        }

        function onUpdateTERROR3(TERROR3) {
            terror3.text = TERROR3
        }

        function onUpdateTERROR4(TERROR4) {
            terror4.text = TERROR4
        }

        function onUpdateTERROR5(TERROR5) {
            terror5.text = TERROR5
        }

        function onUpdateTERROR6(TERROR6) {
            
        }

        function onUpdateTERROR7(TERROR7) {
            
        }

        function onUpdateTERROR8(TERROR8) {
            
        }

        function onUpdateTRSPEED(TRSPEED) {
            trspeed.text = TRSPEED
            speedGuage.speedTimelineCurrentFrame = TRSPEED
        }

        function onUpdateTRSPEEDV(TRSPEEDV) {
            trspeedv.text = TRSPEEDV
        }

        function onUpdateAARMPOSV(AARMPOSV) {
            
        }

        function onUpdateGFLOWV(GFLOWV) {
            
        }

        function onUpdateFUELV(FUELV) {
            fuelv.text = FUELV
        }

        function onUpdateGOVPOSV(GOVPOSV) {
            
        }

        function onUpdateOPRESV(OPRESV) {
            opresv.text = OPRESV
        }

        function onUpdateOPRES(OPRES) {
            opres.text = 0
        }

        function onUpdateRPMV(RPMV) {
            rpmv.text = RPMV
        }

        function onUpdateTLMS(TLMS) {
            tlms.text = TLMS
        }

        function onUpdateEXTEMP(EXTEMP) {
            extemp.text = EXTEMP
        }

        function onUpdateGFLOW(GFLOW) {
            
        }

        function onUpdateFUEL(FUEL) {
            fuel.text = FUEL
            fuelGuages.fuelGuageCurrentFrame = FUEL
        }

        function onUpdateAARMPOS(AARMPOS) {
            
        }

        function onUpdateELOAD(ELOAD) {
            
        }

        function onUpdateRPM(RPM) {
            rpm.text = RPM
            rPMGuage.rpmtimelineCurrentFrame = 0
        }

        function onUpdateTHRPOS(THRPOS) {
            thrpos.text = THRPOS
        }
        
        function onUpdateInfoIcon(infoIconState) {
            infoIcon.state = infoIconState
            stopIcon.state = infoIconState
        }
        
        function onUpdateFrequency(frequency) {
            radioFrequency.text = frequency
        }
        
        function updateCoolSeatState(state){
            coolSeatIcon.state = state
        }

    */}














}
