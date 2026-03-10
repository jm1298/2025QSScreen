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

Window {
    id: window
    width: 1920
    height: 1080
    visible: true
    title: qsTr("Hello World")
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
        currentIndex: 4


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

            LightModeSwitch {
                id: lightModeSwitch
                x: 1403
                y: 39
                focusPolicy: Qt.StrongFocus
                hoverEnabled: false
                checked: false
            }

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

                currentIndex: 2
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
                        }

                        StopwatchButton {
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
                        }

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



                    StackLayout {
                        id: sensorsStack
                        anchors.horizontalCenter: parent.horizontalCenter
                        width: parent.width
                        height: parent.height
                        currentIndex: 1
                        //0 for menu
                        //1 for front ecm
                        //2 for engine
                        //3 for joystick
                        //4 for console ecm
                        //5 for steering ecm
                        //6 for mid ecm
                        //7 for pump ecm

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
                                }

                                GenaricButtonGrey {
                                    id: genaricButtonGrey1
                                    buttonText: "Engine"
                                }

                                GenaricButtonGrey {
                                    id: genaricButtonGrey2
                                    buttonText: "Joystick"
                                }

                                GenaricButtonGrey {
                                    id: genaricButtonGrey3
                                    buttonText: "Console ECM"
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

                                }

                                GenaricButtonGrey {
                                    id: genaricButtonGrey5
                                    buttonText: "Mid ECM"
                                }

                                GenaricButtonGrey {
                                    id: genaricButtonGrey6
                                    buttonText: "Pump ECM"
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

                        //front ECM
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
        x: 900
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
        visible: true
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
                    text: rPMGuage.rpmtimelineCurrentFrame
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 60
                    anchors.verticalCenterOffset: -25
                    font.weight: Font.DemiBold
                    anchors.horizontalCenter: parent.horizontalCenter
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
                    text: speedGuage.speedTimelineCurrentFrame
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 60
                    font.weight: Font.DemiBold
                    anchors.verticalCenterOffset: -25
                    anchors.horizontalCenter: parent.horizontalCenter
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
                    text: gearIndicator.currentGearTimelineCurrentFrame-1
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 60
                    font.weight: Font.DemiBold
                    anchors.verticalCenterOffset: -25
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Image {
                    id: image3
                    width: 60
                    height: 60
                    opacity: 0.8
                    anchors.verticalCenter: parent.verticalCenter
                    source: "../images/GearIcon.png"
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
                    text: qsTr("100")
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 60
                    font.weight: Font.DemiBold
                    anchors.verticalCenterOffset: -25
                    anchors.horizontalCenter: parent.horizontalCenter
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
                    text: qsTr("150")
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 60
                    font.weight: Font.DemiBold
                    anchors.verticalCenterOffset: -25
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Image {
                    id: image5
                    width: 90
                    height: 90
                    opacity: 0.8
                    anchors.verticalCenter: parent.verticalCenter
                    source: "../images/Air Pressure.png"
                    fillMode: Image.PreserveAspectFit
                    anchors.verticalCenterOffset: 30
                    anchors.horizontalCenterOffset: 0
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Text {
                    id: text11
                    x: 66
                    y: 295
                    opacity: 1
                    color: "#1e2c45"
                    text: qsTr("PSI")
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 3
                    font.pixelSize: 20
                    font.weight: Font.DemiBold
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
                    text: qsTr("20")
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 60
                    font.weight: Font.DemiBold
                    anchors.verticalCenterOffset: -25
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Image {
                    id: image6
                    width: 70
                    height: 70
                    opacity: 0.8
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: text9.left
                    anchors.rightMargin: -68
                    source: "../images/EngineOil.png"
                    anchors.horizontalCenter: parent.horizontalCenter
                    fillMode: Image.PreserveAspectFit
                    anchors.verticalCenterOffset: 30
                }

                Text {
                    id: text10
                    y: 122
                    opacity: 1
                    color: "#1e2c45"
                    text: qsTr("PSI")
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 5
                    font.pixelSize: 20
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.weight: Font.DemiBold
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

    DataView {
        id: dataView
        x: 804
        y: 1351
    }

    DataView {
        id: dataView1
        x: 983
        y: 1309
    }

    DataView {
        id: dataView2
        x: 926
        y: 1298
    }














}
