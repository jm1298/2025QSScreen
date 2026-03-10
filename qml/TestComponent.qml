import "Buttons"
import "Icons"
import "controls"
import QtQuick
import QtQuick.Layouts 6.5

StackLayout {
    id: screens
    width: 1720
    height: 980
    currentIndex: 3
    
    
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
            
            //speedTimeline.currentFrame
            Component.onCompleted: {
                backend.updateSpeedo.connect((speedValue) => {
                                                 //console.log("Received Speed:", speedValue);
                                                 speedTimelineCurrentFrame = speedValue;  // Update gauge
                                             });
            }
            
        }
        
        GearIndicator {
            id: gearIndicator
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenterOffset: 0
            currentGearTimelineCurrentFrame: 0
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
        
        /*Airguages {
                id: airguages
                x: 1246
                y: 56
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                anchors.rightMargin: 50
                anchors.bottomMargin: 520
            }
            
            FuelGuages {
                id: fuelGuages
                y: 56
                anchors.left: parent.left
                anchors.bottom: parent.bottom
                anchors.leftMargin: 50
                anchors.bottomMargin: 520
                fuelGuageCurrentFrame: 50
                
            }*/
        
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
                state: "On"
                
                Component.onCompleted: {
                    backend.updateInfoIcon.connect((infoIconValue) => {
                                                       infoIcon.state = infoIconValue;
                                                   });
                }
            }
            
            WarningIcon {
                id: warningIcon
                width: 80
                height: 80
                state: "On"
                enabled: false
                
                Component.onCompleted: {
                    backend.updateWarnLight.connect((warnLightValue) => {
                                                        warningIcon.state = warnLightValue;
                                                    });
                }
            }
            
            StopIcon {      //old name was StopIcon. Is now the battey light
                id: batteryIcon
                width: 80
                height: 80
                focusPolicy: Qt.NoFocus
                state: "On"
                enabled: false
                
                Component.onCompleted: {
                    backend.updateBattLight.connect((battLightValue) => {
                                                        batteryIcon.state = battLightValue;
                                                    });
                }
            }
            
            /*HeatSeatIcon {
                    id: heatSeatIcon
                    width: 80
                    height: 80
                    focusPolicy: Qt.NoFocus
                    state: ""
                    
                    Connections {
                        target: heatSeatIcon
                        onClicked:backend.coolSeatButtonPressed(1)
                    }
                }*/
            
            OilIcon {
                id: oilIcon
                width: 80
                height: 80
                focusPolicy: Qt.NoFocus
                state: "On"
                enabled: false
                
                Component.onCompleted: {
                    backend.updateOilPress.connect((oilPressValue) => {
                                                       oilIcon.state = oilPressValue;
                                                   });
                }
            }
            
            
            
            /*CoolSeatIcon {
                    id: coolSeatIcon
                    width: 80
                    height: 80
                    focusPolicy: Qt.NoFocus
                    state: "On"
                }*/
            
            CELicon {
                id: cELicon
                width: 80
                height: 80
                focusPolicy: Qt.NoFocus
                state: "On"
                enabled: false
                
                Component.onCompleted: {
                    backend.updateCEL.connect((celValue) => {
                                                  cELicon.state = celValue;
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
            state: "Off"
            
            Component.onCompleted: {
                backend.updateTurnRight.connect((turnRightValue) => {
                                                    turnSignalIcon.state = turnRightValue;
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
            state: "Off"
            
            Component.onCompleted: {
                backend.updateTurnLeft.connect((turnLeftValue) => {
                                                   turnSignalIcon1.state = turnLeftValue;
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
                backend.updateHydPSI.connect((hydPSIValue) => {
                                                 //console.log("Received Hydraulic PSI:", hydPSIValue);
                                                 hydraulicPSICurrentFrame = hydPSIValue;  // Update gauge
                                             });
            }
        }
        
        HydTemp {
            id: hydTemp
            x: 1390
            y: 700
            
            Component.onCompleted: {
                backend.updateHydTemp.connect((hydTempValue) => {
                                                  //console.log("Received Hydraulic Temp:", hydTempValue);
                                                  hydTempCurrentFrame = hydTempValue;  // Update gauge
                                              });
            }
        }
        
        
        
        
        
        
    }
    /*#################### Lightpage ####################*/
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
            width: 1300
            height: 700
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: 50
            anchors.horizontalCenterOffset: 0
            currentIndex: lightModeSwitch.mode
            anchors.horizontalCenter: parent.horizontalCenter
            
            Image {
                id: image11
                width: 100
                height: 100
                source: "../images/TractorSideV1.png"
                fillMode: Image.PreserveAspectFit
                
                RearWorkLightButton {
                    id: rearWorkLightButton
                    x: 1039
                    y: 356
                    memorystate: false
                    
                    Connections {
                        target: rearWorkLightButton
                        onClicked:backend.rearWorkLightButtonPressed(rearWorkLightButton.memorystate)
                    }
                }
                
                FrontHeadlightButton {
                    id: frontHeadlightButton
                    x: 661
                    y: 325
                    memorystate: false
                    
                    Connections {
                        target: frontHeadLightButton
                        onClicked:backend.frontHeadLightButtonPressed(frontHeadlightButton.memorystate)
                    }
                }
                
                FrontWorkLights {
                    id: frontWorkLights
                    x: 210
                    y: 359
                    memorystate: false
                    
                    Connections {
                        target: fronWorkLightButton
                        onClicked:backend.frontWorkLightButtonPressed(frontWorkLights.memorystate)
                    }
                }
                
                UnderGlowButton {
                    id: underGlowButton
                    x: 645
                    y: 572
                    memorystate: false
                    
                    Connections {
                        target: underGlowButton
                        onClicked:backend.underGlowButtonPressed(underGlowButton.memorystate)
                    }
                }
                
                RunningLightButton {
                    id: runningLightButton
                    x: 661
                    y: 413
                    memorystate: false
                    
                    Connections {
                        target:runningLightButton
                        onClicked:backend.runningLightButtonPressed(runningLightButton.memorystate)
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
    
    
    /*#################### enginepage ####################*/
    Image {
        id: musicpage
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
        /*
            RadioModeSwitch {
                id: radioModeSwitch
                anchors.top: parent.top
                anchors.topMargin: 100
                anchors.horizontalCenter: parent.horizontalCenter
                
                Connections {
                    target: radioModeSwitch
                    onClicked:backend.radioModeSwitchPressed(1)
                }
            }
            
            Rectangle {
                id: rectangle9
                width: 800
                height: 300
                opacity: 1
                visible: true
                color: "#8fb4ff"
                radius: 25
                border.width: 3
                anchors.verticalCenter: parent.verticalCenter
                anchors.verticalCenterOffset: -100
                anchors.horizontalCenter: parent.horizontalCenter
                
                TextInput {
                    id: radioFrequency
                    color: "#353535"
                    text: "103.3"
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 200
                    horizontalAlignment: Text.AlignHCenter
                    font.weight: Font.DemiBold
                    anchors.horizontalCenter: parent.horizontalCenter
                }
                
            }
            
            SoundSlider {
                id: soundSlider
                y: 787
                value: 40
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 200
                property int preMutevalue: 10
                live: true
                anchors.horizontalCenter: parent.horizontalCenter
                
                VolumeUp {
                    id: volumeUp
                    x: 652
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right
                    anchors.rightMargin: -130
                    autoRepeatInterval: 25
                    autoRepeatDelay: 200
                    autoRepeat: true
                    
                    Connections {
                        target: volumeUp
                        onPressed: soundSlider.increase()
                        onClicked:backend.volumeUpButtonPressed(radioFrequency.text)
                    }
                }
                
                VolumeDown {
                    id: volumeDown
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: -130
                    autoRepeatInterval: 50
                    autoRepeatDelay: 200
                    autoRepeat: true
                    
                    Connections {
                        target: volumeDown
                        onPressed: soundSlider.decrease()
                        onClicked:backend.volumeDownButtonPressed(1)
                    }
                }
            }
            
            Rectangle {
                id: rectangle10
                y: 880
                width: 1526
                height: 100
                color: "#48494949"
                border.color: "#00000000"
                border.width: 3
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 0
                anchors.horizontalCenter: parent.horizontalCenter
                
                Row {
                    id: row2
                    x: 3
                    anchors.fill: parent
                    
                    RadioFavoriteButton {
                        id: radioFavoriteButton
                        text: "106.9"
                        
                        Connections {
                            target: radioFavoriteButton
                            onPressAndHold: radioFavoriteButton.text = radioFrequency.text
                        }
                        
                        Connections {
                            target: radioFavoriteButton
                            onClicked: radioFrequency.text = radioFavoriteButton.text
                        }
                        
                        Connections {
                            target: radioFavoriteButton
                            onClicked:backend.radioFavoriteButtonPressed(radioFavoriteButton.text)
                        }
                    }
                    
                    RadioFavoriteButton {
                        id: radioFavoriteButton1
                        text: "89.9"
                        text2Text: "2"
                        
                        Connections {
                            target: radioFavoriteButton1
                            onPressAndHold: radioFavoriteButton1.text = radioFrequency.text
                        }
                        
                        Connections {
                            target: radioFavoriteButton1
                            onClicked: radioFrequency.text = radioFavoriteButton1.text
                        }
                        
                        Connections {
                            target: radioFavoriteButton1
                            onClicked:backend.radioFavoriteButton1Pressed(radioFavoriteButton1.text)
                        }
                    }
                    
                    RadioFavoriteButton {
                        id: radioFavoriteButton2
                        text: "92.3"
                        text2Text: "3"
                        
                        Connections {
                            target: radioFavoriteButton2
                            onPressAndHold: radioFavoriteButton2.text = radioFrequency.text
                        }
                        
                        Connections {
                            target: radioFavoriteButton2
                            onClicked: radioFrequency.text = radioFavoriteButton2.text
                        }
                        
                        Connections {
                            target: radioFavoriteButton2
                            onClicked:backend.radioFavoriteButton2Pressed(radioFavoriteButton2.text)
                        }
                    }
                    
                    RadioFavoriteButton {
                        id: radioFavoriteButton3
                        text: "93.3"
                        text2Text: "4"
                        
                        Connections {
                            target: radioFavoriteButton3
                            onPressAndHold: radioFavoriteButton3.text = radioFrequency.text
                        }
                        
                        Connections {
                            target: radioFavoriteButton3
                            onClicked: radioFrequency.text = radioFavoriteButton3.text
                        }
                        
                        Connections {
                            target: radioFavoriteButton3
                            onClicked:backend.radioFavoriteButton3Pressed(radioFavoriteButton3.text)
                        }
                    }
                    
                    RadioFavoriteButton {
                        id: radioFavoriteButton4
                        text: "94.3"
                        text2Text: "5"
                        
                        Connections {
                            target: radioFavoriteButton4
                            onPressAndHold: radioFavoriteButton4.text = radioFrequency.text
                        }
                        
                        Connections {
                            target: radioFavoriteButton4
                            onClicked: radioFrequency.text = radioFavoriteButton4.text
                        }
                        
                        Connections {
                            target: radioFavoriteButton4
                            onClicked:backend.radioFavoriteButton4Pressed(radioFavoriteButton4.text)
                        }
                    }
                    
                    RadioFavoriteButton {
                        id: radioFavoriteButton5
                        text: "97.3"
                        text2Text: "6"
                        
                        Connections {
                            target: radioFavoriteButton5
                            onPressAndHold: radioFavoriteButton5.text = radioFrequency.text
                        }
                        
                        Connections {
                            target: radioFavoriteButton5
                            onClicked: radioFrequency.text = radioFavoriteButton5.text
                        }
                        
                        Connections {
                            target: radioFavoriteButton5
                            onClicked:backend.radioFavoriteButton5Pressed(radioFavoriteButton5.text)
                        }
                    }
                }
            }
            
            PlayButton {
                id: playButton
                y: 566
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 310
                anchors.horizontalCenter: parent.horizontalCenter
                
                Connections {
                    target: playButton
                    onClicked:backend.playButtonPressed(1)
                }
            }
            
            SeekButton {
                id: seekForwardButton
                y: 571
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 310
                anchors.horizontalCenterOffset: 250
                anchors.horizontalCenter: parent.horizontalCenter
                
                Connections {
                    target: seekForwardButton
                    onClicked:backend.seekForwardButtonPushed(radioFrequency.text)
                }
            }
            
            SeekButton {
                id: seekBackwardButton
                y: 571
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 310
                rotation: 180
                anchors.horizontalCenterOffset: -250
                anchors.horizontalCenter: parent.horizontalCenter
                
                Connections {
                    target: seekBackwardButton
                    onClicked:backend.seekBackwardButtonPushed(radioFrequency.text)
                }
            }*/
    }
    
    
    /*#################### drivetrain page ####################*/
    Image {
        id: airpage
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
        
        /*
            Row {
                id: row1
                anchors.fill: parent
                spacing: 163
                topPadding: 0
                rightPadding: 0
                leftPadding: 325
                
                AirAdjustSliders {
                    id: airAdjustSliders
                    width: 106
                    height: 475
                    anchors.verticalCenter: parent.verticalCenter
                    text3Text: "200"
                    anchors.verticalCenterOffset: -70
                    
                    IncreaseButton {
                        id: tankAirPressureUpButton
                        anchors.top: parent.top
                        anchors.topMargin: -120
                        anchors.horizontalCenter: parent.horizontalCenter
                        
                        Connections {
                            target: tankAirPressureUpButton
                            onPressed:backend.tankAirPressureUpButtonPressed(1)
                        }
                        
                        Connections {
                            target: tankAirPressureUpButton
                            onReleased:backend.tankAirPressureUpButtonReleased(1)
                        }
                    }
                    
                    DecreaseButton {
                        id: tankAirPressureDownButton
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: -100
                        anchors.horizontalCenter: parent.horizontalCenter
                        
                        Connections {
                            target: tankAirPressureDownButton
                            onPressed:backend.tankAirPressureDownButtonPressed(1)
                        }
                        
                        Connections {
                            target: tankAirPressureDownButton
                            onReleased:backend.tankAirPressureDownButtonReleased(1)
                        }
                    }
                    
                    Image {
                        id: image
                        y: 637
                        width: 120
                        height: 120
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: -200
                        source: "../images/Air Pressure.png"
                        anchors.horizontalCenter: parent.horizontalCenter
                        fillMode: Image.PreserveAspectFit
                    }
                    
                    Text {
                        id: tankAirPressure
                        width: 183
                        height: 110
                        text: qsTr("150")
                        anchors.top: parent.top
                        anchors.topMargin: 615
                        font.pixelSize: 50
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        anchors.horizontalCenterOffset: 0
                        font.weight: Font.DemiBold
                        anchors.horizontalCenter: parent.horizontalCenter
                        
                        Text {
                            id: text140
                            x: 0
                            width: 183
                            height: 110
                            text: qsTr("110")
                            anchors.top: parent.top
                            anchors.topMargin: 55
                            font.pixelSize: 50
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            font.weight: Font.DemiBold
                            Text {
                                id: text141
                                color: "#494949"
                                text: qsTr("PSI")
                                anchors.bottom: parent.bottom
                                anchors.bottomMargin: -5
                                font.pixelSize: 25
                                anchors.horizontalCenter: parent.horizontalCenter
                            }
                            
                            Text {
                                id: text143
                                x: -60
                                y: -65
                                width: 183
                                height: 110
                                text: qsTr("A:")
                                anchors.verticalCenter: parent.verticalCenter
                                font.pixelSize: 30
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                font.weight: Font.DemiBold
                                anchors.horizontalCenterOffset: -60
                                anchors.horizontalCenter: parent.horizontalCenter
                            }
                            anchors.horizontalCenterOffset: 0
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                        
                        Text {
                            id: text142
                            width: 183
                            height: 110
                            text: qsTr("T:")
                            anchors.verticalCenter: parent.verticalCenter
                            font.pixelSize: 30
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            anchors.horizontalCenterOffset: -60
                            anchors.horizontalCenter: parent.horizontalCenter
                            font.weight: Font.DemiBold
                        }
                    }
                }
                
                AirAdjustSliders {
                    id: airAdjustSliders1
                    width: 106
                    height: 475
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.verticalCenterOffset: -70
                    
                    IncreaseButton {
                        id: frontSuspensionUpButton
                        anchors.top: parent.top
                        anchors.topMargin: -120
                        anchors.horizontalCenter: parent.horizontalCenter
                        
                        Connections {
                            target: frontSuspensionUpButton
                            onPressed:backend.frontSuspensionUpButtonPressed(1)
                        }
                        
                        Connections {
                            target: frontSuspensionUpButton
                            onReleased:backend.frontSuspensionUpButtonReleased(1)
                        }
                    }
                    
                    DecreaseButton {
                        id: frontSuspensionDownButton
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: -100
                        anchors.horizontalCenter: parent.horizontalCenter
                        
                        Connections {
                            target: frontSuspensionDownButton
                            onPressed:backend.frontSuspensionDownButtonPressed(1)
                        }
                        
                        Connections {
                            target: frontSuspensionDownButton
                            onReleased:backend.frontSuspensionDownButtonReleased(1)
                        }
                    }
                    
                    Image {
                        id: image7
                        y: 637
                        width: 100
                        height: 100
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: -195
                        source: "../images/FrontSuspensionAdjust.png"
                        fillMode: Image.PreserveAspectFit
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                    
                    Text {
                        id: shockAirPressure
                        x: 175
                        width: 183
                        height: 110
                        text: qsTr("150")
                        anchors.top: parent.top
                        anchors.topMargin: 615
                        font.pixelSize: 50
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.weight: Font.DemiBold
                        Text {
                            id: text144
                            x: 0
                            width: 183
                            height: 110
                            text: qsTr("200")
                            anchors.top: parent.top
                            anchors.topMargin: 55
                            font.pixelSize: 50
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            font.weight: Font.DemiBold
                            Text {
                                id: text145
                                color: "#494949"
                                text: qsTr("PSI")
                                anchors.bottom: parent.bottom
                                anchors.bottomMargin: -5
                                font.pixelSize: 25
                                anchors.horizontalCenter: parent.horizontalCenter
                            }
                            
                            Text {
                                id: text146
                                x: -60
                                y: -65
                                width: 183
                                height: 110
                                text: qsTr("A:")
                                anchors.verticalCenter: parent.verticalCenter
                                font.pixelSize: 30
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                font.weight: Font.DemiBold
                                anchors.horizontalCenterOffset: -60
                                anchors.horizontalCenter: parent.horizontalCenter
                            }
                            anchors.horizontalCenterOffset: 0
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                        
                        Text {
                            id: text147
                            width: 183
                            height: 110
                            text: qsTr("T:")
                            anchors.verticalCenter: parent.verticalCenter
                            font.pixelSize: 30
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            font.weight: Font.DemiBold
                            anchors.horizontalCenterOffset: -60
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                        anchors.horizontalCenterOffset: 0
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }
                
                Rectangle {
                    id: rectangle11
                    width: 180
                    height: 100
                    color: "#8c8c8c"
                    radius: 20
                    border.width: 2
                    anchors.verticalCenter: parent.verticalCenter
                    
                    AirCompSwitch {
                        id: airCompSwitch
                        x: 77
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.right: parent.right
                        anchors.rightMargin: 8
                        
                        Connections {
                            target: airCompSwitch
                            onClicked:backend.airCompSwitchSwitched(airCompSwitch.checked)
                        }
                    }
                    
                    Image {
                        id: image10
                        width: 100
                        height: 100
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        anchors.leftMargin: -8
                        source: "../images/compressor.png"
                        anchors.verticalCenterOffset: -8
                        fillMode: Image.PreserveAspectFit
                    }
                }
                
                AirAdjustSliders {
                    id: airAdjustSliders2
                    width: 106
                    height: 475
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.verticalCenterOffset: -70
                    text3Text: "30"
                    
                    IncreaseButton {
                        id: tirePressureUpButton
                        anchors.top: parent.top
                        anchors.topMargin: -120
                        anchors.horizontalCenter: parent.horizontalCenter
                        
                        Connections {
                            target: tirePressureUpButton
                            onPressed:backend.tirePressureUpButtonPressed(1)
                        }
                        
                        Connections {
                            target: tirePressureUpButton
                            onReleased:backend.tirePressureUpButtonReleased(1)
                        }
                    }
                    
                    DecreaseButton {
                        id: tirePressureDownButton
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: -100
                        anchors.horizontalCenter: parent.horizontalCenter
                        
                        Connections {
                            target: tirePressureDownButton
                            onPressed:backend.tirePressureDownButtonPressed(1)
                        }
                        
                        Connections {
                            target: tirePressureDownButton
                            onReleased:backend.tirePressureDownButtonReleased(1)
                        }
                    }
                    
                    Image {
                        id: image8
                        y: 637
                        width: 65
                        height: 65
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: -170
                        source: "../images/TirePressure.png"
                        fillMode: Image.PreserveAspectFit
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                    
                    Text {
                        id: tireAirPressure
                        x: 175
                        width: 183
                        height: 110
                        text: qsTr("10")
                        anchors.top: parent.top
                        anchors.topMargin: 615
                        font.pixelSize: 50
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.weight: Font.DemiBold
                        Text {
                            id: text148
                            x: 0
                            width: 183
                            height: 110
                            text: qsTr("10")
                            anchors.top: parent.top
                            anchors.topMargin: 55
                            font.pixelSize: 50
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            font.weight: Font.DemiBold
                            Text {
                                id: text149
                                color: "#494949"
                                text: qsTr("PSI")
                                anchors.bottom: parent.bottom
                                anchors.bottomMargin: -5
                                font.pixelSize: 25
                                anchors.horizontalCenter: parent.horizontalCenter
                            }
                            
                            Text {
                                id: text150
                                x: -60
                                y: -65
                                width: 183
                                height: 110
                                text: qsTr("A:")
                                anchors.verticalCenter: parent.verticalCenter
                                font.pixelSize: 30
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                font.weight: Font.DemiBold
                                anchors.horizontalCenterOffset: -60
                                anchors.horizontalCenter: parent.horizontalCenter
                            }
                            anchors.horizontalCenterOffset: 0
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                        
                        Text {
                            id: text151
                            width: 183
                            height: 110
                            text: qsTr("T:")
                            anchors.verticalCenter: parent.verticalCenter
                            font.pixelSize: 30
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            font.weight: Font.DemiBold
                            anchors.horizontalCenterOffset: -60
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                        anchors.horizontalCenterOffset: 0
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }
                
                
                AirAdjustSliders {
                    id: airAdjustSliders3
                    width: 106
                    height: 475
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.verticalCenterOffset: -70
                    text3Text: "100"
                    
                    IncreaseButton {
                        id: seatPressureUpButtom
                        anchors.top: parent.top
                        anchors.topMargin: -120
                        anchors.horizontalCenter: parent.horizontalCenter
                        
                        Connections {
                            target: seatPressureUpButtom
                            onPressed:backend.seatPressureUpButtomPressed(1)
                        }
                        
                        Connections {
                            target: seatPressureUpButtom
                            onReleased:backend.seatPressureUpButtomReleased(1)
                        }
                    }
                    
                    DecreaseButton {
                        id: seatPressureDownButtom
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: -100
                        anchors.horizontalCenter: parent.horizontalCenter
                        
                        Connections {
                            target: seatPressureDownButtom
                            onPressed:backend.seatPressureDownButtomPressed(1)
                        }
                        
                        Connections {
                            target: seatPressureDownButtom
                            onReleased:backend.seatPressureDownButtomReleased(1)
                        }
                    }
                    
                    Image {
                        id: image9
                        y: 637
                        width: 65
                        height: 65
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: -170
                        source: "../images/SeatAdjust.png"
                        fillMode: Image.PreserveAspectFit
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                    
                    Text {
                        id: airTankTargetPressureText
                        x: 175
                        width: 183
                        height: 110
                        
                        text: targetPressure
                        anchors.top: parent.top
                        anchors.topMargin: 615
                        font.pixelSize: 50
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.weight: Font.DemiBold
                        Text {
                            id: seatActualPressureText
                            x: 0
                            width: 183
                            height: 110
                            property string pressure: "10"
                            text: pressure
                            anchors.top: parent.top
                            anchors.topMargin: 55
                            font.pixelSize: 50
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            font.weight: Font.DemiBold
                            Text {
                                id: text153
                                color: "#494949"
                                text: qsTr("PSI")
                                anchors.bottom: parent.bottom
                                anchors.bottomMargin: -5
                                font.pixelSize: 25
                                anchors.horizontalCenter: parent.horizontalCenter
                            }
                            
                            Text {
                                id: text154
                                x: -60
                                y: -65
                                width: 183
                                height: 110
                                text: qsTr("A:")
                                anchors.verticalCenter: parent.verticalCenter
                                font.pixelSize: 30
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                font.weight: Font.DemiBold
                                anchors.horizontalCenterOffset: -60
                                anchors.horizontalCenter: parent.horizontalCenter
                            }
                            anchors.horizontalCenterOffset: 0
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                        
                        Text {
                            id: text155
                            width: 183
                            height: 110
                            text: qsTr("T:")
                            anchors.verticalCenter: parent.verticalCenter
                            font.pixelSize: 30
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            font.weight: Font.DemiBold
                            anchors.horizontalCenterOffset: -60
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                        anchors.horizontalCenterOffset: 0
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }
                
                
            }*/
        
    }
    
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
            x: 740
            y: 489
            anchors.fill: parent
            anchors.leftMargin: 500
            anchors.rightMargin: 200
            currentIndex: 0
            
            Rectangle {
                id: settings
                width: 200
                height: 200
                visible: true
                color: "#ffffff"
                anchors.verticalCenter: maintenance.verticalCenter
                anchors.left: maintenance.right
                anchors.right: maintenance.left
                anchors.top: maintenance.bottom
                anchors.bottom: maintenance.top
                anchors.leftMargin: -200
                anchors.rightMargin: -200
                anchors.topMargin: -200
                anchors.bottomMargin: -200
                anchors.horizontalCenter: maintenance.horizontalCenter
                
                Text {
                    id: text23
                    text: qsTr("Settings")
                    font.pixelSize: 120
                }
            }
            
            Rectangle {
                id: maintenance
                width: 200
                height: 200
                visible: true
                color: "#ffffff"
                
                Image {
                    id: image19
                    x: 0
                    y: 0
                    anchors.fill: parent
                    source: "../images/BackroundService.png"
                    fillMode: Image.TileHorizontally
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
                                onClicked: rectangle13.y = 0
                            }
                            
                            Connections {
                                target: mouseArea13
                                onClicked: stackLayout4.currentIndex = 0
                            }
                            
                            Connections {
                                target: mouseArea13
                                onClicked: stackLayout5.currentIndex = 0
                            }
                            
                            Connections {
                                target: mouseArea13
                                onClicked: rectangle133.y = 0
                            }
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
                            text: qsTr("Differential Oil Change")
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
                
                Rectangle {
                    id: rectangle133
                    y: 980
                    width: 1220
                    height: 980
                    color: "#00ffffff"
                    Image {
                        id: image20
                        anchors.fill: parent
                        source: "../images/BackroundService.png"
                        sourceSize.width: 593
                        sourceSize.height: 935
                        fillMode: Image.TileHorizontally
                    }
                    
                    StackLayout {
                        id: stackLayout6
                        anchors.fill: parent
                        currentIndex: 0
                        Rectangle {
                            id: engineOil
                            width: 1220
                            height: 100
                            visible: true
                            color: "#00ffffff"
                            Image {
                                id: image21
                                x: 0
                                y: 0
                                anchors.fill: parent
                                source: "../images/BackroundService.png"
                                sourceSize.width: 593
                                sourceSize.height: 935
                                fillMode: Image.TileHorizontally
                            }
                            
                            StackLayout {
                                id: stackLayout7
                                anchors.fill: parent
                                Rectangle {
                                    id: rectangle134
                                    width: 200
                                    height: 200
                                    color: "#00ffffff"
                                    Rectangle {
                                        id: rectangle135
                                        x: 0
                                        y: 0
                                        width: 1220
                                        height: 100
                                        color: "#00ffffff"
                                        anchors.top: parent.top
                                        anchors.topMargin: 0
                                        Rectangle {
                                            id: rectangle136
                                            x: 0
                                            y: 95
                                            width: 1220
                                            height: 5
                                            color: "#000000"
                                            anchors.bottom: parent.bottom
                                            anchors.bottomMargin: 0
                                            anchors.horizontalCenter: parent.horizontalCenter
                                        }
                                        
                                        Text {
                                            id: text88
                                            y: -424
                                            text: qsTr("Changing Engine Oil")
                                            anchors.verticalCenter: parent.verticalCenter
                                            anchors.left: parent.left
                                            anchors.leftMargin: 50
                                            font.pixelSize: 50
                                            font.styleName: "Semibold"
                                        }
                                        
                                        CloseButton {
                                            id: closeButton1
                                            x: 1020
                                            anchors.verticalCenter: parent.verticalCenter
                                            anchors.right: parent.right
                                            anchors.rightMargin: 30
                                            Connections {
                                                target: closeButton1
                                                onClicked: rectangle133.y = 980
                                            }
                                        }
                                        anchors.horizontalCenter: parent.horizontalCenter
                                    }
                                    
                                    Rectangle {
                                        id: rectangle137
                                        x: 0
                                        y: 100
                                        width: 1220
                                        height: 60
                                        color: "#00ffffff"
                                        anchors.top: parent.top
                                        anchors.topMargin: 100
                                        Rectangle {
                                            id: rectangle138
                                            x: 0
                                            y: 95
                                            width: 1220
                                            height: 3
                                            color: "#000000"
                                            anchors.bottom: parent.bottom
                                            anchors.bottomMargin: 0
                                            anchors.horizontalCenter: parent.horizontalCenter
                                        }
                                        
                                        Text {
                                            id: text89
                                            y: -424
                                            text: qsTr("Oil Change Details")
                                            anchors.verticalCenter: parent.verticalCenter
                                            font.pixelSize: 30
                                            font.styleName: "Semibold"
                                            anchors.horizontalCenterOffset: -250
                                            anchors.horizontalCenter: parent.horizontalCenter
                                        }
                                        
                                        Text {
                                            id: text90
                                            y: -424
                                            text: qsTr("Supplies")
                                            anchors.verticalCenter: parent.verticalCenter
                                            font.pixelSize: 30
                                            font.styleName: "Semibold"
                                            anchors.horizontalCenterOffset: 350
                                            anchors.horizontalCenter: parent.horizontalCenter
                                        }
                                        anchors.horizontalCenter: parent.horizontalCenter
                                    }
                                    
                                    Rectangle {
                                        id: rectangle139
                                        x: 879
                                        y: 11
                                        width: 3
                                        height: 880
                                        color: "#0b0b0b"
                                        anchors.right: parent.right
                                        anchors.bottom: parent.bottom
                                        anchors.rightMargin: 500
                                        anchors.bottomMargin: 0
                                    }
                                    
                                    TextEdit {
                                        id: textEdit2
                                        width: 700
                                        height: 800
                                        text: "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n<html><head><meta name=\"qrichtext\" content=\"1\" /><meta charset=\"utf-8\" /><style type=\"text/css\">\np, li { white-space: pre-wrap; }\nhr { height: 1px; border-width: 0; }\nli.unchecked::marker { content: \"\\2610\"; }\nli.checked::marker { content: \"\\2612\"; }\n</style></head><body style=\" font-family:'Segoe UI'; font-size:9pt; font-weight:400; font-style:normal;\">\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-size:30pt;\">The recommended oil change interval is every 100 hours.</span></p>\n<p style=\"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; font-size:30pt;\"><br /></p>\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-size:30pt;\">The oil filter should be replaced every time the oil is changed</span></p></body></html>"
                                        anchors.left: parent.left
                                        anchors.top: parent.top
                                        anchors.leftMargin: 20
                                        anchors.topMargin: 160
                                        font.pixelSize: 30
                                        horizontalAlignment: Text.AlignLeft
                                        wrapMode: Text.WordWrap
                                        textFormat: Text.RichText
                                        Rectangle {
                                            id: rectangle140
                                            y: 580
                                            width: 300
                                            height: 100
                                            color: "#8c8c8c"
                                            radius: 15
                                            border.color: "#0b0b0b"
                                            anchors.bottom: parent.bottom
                                            anchors.bottomMargin: 50
                                            Text {
                                                id: text24
                                                text: qsTr("Start Oil Change")
                                                anchors.fill: parent
                                                font.pixelSize: 30
                                                horizontalAlignment: Text.AlignHCenter
                                                verticalAlignment: Text.AlignVCenter
                                                font.weight: Font.DemiBold
                                            }
                                            
                                            MouseArea {
                                                id: mouseArea17
                                                anchors.fill: parent
                                            }
                                            
                                            Connections {
                                                target: mouseArea17
                                                onClicked: stackLayout7.currentIndex = 1
                                            }
                                            anchors.horizontalCenter: parent.horizontalCenter
                                        }
                                    }
                                    
                                    TextEdit {
                                        id: textEdit4
                                        x: 895
                                        width: 480
                                        height: 800
                                        text: "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n<html><head><meta name=\"qrichtext\" content=\"1\" /><meta charset=\"utf-8\" /><style type=\"text/css\">\np, li { white-space: pre-wrap; }\nhr { height: 1px; border-width: 0; }\nli.unchecked::marker { content: \"\\2610\"; }\nli.checked::marker { content: \"\\2612\"; }\n</style></head><body style=\" font-family:'Segoe UI'; font-size:9pt; font-weight:400; font-style:normal;\">\n<p style=\"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:1; text-indent:0px;\"><br /></p>\n<ol style=\"margin-top: 0px; margin-bottom: 0px; margin-left: 0px; margin-right: 0px; -qt-list-indent: 1;\">\n<li style=\" font-size:30pt;\" style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\">2.5 Quarts 10W-30</li>\n<li style=\" font-size:30pt;\" style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\">BS-84292 Oil Filter</li>\n<li style=\" font-size:30pt;\" style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\">Filter Wrech</li>\n<li style=\" font-size:30pt;\" style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\">Drain Pan</li>\n<li style=\" font-size:30pt;\" style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\">Rags</li></ol></body></html>"
                                        anchors.right: parent.right
                                        anchors.top: parent.top
                                        anchors.rightMargin: 0
                                        anchors.topMargin: 160
                                        font.pixelSize: 30
                                        textFormat: Text.RichText
                                    }
                                }
                                
                                Rectangle {
                                    id: rectangle141
                                    width: 200
                                    height: 200
                                    color: "#00ffffff"
                                    Rectangle {
                                        id: rectangle142
                                        x: 0
                                        y: 0
                                        width: 1220
                                        height: 100
                                        color: "#00ffffff"
                                        anchors.top: parent.top
                                        anchors.topMargin: 0
                                        Rectangle {
                                            id: rectangle143
                                            x: 0
                                            y: 95
                                            width: 1220
                                            height: 5
                                            color: "#000000"
                                            anchors.bottom: parent.bottom
                                            anchors.bottomMargin: 0
                                            anchors.horizontalCenter: parent.horizontalCenter
                                        }
                                        
                                        Text {
                                            id: text91
                                            y: -424
                                            text: qsTr("Engine Oil Change (1/3)")
                                            anchors.verticalCenter: parent.verticalCenter
                                            anchors.left: parent.left
                                            anchors.leftMargin: 50
                                            font.pixelSize: 50
                                            font.styleName: "Semibold"
                                        }
                                        
                                        CloseButton {
                                            id: closeButton2
                                            x: 1020
                                            anchors.verticalCenter: parent.verticalCenter
                                            anchors.right: parent.right
                                            anchors.rightMargin: 30
                                            Connections {
                                                target: closeButton2
                                                onClicked: rectangle133.y = 980
                                            }
                                        }
                                        anchors.horizontalCenter: parent.horizontalCenter
                                    }
                                    
                                    Rectangle {
                                        id: rectangle144
                                        x: 0
                                        y: 100
                                        width: 1220
                                        height: 60
                                        color: "#00ffffff"
                                        anchors.top: parent.top
                                        anchors.topMargin: 100
                                        Rectangle {
                                            id: rectangle145
                                            x: 0
                                            y: 95
                                            width: 1220
                                            height: 3
                                            color: "#000000"
                                            anchors.bottom: parent.bottom
                                            anchors.bottomMargin: 0
                                            anchors.horizontalCenter: parent.horizontalCenter
                                        }
                                        
                                        Text {
                                            id: text129
                                            y: -424
                                            text: qsTr("Instructions")
                                            anchors.verticalCenter: parent.verticalCenter
                                            font.pixelSize: 35
                                            font.styleName: "Semibold"
                                            anchors.horizontalCenterOffset: 0
                                            anchors.horizontalCenter: parent.horizontalCenter
                                        }
                                        anchors.horizontalCenter: parent.horizontalCenter
                                    }
                                    
                                    Rectangle {
                                        id: rectangle147
                                        x: 220
                                        y: 810
                                        width: 200
                                        height: 80
                                        color: "#8c8c8c"
                                        radius: 15
                                        border.color: "#0b0b0b"
                                        anchors.bottom: parent.bottom
                                        anchors.bottomMargin: 50
                                        Text {
                                            id: text130
                                            text: qsTr("Next")
                                            anchors.fill: parent
                                            font.pixelSize: 30
                                            horizontalAlignment: Text.AlignHCenter
                                            verticalAlignment: Text.AlignVCenter
                                            font.weight: Font.DemiBold
                                        }
                                        
                                        MouseArea {
                                            id: mouseArea18
                                            x: -210
                                            y: -830
                                            anchors.fill: parent
                                            Connections {
                                                target: mouseArea18
                                                onClicked: stackLayout7.currentIndex = 2
                                            }
                                        }
                                        anchors.horizontalCenterOffset: 250
                                        anchors.horizontalCenter: parent.horizontalCenter
                                    }
                                    
                                    Rectangle {
                                        id: rectangle148
                                        x: 220
                                        y: 810
                                        width: 200
                                        height: 80
                                        color: "#8c8c8c"
                                        radius: 15
                                        border.color: "#0b0b0b"
                                        anchors.bottom: parent.bottom
                                        anchors.bottomMargin: 50
                                        Text {
                                            id: text131
                                            text: qsTr("Back")
                                            anchors.fill: parent
                                            font.pixelSize: 30
                                            horizontalAlignment: Text.AlignHCenter
                                            verticalAlignment: Text.AlignVCenter
                                            font.weight: Font.DemiBold
                                        }
                                        
                                        MouseArea {
                                            id: mouseArea19
                                            x: -210
                                            y: -830
                                            anchors.fill: parent
                                            Connections {
                                                target: mouseArea19
                                                onClicked: stackLayout7.currentIndex = 0
                                            }
                                        }
                                        anchors.horizontalCenterOffset: -250
                                        anchors.horizontalCenter: parent.horizontalCenter
                                    }
                                    
                                    Image {
                                        id: image22
                                        anchors.fill: parent
                                        anchors.topMargin: 0
                                        source: "../images/Maintnense/Oil1.PNG"
                                        fillMode: Image.PreserveAspectFit
                                    }
                                    
                                }
                                
                                Rectangle {
                                    id: rectangle146
                                    width: 200
                                    height: 200
                                    color: "#00ffffff"
                                    Rectangle {
                                        id: rectangle149
                                        x: 0
                                        y: 0
                                        width: 1220
                                        height: 100
                                        color: "#00ffffff"
                                        anchors.top: parent.top
                                        anchors.topMargin: 0
                                        Rectangle {
                                            id: rectangle150
                                            x: 0
                                            y: 95
                                            width: 1220
                                            height: 5
                                            color: "#000000"
                                            anchors.bottom: parent.bottom
                                            anchors.bottomMargin: 0
                                            anchors.horizontalCenter: parent.horizontalCenter
                                        }
                                        
                                        Text {
                                            id: text92
                                            y: -424
                                            text: qsTr("Engine Oil Change (2/3)")
                                            anchors.verticalCenter: parent.verticalCenter
                                            anchors.left: parent.left
                                            anchors.leftMargin: 50
                                            font.pixelSize: 50
                                            font.styleName: "Semibold"
                                        }
                                        
                                        CloseButton {
                                            id: closeButton3
                                            x: 1020
                                            anchors.verticalCenter: parent.verticalCenter
                                            anchors.right: parent.right
                                            anchors.rightMargin: 30
                                            Connections {
                                                target: closeButton3
                                                onClicked: rectangle133.y = 980
                                            }
                                        }
                                        anchors.horizontalCenter: parent.horizontalCenter
                                    }
                                    
                                    Rectangle {
                                        id: rectangle151
                                        x: 0
                                        y: 100
                                        width: 1220
                                        height: 60
                                        color: "#00ffffff"
                                        anchors.top: parent.top
                                        anchors.topMargin: 100
                                        Rectangle {
                                            id: rectangle152
                                            x: 0
                                            y: 95
                                            width: 1220
                                            height: 3
                                            color: "#000000"
                                            anchors.bottom: parent.bottom
                                            anchors.bottomMargin: 0
                                            anchors.horizontalCenter: parent.horizontalCenter
                                        }
                                        
                                        Text {
                                            id: text132
                                            y: -424
                                            text: qsTr("Instructions")
                                            anchors.verticalCenter: parent.verticalCenter
                                            font.pixelSize: 35
                                            font.styleName: "Semibold"
                                            anchors.horizontalCenterOffset: 0
                                            anchors.horizontalCenter: parent.horizontalCenter
                                        }
                                        anchors.horizontalCenter: parent.horizontalCenter
                                    }
                                    
                                    Rectangle {
                                        id: rectangle153
                                        x: 220
                                        y: 810
                                        width: 200
                                        height: 80
                                        color: "#8c8c8c"
                                        radius: 15
                                        border.color: "#0b0b0b"
                                        anchors.bottom: parent.bottom
                                        anchors.bottomMargin: 50
                                        Text {
                                            id: text133
                                            text: qsTr("Next")
                                            anchors.fill: parent
                                            font.pixelSize: 30
                                            horizontalAlignment: Text.AlignHCenter
                                            verticalAlignment: Text.AlignVCenter
                                            font.weight: Font.DemiBold
                                        }
                                        
                                        MouseArea {
                                            id: mouseArea20
                                            x: -210
                                            y: -830
                                            anchors.fill: parent
                                            Connections {
                                                target: mouseArea20
                                                onClicked: stackLayout7.currentIndex = 3
                                            }
                                        }
                                        anchors.horizontalCenterOffset: 250
                                        anchors.horizontalCenter: parent.horizontalCenter
                                    }
                                    
                                    
                                    Rectangle {
                                        id: rectangle154
                                        x: 220
                                        y: 810
                                        width: 200
                                        height: 80
                                        color: "#8c8c8c"
                                        radius: 15
                                        border.color: "#0b0b0b"
                                        anchors.bottom: parent.bottom
                                        anchors.bottomMargin: 50
                                        Text {
                                            id: text134
                                            text: qsTr("Back")
                                            anchors.fill: parent
                                            font.pixelSize: 30
                                            horizontalAlignment: Text.AlignHCenter
                                            verticalAlignment: Text.AlignVCenter
                                            font.weight: Font.DemiBold
                                        }
                                        
                                        MouseArea {
                                            id: mouseArea21
                                            x: -210
                                            y: -830
                                            anchors.fill: parent
                                            Connections {
                                                target: mouseArea21
                                                onClicked: stackLayout7.currentIndex = 1
                                            }
                                        }
                                        anchors.horizontalCenterOffset: -250
                                        anchors.horizontalCenter: parent.horizontalCenter
                                    }
                                    Image {
                                        id: image23
                                        anchors.fill: parent
                                        anchors.topMargin: 0
                                        source: "../images/Maintnense/Oil2.PNG"
                                        fillMode: Image.PreserveAspectFit
                                    }
                                }
                                
                                Rectangle {
                                    id: rectangle155
                                    width: 200
                                    height: 200
                                    color: "#00ffffff"
                                    Rectangle {
                                        id: rectangle156
                                        x: 0
                                        y: 0
                                        width: 1220
                                        height: 100
                                        color: "#00ffffff"
                                        anchors.top: parent.top
                                        anchors.topMargin: 0
                                        Rectangle {
                                            id: rectangle157
                                            x: 0
                                            y: 95
                                            width: 1220
                                            height: 5
                                            color: "#000000"
                                            anchors.bottom: parent.bottom
                                            anchors.bottomMargin: 0
                                            anchors.horizontalCenter: parent.horizontalCenter
                                        }
                                        
                                        Text {
                                            id: text135
                                            y: -424
                                            text: qsTr("Engine Oil Change (3/3)")
                                            anchors.verticalCenter: parent.verticalCenter
                                            anchors.left: parent.left
                                            anchors.leftMargin: 50
                                            font.pixelSize: 50
                                            font.styleName: "Semibold"
                                        }
                                        
                                        CloseButton {
                                            id: closeButton4
                                            x: 1020
                                            anchors.verticalCenter: parent.verticalCenter
                                            anchors.right: parent.right
                                            anchors.rightMargin: 30
                                            Connections {
                                                target: closeButton4
                                                onClicked: rectangle133.y = 980
                                            }
                                        }
                                        anchors.horizontalCenter: parent.horizontalCenter
                                    }
                                    
                                    Rectangle {
                                        id: rectangle158
                                        x: 0
                                        y: 100
                                        width: 1220
                                        height: 60
                                        color: "#00ffffff"
                                        anchors.top: parent.top
                                        anchors.topMargin: 100
                                        Rectangle {
                                            id: rectangle159
                                            x: 0
                                            y: 95
                                            width: 1220
                                            height: 3
                                            color: "#000000"
                                            anchors.bottom: parent.bottom
                                            anchors.bottomMargin: 0
                                            anchors.horizontalCenter: parent.horizontalCenter
                                        }
                                        
                                        Text {
                                            id: text136
                                            y: -424
                                            text: qsTr("Instructions")
                                            anchors.verticalCenter: parent.verticalCenter
                                            font.pixelSize: 35
                                            font.styleName: "Semibold"
                                            anchors.horizontalCenterOffset: 0
                                            anchors.horizontalCenter: parent.horizontalCenter
                                        }
                                        anchors.horizontalCenter: parent.horizontalCenter
                                    }
                                    
                                    Rectangle {
                                        id: rectangle160
                                        x: 220
                                        y: 810
                                        width: 200
                                        height: 80
                                        color: "#8c8c8c"
                                        radius: 15
                                        border.color: "#0b0b0b"
                                        anchors.bottom: parent.bottom
                                        anchors.bottomMargin: 50
                                        Text {
                                            id: text137
                                            text: qsTr("Done")
                                            anchors.fill: parent
                                            font.pixelSize: 30
                                            horizontalAlignment: Text.AlignHCenter
                                            verticalAlignment: Text.AlignVCenter
                                            font.weight: Font.DemiBold
                                        }
                                        
                                        MouseArea {
                                            id: mouseArea22
                                            x: -210
                                            y: -830
                                            anchors.fill: parent
                                            Connections {
                                                target: mouseArea22
                                                onClicked: stackLayout7.currentIndex = 0
                                            }
                                        }
                                        anchors.horizontalCenterOffset: 250
                                        anchors.horizontalCenter: parent.horizontalCenter
                                    }
                                    
                                    Rectangle {
                                        id: rectangle161
                                        x: 220
                                        y: 810
                                        width: 200
                                        height: 80
                                        color: "#8c8c8c"
                                        radius: 15
                                        border.color: "#0b0b0b"
                                        anchors.bottom: parent.bottom
                                        anchors.bottomMargin: 50
                                        Text {
                                            id: text138
                                            text: qsTr("Back")
                                            anchors.fill: parent
                                            font.pixelSize: 30
                                            horizontalAlignment: Text.AlignHCenter
                                            verticalAlignment: Text.AlignVCenter
                                            font.weight: Font.DemiBold
                                        }
                                        
                                        MouseArea {
                                            id: mouseArea23
                                            x: -210
                                            y: -830
                                            anchors.fill: parent
                                            Connections {
                                                target: mouseArea23
                                                onClicked: stackLayout7.currentIndex = 2
                                            }
                                        }
                                        anchors.horizontalCenterOffset: -250
                                        anchors.horizontalCenter: parent.horizontalCenter
                                    }
                                    
                                    Image {
                                        id: image24
                                        anchors.fill: parent
                                        anchors.topMargin: 0
                                        source: "../images/Maintnense/Oil3.PNG"
                                        fillMode: Image.PreserveAspectFit
                                    }
                                    
                                }
                                currentIndex: 0
                            }
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                    }
                    anchors.horizontalCenter: parent.horizontalCenter
                }
                
            }
            
            Rectangle {
                id: troublecodes
                width: 200
                height: 200
                visible: true
                color: "#ffffff"
                
                Image {
                    id: image26
                    x: 0
                    y: 0
                    anchors.fill: parent
                    source: "../images/BackroundService.png"
                    fillMode: Image.TileHorizontally
                    
                    Rectangle {
                        id: rectangle170
                        x: 0
                        y: 0
                        width: 1120
                        height: 100
                        color: "#00ffffff"
                        border.width: 0
                        
                        Text {
                            id: text163
                            text: qsTr("Trouble Codes")
                            anchors.verticalCenter: parent.verticalCenter
                            font.pixelSize: 70
                            font.styleName: "Semibold"
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                        
                        Rectangle {
                            id: rectangle171
                            width: 1220
                            height: 7
                            color: "#000000"
                            anchors.bottom: parent.bottom
                            anchors.bottomMargin: 0
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                    }
                    
                    PageChangeButton {
                        id: pageChangeButton4
                        x: 925
                        y: 195
                        rotation: -90
                        Connections {
                            target: pageChangeButton4
                            onClicked: if(stackLayout8.currentIndex > 0)
                                       {
                                           stackLayout8.currentIndex = stackLayout8.currentIndex - 1
                                       }
                        }
                    }
                    
                    PageChangeButton {
                        id: pageChangeButton5
                        x: 925
                        y: 685
                        rotation: 90
                        Connections {
                            target: pageChangeButton5
                            onClicked: if(stackLayout8.currentIndex < 5)
                                       {
                                           stackLayout8.currentIndex = stackLayout8.currentIndex + 1
                                       }
                        }
                    }
                    
                    StackLayout {
                        id: stackLayout8
                        anchors.fill: parent
                        anchors.rightMargin: 100
                        anchors.topMargin: 100
                        Rectangle {
                            id: tranny3
                            width: 200
                            height: 200
                            color: "#00ffffff"
                            Column {
                                id: column11
                                x: 0
                                y: 100
                                anchors.fill: parent
                                topPadding: 0
                                spacing: 0
                                padding: 0
                                Rectangle {
                                    id: rectangle172
                                    x: 0
                                    width: 1120
                                    height: 80
                                    color: "#00ffffff"
                                    border.width: 0
                                    Rectangle {
                                        id: rectangle173
                                        x: -610
                                        y: -115
                                        width: 1120
                                        height: 4
                                        color: "#000000"
                                        anchors.bottom: parent.bottom
                                        anchors.bottomMargin: 0
                                        anchors.horizontalCenter: parent.horizontalCenter
                                    }
                                    
                                    Text {
                                        id: text165
                                        text: qsTr("Error Code")
                                        anchors.verticalCenter: parent.verticalCenter
                                        anchors.left: parent.left
                                        anchors.leftMargin: 30
                                        font.pixelSize: 50
                                        horizontalAlignment: Text.AlignHCenter
                                        verticalAlignment: Text.AlignTop
                                        font.weight: Font.DemiBold
                                        anchors.verticalCenterOffset: -10
                                    }
                                    
                                    Text {
                                        id: text186
                                        text: qsTr("State")
                                        anchors.verticalCenter: parent.verticalCenter
                                        anchors.right: parent.right
                                        anchors.rightMargin: 35
                                        font.pixelSize: 50
                                        horizontalAlignment: Text.AlignHCenter
                                        verticalAlignment: Text.AlignTop
                                        font.weight: Font.DemiBold
                                        anchors.verticalCenterOffset: -10
                                    }
                                }
                                
                                Rectangle {
                                    id: rectangle174
                                    x: 0
                                    width: 1120
                                    height: 80
                                    color: "#00ffffff"
                                    border.width: 0
                                    Rectangle {
                                        id: rectangle175
                                        x: -610
                                        y: -115
                                        width: 1120
                                        height: 2
                                        color: "#000000"
                                        anchors.bottom: parent.bottom
                                        anchors.bottomMargin: 0
                                        anchors.horizontalCenter: parent.horizontalCenter
                                    }
                                    
                                    Text {
                                        id: text166
                                        text: qsTr("Transmission Neutral Self Cal")
                                        anchors.verticalCenter: parent.verticalCenter
                                        anchors.left: parent.left
                                        anchors.leftMargin: 40
                                        font.pixelSize: 30
                                        horizontalAlignment: Text.AlignLeft
                                        font.weight: Font.DemiBold
                                    }
                                    
                                    Text {
                                        id: terror1
                                        text: qsTr("0")
                                        anchors.verticalCenter: parent.verticalCenter
                                        anchors.right: parent.right
                                        anchors.rightMargin: 150
                                        font.pixelSize: 30
                                        horizontalAlignment: Text.AlignHCenter
                                        font.weight: Font.DemiBold
                                    }
                                }
                                
                                Rectangle {
                                    id: rectangle176
                                    x: 0
                                    width: 1120
                                    height: 80
                                    color: "#00ffffff"
                                    border.width: 0
                                    Rectangle {
                                        id: rectangle177
                                        x: -610
                                        y: -115
                                        width: 1120
                                        height: 2
                                        color: "#000000"
                                        anchors.bottom: parent.bottom
                                        anchors.bottomMargin: 0
                                        anchors.horizontalCenter: parent.horizontalCenter
                                    }
                                    
                                    Text {
                                        id: text167
                                        text: qsTr("Transmission Neutral Fail")
                                        anchors.verticalCenter: parent.verticalCenter
                                        anchors.left: parent.left
                                        anchors.leftMargin: 40
                                        font.pixelSize: 30
                                        horizontalAlignment: Text.AlignLeft
                                        font.weight: Font.DemiBold
                                    }
                                    
                                    Text {
                                        id: terror2
                                        text: qsTr("0")
                                        anchors.verticalCenter: parent.verticalCenter
                                        anchors.right: parent.right
                                        anchors.rightMargin: 150
                                        font.pixelSize: 30
                                        horizontalAlignment: Text.AlignHCenter
                                        font.weight: Font.DemiBold
                                    }
                                }
                                
                                Rectangle {
                                    id: rectangle178
                                    x: 0
                                    width: 1120
                                    height: 80
                                    color: "#00ffffff"
                                    border.width: 0
                                    Rectangle {
                                        id: rectangle179
                                        x: -610
                                        y: -115
                                        width: 1120
                                        height: 2
                                        color: "#000000"
                                        anchors.bottom: parent.bottom
                                        anchors.bottomMargin: 0
                                        anchors.horizontalCenter: parent.horizontalCenter
                                    }
                                    
                                    Text {
                                        id: text168
                                        text: qsTr("Clutch Failed to Move")
                                        anchors.verticalCenter: parent.verticalCenter
                                        anchors.left: parent.left
                                        anchors.leftMargin: 40
                                        font.pixelSize: 30
                                        horizontalAlignment: Text.AlignLeft
                                        font.weight: Font.DemiBold
                                    }
                                    
                                    Text {
                                        id: terror3
                                        text: qsTr("0")
                                        anchors.verticalCenter: parent.verticalCenter
                                        anchors.right: parent.right
                                        anchors.rightMargin: 150
                                        font.pixelSize: 30
                                        horizontalAlignment: Text.AlignHCenter
                                        font.weight: Font.DemiBold
                                    }
                                }
                                
                                Rectangle {
                                    id: rectangle180
                                    x: 0
                                    width: 1120
                                    height: 80
                                    color: "#00ffffff"
                                    border.width: 0
                                    Rectangle {
                                        id: rectangle181
                                        x: -610
                                        y: -115
                                        width: 1120
                                        height: 2
                                        color: "#000000"
                                        anchors.bottom: parent.bottom
                                        anchors.bottomMargin: 0
                                        anchors.horizontalCenter: parent.horizontalCenter
                                    }
                                    
                                    Text {
                                        id: text169
                                        text: qsTr("Shift in Progress")
                                        anchors.verticalCenter: parent.verticalCenter
                                        anchors.left: parent.left
                                        anchors.leftMargin: 40
                                        font.pixelSize: 30
                                        horizontalAlignment: Text.AlignLeft
                                        font.weight: Font.DemiBold
                                    }
                                    
                                    Text {
                                        id: terror4
                                        text: qsTr("0")
                                        anchors.verticalCenter: parent.verticalCenter
                                        anchors.right: parent.right
                                        anchors.rightMargin: 150
                                        font.pixelSize: 30
                                        horizontalAlignment: Text.AlignHCenter
                                        font.weight: Font.DemiBold
                                    }
                                }
                                
                                Rectangle {
                                    id: rectangle182
                                    x: 0
                                    width: 1120
                                    height: 80
                                    color: "#00ffffff"
                                    border.width: 0
                                    Rectangle {
                                        id: rectangle183
                                        x: -610
                                        y: -115
                                        width: 1120
                                        height: 2
                                        color: "#000000"
                                        anchors.bottom: parent.bottom
                                        anchors.bottomMargin: 0
                                        anchors.horizontalCenter: parent.horizontalCenter
                                    }
                                    
                                    Text {
                                        id: text170
                                        text: qsTr("Operator Released Clutch Early")
                                        anchors.verticalCenter: parent.verticalCenter
                                        anchors.left: parent.left
                                        anchors.leftMargin: 40
                                        font.pixelSize: 30
                                        horizontalAlignment: Text.AlignLeft
                                        font.weight: Font.DemiBold
                                    }
                                    
                                    Text {
                                        id: terror5
                                        text: qsTr("0")
                                        anchors.verticalCenter: parent.verticalCenter
                                        anchors.right: parent.right
                                        anchors.rightMargin: 150
                                        font.pixelSize: 30
                                        horizontalAlignment: Text.AlignHCenter
                                        font.weight: Font.DemiBold
                                    }
                                }
                            }
                        }
                        currentIndex: 0
                    }
                }
            }
            
            Rectangle {
                id: sensors
                width: 200
                height: 200
                visible: true
                color: "#ffffff"
                
                Image {
                    id: image14
                    anchors.fill: parent
                    source: "../images/BackroundService.png"
                    fillMode: Image.TileHorizontally
                }
                
                Rectangle {
                    id: rectangle19
                    x: 0
                    y: 0
                    width: 1120
                    height: 100
                    color: "#00ffffff"
                    border.width: 0
                    
                    Text {
                        id: text28
                        text: qsTr("Sensor")
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        anchors.leftMargin: 40
                        font.pixelSize: 50
                        font.styleName: "Semibold"
                    }
                    
                    Text {
                        id: text29
                        text: qsTr("Value")
                        anchors.verticalCenter: parent.verticalCenter
                        font.pixelSize: 50
                        anchors.horizontalCenter: parent.horizontalCenter
                        font.styleName: "Semibold"
                    }
                    
                    Text {
                        id: text30
                        text: qsTr("Range")
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.right: parent.right
                        anchors.rightMargin: 50
                        font.pixelSize: 50
                        font.styleName: "Semibold"
                    }
                    
                    Rectangle {
                        id: rectangle21
                        width: 1220
                        height: 7
                        color: "#000000"
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 0
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }
                
                PageChangeButton {
                    id: pageChangeButton
                    x: 925
                    y: 195
                    rotation: -90
                    
                    Connections {
                        target: pageChangeButton
                        onClicked: if(stackLayout2.currentIndex > 0)
                                   {
                                       stackLayout2.currentIndex = stackLayout2.currentIndex - 1
                                   }
                    }
                }
                
                PageChangeButton {
                    id: pageChangeButton1
                    x: 925
                    y: 685
                    rotation: 90
                    
                    Connections {
                        target: pageChangeButton1
                        onClicked: if(stackLayout2.currentIndex < 5)
                                   {
                                       stackLayout2.currentIndex = stackLayout2.currentIndex + 1
                                   }
                    }
                }
                
                StackLayout {
                    id: stackLayout2
                    anchors.fill: parent
                    anchors.rightMargin: 100
                    anchors.topMargin: 100
                    currentIndex: 0
                    
                    Rectangle {
                        id: tranny1
                        width: 200
                        height: 200
                        color: "#00ffffff"
                        
                        Column {
                            id: column3
                            x: 0
                            y: 100
                            anchors.fill: parent
                            topPadding: 0
                            padding: 0
                            spacing: 0
                            
                            
                            
                            
                            
                            
                            
                            Rectangle {
                                id: rectangle20
                                x: 0
                                width: 1120
                                height: 80
                                color: "#00ffffff"
                                border.width: 0
                                
                                Rectangle {
                                    id: rectangle22
                                    x: -610
                                    y: -115
                                    width: 1120
                                    height: 4
                                    color: "#000000"
                                    anchors.bottom: parent.bottom
                                    anchors.bottomMargin: 0
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                                
                                Text {
                                    id: text31
                                    text: qsTr("Transmission (1/2)")
                                    anchors.verticalCenter: parent.verticalCenter
                                    font.pixelSize: 70
                                    horizontalAlignment: Text.AlignHCenter
                                    verticalAlignment: Text.AlignTop
                                    anchors.verticalCenterOffset: -10
                                    font.weight: Font.DemiBold
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                            }
                            
                            
                            
                            Rectangle {
                                id: rectangle30
                                x: 0
                                width: 1120
                                height: 80
                                color: "#00ffffff"
                                border.width: 0
                                Rectangle {
                                    id: rectangle31
                                    x: -610
                                    y: -115
                                    width: 1120
                                    height: 2
                                    color: "#000000"
                                    anchors.bottom: parent.bottom
                                    anchors.bottomMargin: 0
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                                
                                Text {
                                    id: text41
                                    text: qsTr("Gear Actual")
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.left: parent.left
                                    anchors.leftMargin: 40
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignLeft
                                    font.weight: Font.DemiBold
                                }
                                
                                Text {
                                    id: gearact
                                    text: qsTr("2")
                                    anchors.verticalCenter: parent.verticalCenter
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignHCenter
                                    font.weight: Font.DemiBold
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                                
                                Text {
                                    id: text43
                                    text: qsTr("-1 - 4")
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.right: parent.right
                                    anchors.rightMargin: 40
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignHCenter
                                    font.weight: Font.DemiBold
                                }
                            }
                            
                            Rectangle {
                                id: rectangle32
                                x: 0
                                width: 1120
                                height: 80
                                color: "#00ffffff"
                                border.width: 0
                                Rectangle {
                                    id: rectangle33
                                    x: -610
                                    y: -115
                                    width: 1120
                                    height: 2
                                    color: "#000000"
                                    anchors.bottom: parent.bottom
                                    anchors.bottomMargin: 0
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                                
                                Text {
                                    id: text44
                                    text: qsTr("Gear Target")
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.left: parent.left
                                    anchors.leftMargin: 40
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignLeft
                                    font.weight: Font.DemiBold
                                }
                                
                                Text {
                                    id: geartrg
                                    text: qsTr("2")
                                    anchors.verticalCenter: parent.verticalCenter
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignHCenter
                                    font.weight: Font.DemiBold
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                                
                                Text {
                                    id: text46
                                    text: qsTr("-1 - 4")
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.right: parent.right
                                    anchors.rightMargin: 40
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignHCenter
                                    font.weight: Font.DemiBold
                                }
                            }
                            
                            Rectangle {
                                id: rectangle34
                                x: 0
                                width: 1120
                                height: 80
                                color: "#00ffffff"
                                border.width: 0
                                Rectangle {
                                    id: rectangle35
                                    x: -610
                                    y: -115
                                    width: 1120
                                    height: 2
                                    color: "#000000"
                                    anchors.bottom: parent.bottom
                                    anchors.bottomMargin: 0
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                                
                                Text {
                                    id: text47
                                    text: qsTr("Right Sensor")
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.left: parent.left
                                    anchors.leftMargin: 40
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignLeft
                                    font.weight: Font.DemiBold
                                }
                                
                                Text {
                                    id: trrs
                                    text: qsTr("600")
                                    anchors.verticalCenter: parent.verticalCenter
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignHCenter
                                    font.weight: Font.DemiBold
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                                
                                Text {
                                    id: text49
                                    text: qsTr("0-1023")
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.right: parent.right
                                    anchors.rightMargin: 40
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignHCenter
                                    font.weight: Font.DemiBold
                                }
                            }
                            
                            Rectangle {
                                id: rectangle36
                                x: 0
                                width: 1120
                                height: 80
                                color: "#00ffffff"
                                border.width: 0
                                Rectangle {
                                    id: rectangle37
                                    x: -610
                                    y: -115
                                    width: 1120
                                    height: 2
                                    color: "#000000"
                                    anchors.bottom: parent.bottom
                                    anchors.bottomMargin: 0
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                                
                                Text {
                                    id: text50
                                    text: qsTr("Right Sensor V")
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.left: parent.left
                                    anchors.leftMargin: 40
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignLeft
                                    font.weight: Font.DemiBold
                                }
                                
                                Text {
                                    id: trrsv
                                    text: qsTr("2.5")
                                    anchors.verticalCenter: parent.verticalCenter
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignHCenter
                                    font.weight: Font.DemiBold
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                                
                                Text {
                                    id: text52
                                    text: qsTr("0-5 V")
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.right: parent.right
                                    anchors.rightMargin: 40
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignHCenter
                                    font.weight: Font.DemiBold
                                }
                            }
                            
                            Rectangle {
                                id: rectangle38
                                x: 0
                                width: 1120
                                height: 80
                                color: "#00ffffff"
                                border.width: 0
                                Rectangle {
                                    id: rectangle39
                                    x: -610
                                    y: -115
                                    width: 1120
                                    height: 2
                                    color: "#000000"
                                    anchors.bottom: parent.bottom
                                    anchors.bottomMargin: 0
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                                
                                Text {
                                    id: text53
                                    text: qsTr("Right Limit Switch")
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.left: parent.left
                                    anchors.leftMargin: 40
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignLeft
                                    font.weight: Font.DemiBold
                                }
                                
                                Text {
                                    id: trrlms
                                    text: qsTr("0")
                                    anchors.verticalCenter: parent.verticalCenter
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignHCenter
                                    font.weight: Font.DemiBold
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                                
                                Text {
                                    id: text55
                                    text: qsTr("0-1")
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.right: parent.right
                                    anchors.rightMargin: 40
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignHCenter
                                    font.weight: Font.DemiBold
                                }
                            }
                            
                            Rectangle {
                                id: rectangle40
                                x: 0
                                width: 1120
                                height: 80
                                color: "#00ffffff"
                                border.width: 0
                                Rectangle {
                                    id: rectangle41
                                    x: -610
                                    y: -115
                                    width: 1120
                                    height: 2
                                    color: "#000000"
                                    anchors.bottom: parent.bottom
                                    anchors.bottomMargin: 0
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                                
                                Text {
                                    id: text56
                                    text: qsTr("Left Sensor")
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.left: parent.left
                                    anchors.leftMargin: 40
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignLeft
                                    font.weight: Font.DemiBold
                                }
                                
                                Text {
                                    id: trls
                                    text: qsTr("230")
                                    anchors.verticalCenter: parent.verticalCenter
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignHCenter
                                    font.weight: Font.DemiBold
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                                
                                Text {
                                    id: text58
                                    text: qsTr("0-1023")
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.right: parent.right
                                    anchors.rightMargin: 40
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignHCenter
                                    font.weight: Font.DemiBold
                                }
                            }
                            
                            Rectangle {
                                id: rectangle42
                                x: 0
                                width: 1120
                                height: 80
                                color: "#00ffffff"
                                border.width: 0
                                Rectangle {
                                    id: rectangle43
                                    x: -610
                                    y: -115
                                    width: 1120
                                    height: 2
                                    color: "#000000"
                                    anchors.bottom: parent.bottom
                                    anchors.bottomMargin: 0
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                                
                                Text {
                                    id: text59
                                    text: qsTr("Left Sensor V")
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.left: parent.left
                                    anchors.leftMargin: 40
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignLeft
                                    font.weight: Font.DemiBold
                                }
                                
                                Text {
                                    id: trlsv
                                    text: qsTr("2.5")
                                    anchors.verticalCenter: parent.verticalCenter
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignHCenter
                                    font.weight: Font.DemiBold
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                                
                                Text {
                                    id: text61
                                    text: qsTr("0-5 V")
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.right: parent.right
                                    anchors.rightMargin: 40
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignHCenter
                                    font.weight: Font.DemiBold
                                }
                            }
                            
                            Rectangle {
                                id: rectangle23
                                x: 0
                                width: 1120
                                height: 80
                                color: "#00ffffff"
                                border.width: 0
                                Rectangle {
                                    id: rectangle24
                                    x: -610
                                    y: -115
                                    width: 1120
                                    height: 2
                                    color: "#000000"
                                    anchors.bottom: parent.bottom
                                    anchors.bottomMargin: 0
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                                
                                Text {
                                    id: text32
                                    text: qsTr("Left Limit Switch")
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.left: parent.left
                                    anchors.leftMargin: 40
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignLeft
                                    font.weight: Font.DemiBold
                                }
                                
                                Text {
                                    id: trllms
                                    text: qsTr("0")
                                    anchors.verticalCenter: parent.verticalCenter
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignHCenter
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    font.weight: Font.DemiBold
                                }
                                
                                Text {
                                    id: text34
                                    text: qsTr("0-1")
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.right: parent.right
                                    anchors.rightMargin: 40
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignHCenter
                                    font.weight: Font.DemiBold
                                }
                            }
                            
                            Rectangle {
                                id: rectangle59
                                x: 0
                                width: 1120
                                height: 80
                                color: "#00ffffff"
                                border.width: 0
                                Rectangle {
                                    id: rectangle60
                                    x: -610
                                    y: -115
                                    width: 1120
                                    height: 2
                                    color: "#000000"
                                    anchors.bottom: parent.bottom
                                    anchors.bottomMargin: 0
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                                
                                Text {
                                    id: text60
                                    text: qsTr("Output Speed")
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.left: parent.left
                                    anchors.leftMargin: 40
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignLeft
                                    font.weight: Font.DemiBold
                                }
                                
                                Text {
                                    id: trspeed
                                    text: qsTr("10.3")
                                    anchors.verticalCenter: parent.verticalCenter
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignHCenter
                                    font.weight: Font.DemiBold
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                                
                                Text {
                                    id: text64
                                    text: qsTr("0-26 MPH")
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.right: parent.right
                                    anchors.rightMargin: 40
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignHCenter
                                    font.weight: Font.DemiBold
                                }
                            }
                            
                            Rectangle {
                                id: rectangle61
                                x: 0
                                width: 1120
                                height: 80
                                color: "#00ffffff"
                                border.width: 0
                                Rectangle {
                                    id: rectangle62
                                    x: -610
                                    y: -115
                                    width: 1120
                                    height: 2
                                    color: "#000000"
                                    anchors.bottom: parent.bottom
                                    anchors.bottomMargin: 0
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                                
                                Text {
                                    id: text67
                                    text: qsTr("Speed Sensor V")
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.left: parent.left
                                    anchors.leftMargin: 40
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignLeft
                                    font.weight: Font.DemiBold
                                }
                                
                                Text {
                                    id: trspeedv
                                    text: qsTr("2.5")
                                    anchors.verticalCenter: parent.verticalCenter
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignHCenter
                                    font.weight: Font.DemiBold
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                                
                                Text {
                                    id: text70
                                    text: qsTr("0-5 V")
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.right: parent.right
                                    anchors.rightMargin: 40
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignHCenter
                                    font.weight: Font.DemiBold
                                }
                            }
                        }
                    }
                    
                    Rectangle {
                        id: tranny2
                        width: 200
                        height: 200
                        color: "#00ffffff"
                        Column {
                            id: column4
                            x: 0
                            y: 100
                            anchors.fill: parent
                            topPadding: 0
                            spacing: 0
                            padding: 0
                            
                            Rectangle {
                                id: rectangle45
                                x: 0
                                width: 1120
                                height: 80
                                color: "#00ffffff"
                                border.width: 0
                                Rectangle {
                                    id: rectangle46
                                    x: -610
                                    y: -115
                                    width: 1120
                                    height: 4
                                    color: "#000000"
                                    anchors.bottom: parent.bottom
                                    anchors.bottomMargin: 0
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                                
                                Text {
                                    id: text62
                                    text: qsTr("Transmission (2/2)")
                                    anchors.verticalCenter: parent.verticalCenter
                                    font.pixelSize: 70
                                    anchors.verticalCenterOffset: -10
                                    font.weight: Font.DemiBold
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                            }
                            
                            
                            Rectangle {
                                id: rectangle47
                                x: 0
                                width: 1120
                                height: 80
                                color: "#00ffffff"
                                border.width: 0
                                Rectangle {
                                    id: rectangle48
                                    x: -610
                                    y: -115
                                    width: 1120
                                    height: 2
                                    color: "#000000"
                                    anchors.bottom: parent.bottom
                                    anchors.bottomMargin: 0
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                                
                                Text {
                                    id: text63
                                    text: qsTr("Acuator Position FB")
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.left: parent.left
                                    anchors.leftMargin: 40
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignLeft
                                    font.weight: Font.DemiBold
                                }
                                
                                Text {
                                    id: aposfb
                                    text: qsTr("15")
                                    anchors.verticalCenter: parent.verticalCenter
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignHCenter
                                    font.weight: Font.DemiBold
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                                
                                Text {
                                    id: text65
                                    text: qsTr("0-6430 mm")
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.right: parent.right
                                    anchors.rightMargin: 40
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignHCenter
                                    font.weight: Font.DemiBold
                                }
                            }
                            
                            
                            Rectangle {
                                id: rectangle49
                                x: 0
                                width: 1120
                                height: 80
                                color: "#00ffffff"
                                border.width: 0
                                Rectangle {
                                    id: rectangle50
                                    x: -610
                                    y: -115
                                    width: 1120
                                    height: 2
                                    color: "#000000"
                                    anchors.bottom: parent.bottom
                                    anchors.bottomMargin: 0
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                                
                                Text {
                                    id: text66
                                    text: qsTr("Acuator Speed")
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.left: parent.left
                                    anchors.leftMargin: 40
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignLeft
                                    font.weight: Font.DemiBold
                                }
                                
                                Text {
                                    id: aspeed
                                    text: qsTr("80")
                                    anchors.verticalCenter: parent.verticalCenter
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignHCenter
                                    font.weight: Font.DemiBold
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                                
                                Text {
                                    id: text68
                                    text: qsTr("0-100 %")
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.right: parent.right
                                    anchors.rightMargin: 40
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignHCenter
                                    font.weight: Font.DemiBold
                                }
                            }
                            
                            Rectangle {
                                id: rectangle92
                                width: 1120
                                height: 80
                                color: "#00ffffff"
                                border.width: 0
                                Rectangle {
                                    id: rectangle93
                                    x: -610
                                    y: -115
                                    width: 1120
                                    height: 2
                                    color: "#000000"
                                    anchors.bottom: parent.bottom
                                    anchors.bottomMargin: 0
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                                
                                Text {
                                    id: text42
                                    text: qsTr("Actuator Current FB")
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.left: parent.left
                                    anchors.leftMargin: 40
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignLeft
                                    font.weight: Font.DemiBold
                                }
                                
                                Text {
                                    id: acufb
                                    text: qsTr("20.0")
                                    anchors.verticalCenter: parent.verticalCenter
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignHCenter
                                    font.weight: Font.DemiBold
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                                
                                Text {
                                    id: text45
                                    text: qsTr("0-30 A")
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.right: parent.right
                                    anchors.rightMargin: 40
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignHCenter
                                    font.weight: Font.DemiBold
                                }
                            }
                            
                            Rectangle {
                                id: rectangle94
                                width: 1120
                                height: 80
                                color: "#00ffffff"
                                border.width: 0
                                Rectangle {
                                    id: rectangle95
                                    x: -610
                                    y: -115
                                    width: 1120
                                    height: 2
                                    color: "#000000"
                                    anchors.bottom: parent.bottom
                                    anchors.bottomMargin: 0
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                                
                                Text {
                                    id: text48
                                    text: qsTr("Actuator Error Code")
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.left: parent.left
                                    anchors.leftMargin: 40
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignLeft
                                    font.weight: Font.DemiBold
                                }
                                
                                Text {
                                    id: aerror
                                    text: qsTr("0")
                                    anchors.verticalCenter: parent.verticalCenter
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignHCenter
                                    font.weight: Font.DemiBold
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                                
                                Text {
                                    id: text51
                                    text: qsTr("0-7")
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.right: parent.right
                                    anchors.rightMargin: 40
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignHCenter
                                    font.weight: Font.DemiBold
                                }
                            }
                            
                            Rectangle {
                                id: rectangle96
                                width: 1120
                                height: 80
                                color: "#00ffffff"
                                border.width: 0
                                Rectangle {
                                    id: rectangle97
                                    x: -610
                                    y: -115
                                    width: 1120
                                    height: 2
                                    color: "#000000"
                                    anchors.bottom: parent.bottom
                                    anchors.bottomMargin: 0
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                                
                                Text {
                                    id: text54
                                    text: qsTr("Actuator Status Flag")
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.left: parent.left
                                    anchors.leftMargin: 40
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignLeft
                                    font.weight: Font.DemiBold
                                }
                                
                                Text {
                                    id: astatus
                                    text: qsTr("0")
                                    anchors.verticalCenter: parent.verticalCenter
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignHCenter
                                    font.weight: Font.DemiBold
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                                
                                Text {
                                    id: text57
                                    text: qsTr("0-7")
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.right: parent.right
                                    anchors.rightMargin: 40
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignHCenter
                                    font.weight: Font.DemiBold
                                }
                            }
                            
                            Rectangle {
                                id: rectangle51
                                x: 0
                                width: 1120
                                height: 80
                                color: "#00ffffff"
                                border.width: 0
                                Rectangle {
                                    id: rectangle52
                                    x: -610
                                    y: -115
                                    width: 1120
                                    height: 2
                                    color: "#000000"
                                    anchors.bottom: parent.bottom
                                    anchors.bottomMargin: 0
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                                
                                Text {
                                    id: text69
                                    text: qsTr("Clutch Pedal Pos.")
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.left: parent.left
                                    anchors.leftMargin: 40
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignLeft
                                    font.weight: Font.DemiBold
                                }
                                
                                Text {
                                    id: clupedpos
                                    text: qsTr("50")
                                    anchors.verticalCenter: parent.verticalCenter
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignHCenter
                                    font.weight: Font.DemiBold
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                                
                                Text {
                                    id: text71
                                    text: qsTr("0-100%")
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.right: parent.right
                                    anchors.rightMargin: 40
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignHCenter
                                    font.weight: Font.DemiBold
                                }
                            }
                            
                            
                            
                            Rectangle {
                                id: rectangle53
                                x: 0
                                width: 1120
                                height: 80
                                color: "#00ffffff"
                                border.width: 0
                                Rectangle {
                                    id: rectangle54
                                    x: -610
                                    y: -115
                                    width: 1120
                                    height: 2
                                    color: "#000000"
                                    anchors.bottom: parent.bottom
                                    anchors.bottomMargin: 0
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                                
                                Text {
                                    id: text72
                                    text: qsTr("Clutch Pedal V")
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.left: parent.left
                                    anchors.leftMargin: 40
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignLeft
                                    font.weight: Font.DemiBold
                                }
                                
                                Text {
                                    id: clupedposv
                                    text: qsTr("2.5")
                                    anchors.verticalCenter: parent.verticalCenter
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignHCenter
                                    font.weight: Font.DemiBold
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                                
                                Text {
                                    id: text74
                                    text: qsTr("0-5 V")
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.right: parent.right
                                    anchors.rightMargin: 40
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignHCenter
                                    font.weight: Font.DemiBold
                                }
                            }
                            
                            
                            
                            Rectangle {
                                id: rectangle55
                                x: 0
                                width: 1120
                                height: 80
                                color: "#00ffffff"
                                border.width: 0
                                Rectangle {
                                    id: rectangle56
                                    x: -610
                                    y: -115
                                    width: 1120
                                    height: 2
                                    color: "#000000"
                                    anchors.bottom: parent.bottom
                                    anchors.bottomMargin: 0
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                                
                                Text {
                                    id: text75
                                    text: qsTr("Clutch LMS Dis.")
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.left: parent.left
                                    anchors.leftMargin: 40
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignLeft
                                    font.weight: Font.DemiBold
                                }
                                
                                Text {
                                    id: clms1
                                    text: qsTr("0")
                                    anchors.verticalCenter: parent.verticalCenter
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignHCenter
                                    font.weight: Font.DemiBold
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                                
                                Text {
                                    id: text77
                                    text: qsTr("0-1")
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.right: parent.right
                                    anchors.rightMargin: 40
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignHCenter
                                    font.weight: Font.DemiBold
                                }
                            }
                            
                            
                            
                            Rectangle {
                                id: rectangle57
                                x: 0
                                width: 1120
                                height: 80
                                color: "#00ffffff"
                                border.width: 0
                                Rectangle {
                                    id: rectangle58
                                    x: -610
                                    y: -115
                                    width: 1120
                                    height: 2
                                    color: "#000000"
                                    anchors.bottom: parent.bottom
                                    anchors.bottomMargin: 0
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                                
                                Text {
                                    id: text78
                                    text: qsTr("Clutch LMS Eng.")
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.left: parent.left
                                    anchors.leftMargin: 40
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignLeft
                                    font.weight: Font.DemiBold
                                }
                                
                                Text {
                                    id: clms2
                                    text: qsTr("0")
                                    anchors.verticalCenter: parent.verticalCenter
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignHCenter
                                    font.weight: Font.DemiBold
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                                
                                Text {
                                    id: text80
                                    text: qsTr("0-1")
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.right: parent.right
                                    anchors.rightMargin: 40
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignHCenter
                                    font.weight: Font.DemiBold
                                }
                            }
                            
                            
                            
                        }
                    }
                    
                    Rectangle {
                        id: engine
                        width: 200
                        height: 200
                        color: "#00ffffff"
                        Column {
                            id: column5
                            x: 0
                            y: 100
                            anchors.fill: parent
                            topPadding: 0
                            spacing: 0
                            padding: 0
                            Rectangle {
                                id: rectangle68
                                x: 0
                                width: 1120
                                height: 80
                                color: "#00ffffff"
                                border.width: 0
                                Rectangle {
                                    id: rectangle69
                                    x: -610
                                    y: -115
                                    width: 1120
                                    height: 4
                                    color: "#000000"
                                    anchors.bottom: parent.bottom
                                    anchors.bottomMargin: 0
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                                
                                Text {
                                    id: text93
                                    text: qsTr("Engine")
                                    anchors.verticalCenter: parent.verticalCenter
                                    font.pixelSize: 70
                                    font.weight: Font.DemiBold
                                    anchors.verticalCenterOffset: -10
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                            }
                            
                            Rectangle {
                                id: rectangle70
                                x: 0
                                width: 1120
                                height: 80
                                color: "#00ffffff"
                                border.width: 0
                                Rectangle {
                                    id: rectangle71
                                    x: -610
                                    y: -115
                                    width: 1120
                                    height: 2
                                    color: "#000000"
                                    anchors.bottom: parent.bottom
                                    anchors.bottomMargin: 0
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                                
                                Text {
                                    id: text94
                                    text: qsTr("Fuel Sensor V")
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.left: parent.left
                                    anchors.leftMargin: 40
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignLeft
                                    font.weight: Font.DemiBold
                                }
                                
                                Text {
                                    id: fuelv
                                    text: qsTr("2.5")
                                    anchors.verticalCenter: parent.verticalCenter
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignHCenter
                                    font.weight: Font.DemiBold
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                                
                                Text {
                                    id: text96
                                    text: qsTr("0-5V")
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.right: parent.right
                                    anchors.rightMargin: 40
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignHCenter
                                    font.weight: Font.DemiBold
                                }
                            }
                            
                            Rectangle {
                                id: rectangle72
                                x: 0
                                width: 1120
                                height: 80
                                color: "#00ffffff"
                                border.width: 0
                                Rectangle {
                                    id: rectangle73
                                    x: -610
                                    y: -115
                                    width: 1120
                                    height: 2
                                    color: "#000000"
                                    anchors.bottom: parent.bottom
                                    anchors.bottomMargin: 0
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                                
                                Text {
                                    id: text97
                                    text: qsTr("Fuel Level")
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.left: parent.left
                                    anchors.leftMargin: 40
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignLeft
                                    font.weight: Font.DemiBold
                                }
                                
                                Text {
                                    id: fuel
                                    text: qsTr("50")
                                    anchors.verticalCenter: parent.verticalCenter
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignHCenter
                                    font.weight: Font.DemiBold
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                                
                                Text {
                                    id: text99
                                    text: qsTr("0-100 %")
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.right: parent.right
                                    anchors.rightMargin: 40
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignHCenter
                                    font.weight: Font.DemiBold
                                }
                            }
                            
                            Rectangle {
                                id: rectangle74
                                x: 0
                                width: 1120
                                height: 80
                                color: "#00ffffff"
                                border.width: 0
                                Rectangle {
                                    id: rectangle75
                                    x: -610
                                    y: -115
                                    width: 1120
                                    height: 2
                                    color: "#000000"
                                    anchors.bottom: parent.bottom
                                    anchors.bottomMargin: 0
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                                
                                Text {
                                    id: text100
                                    text: qsTr("Oil Pres. V")
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.left: parent.left
                                    anchors.leftMargin: 40
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignLeft
                                    font.weight: Font.DemiBold
                                }
                                
                                Text {
                                    id: opresv
                                    text: qsTr("2.5")
                                    anchors.verticalCenter: parent.verticalCenter
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignHCenter
                                    font.weight: Font.DemiBold
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                                
                                Text {
                                    id: text102
                                    text: qsTr("0-5 V")
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.right: parent.right
                                    anchors.rightMargin: 40
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignHCenter
                                    font.weight: Font.DemiBold
                                }
                            }
                            
                            Rectangle {
                                id: rectangle76
                                x: 0
                                width: 1120
                                height: 80
                                color: "#00ffffff"
                                border.width: 0
                                Rectangle {
                                    id: rectangle77
                                    x: -610
                                    y: -115
                                    width: 1120
                                    height: 2
                                    color: "#000000"
                                    anchors.bottom: parent.bottom
                                    anchors.bottomMargin: 0
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                                
                                Text {
                                    id: text103
                                    text: qsTr("Oil Pressure")
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.left: parent.left
                                    anchors.leftMargin: 40
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignLeft
                                    font.weight: Font.DemiBold
                                }
                                
                                Text {
                                    id: opres
                                    text: qsTr("0")
                                    anchors.verticalCenter: parent.verticalCenter
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignHCenter
                                    font.weight: Font.DemiBold
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                                
                                Text {
                                    id: text105
                                    text: qsTr("0-200 PSI")
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.right: parent.right
                                    anchors.rightMargin: 40
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignHCenter
                                    font.weight: Font.DemiBold
                                }
                            }
                            
                            Rectangle {
                                id: rectangle78
                                x: 0
                                width: 1120
                                height: 80
                                color: "#00ffffff"
                                border.width: 0
                                Rectangle {
                                    id: rectangle79
                                    x: -610
                                    y: -115
                                    width: 1120
                                    height: 2
                                    color: "#000000"
                                    anchors.bottom: parent.bottom
                                    anchors.bottomMargin: 0
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                                
                                Text {
                                    id: text106
                                    text: qsTr("RPM Sensor V")
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.left: parent.left
                                    anchors.leftMargin: 40
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignLeft
                                    font.weight: Font.DemiBold
                                }
                                
                                Text {
                                    id: rpmv
                                    text: qsTr("2.5")
                                    anchors.verticalCenter: parent.verticalCenter
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignHCenter
                                    font.weight: Font.DemiBold
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                                
                                Text {
                                    id: text108
                                    text: qsTr("0-5 V")
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.right: parent.right
                                    anchors.rightMargin: 40
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignHCenter
                                    font.weight: Font.DemiBold
                                }
                            }
                            
                            Rectangle {
                                id: rectangle80
                                x: 0
                                width: 1120
                                height: 80
                                color: "#00ffffff"
                                border.width: 0
                                Rectangle {
                                    id: rectangle81
                                    x: -610
                                    y: -115
                                    width: 1120
                                    height: 2
                                    color: "#000000"
                                    anchors.bottom: parent.bottom
                                    anchors.bottomMargin: 0
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                                
                                Text {
                                    id: text109
                                    text: qsTr("RPM")
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.left: parent.left
                                    anchors.leftMargin: 40
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignLeft
                                    font.weight: Font.DemiBold
                                }
                                
                                Text {
                                    id: rpm
                                    text: qsTr("1500")
                                    anchors.verticalCenter: parent.verticalCenter
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignHCenter
                                    font.weight: Font.DemiBold
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                                
                                Text {
                                    id: text111
                                    text: qsTr("0-4000 RPM")
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.right: parent.right
                                    anchors.rightMargin: 40
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignHCenter
                                    font.weight: Font.DemiBold
                                }
                            }
                            
                            Rectangle {
                                id: rectangle82
                                x: 0
                                width: 1120
                                height: 80
                                color: "#00ffffff"
                                border.width: 0
                                Rectangle {
                                    id: rectangle83
                                    x: -610
                                    y: -115
                                    width: 1120
                                    height: 2
                                    color: "#000000"
                                    anchors.bottom: parent.bottom
                                    anchors.bottomMargin: 0
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                                
                                Text {
                                    id: text112
                                    text: qsTr("Throttle LMS")
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.left: parent.left
                                    anchors.leftMargin: 40
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignLeft
                                    font.weight: Font.DemiBold
                                }
                                
                                Text {
                                    id: tlms
                                    text: qsTr("0")
                                    anchors.verticalCenter: parent.verticalCenter
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignHCenter
                                    font.weight: Font.DemiBold
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                                
                                Text {
                                    id: text114
                                    text: qsTr("0-1")
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.right: parent.right
                                    anchors.rightMargin: 40
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignHCenter
                                    font.weight: Font.DemiBold
                                }
                            }
                            
                            Rectangle {
                                id: rectangle86
                                x: 0
                                width: 1120
                                height: 80
                                color: "#00ffffff"
                                border.width: 0
                                Rectangle {
                                    id: rectangle87
                                    x: -610
                                    y: -115
                                    width: 1120
                                    height: 2
                                    color: "#000000"
                                    anchors.bottom: parent.bottom
                                    anchors.bottomMargin: 0
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                                
                                Text {
                                    id: text118
                                    text: qsTr("Throttle Position")
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.left: parent.left
                                    anchors.leftMargin: 40
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignLeft
                                    font.weight: Font.DemiBold
                                }
                                
                                Text {
                                    id: thrpos
                                    text: qsTr("50")
                                    anchors.verticalCenter: parent.verticalCenter
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignHCenter
                                    font.weight: Font.DemiBold
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                                
                                Text {
                                    id: text120
                                    text: qsTr("0-100 %")
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.right: parent.right
                                    anchors.rightMargin: 40
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignHCenter
                                    font.weight: Font.DemiBold
                                }
                            }
                            
                            Rectangle {
                                id: rectangle84
                                x: 0
                                width: 1120
                                height: 80
                                color: "#00ffffff"
                                border.width: 0
                                Rectangle {
                                    id: rectangle85
                                    x: -610
                                    y: -115
                                    width: 1120
                                    height: 2
                                    color: "#000000"
                                    anchors.bottom: parent.bottom
                                    anchors.bottomMargin: 0
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                                
                                Text {
                                    id: text115
                                    text: qsTr("Exhaust Temp")
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.left: parent.left
                                    anchors.leftMargin: 40
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignLeft
                                    font.weight: Font.DemiBold
                                }
                                
                                Text {
                                    id: extemp
                                    text: qsTr("350")
                                    anchors.verticalCenter: parent.verticalCenter
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignHCenter
                                    font.weight: Font.DemiBold
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                                
                                Text {
                                    id: text117
                                    text: qsTr("0-1000 F")
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.right: parent.right
                                    anchors.rightMargin: 40
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignHCenter
                                    font.weight: Font.DemiBold
                                }
                            }
                            
                        }
                    }
                    
                    Rectangle {
                        id: air
                        width: 200
                        height: 200
                        color: "#00ffffff"
                        Column {
                            id: column6
                            x: 0
                            y: 100
                            anchors.fill: parent
                            topPadding: 0
                            spacing: 0
                            padding: 0
                            Rectangle {
                                id: rectangle88
                                x: 0
                                width: 1120
                                height: 80
                                color: "#00ffffff"
                                border.width: 0
                                Rectangle {
                                    id: rectangle89
                                    x: -610
                                    y: -115
                                    width: 1120
                                    height: 4
                                    color: "#000000"
                                    anchors.bottom: parent.bottom
                                    anchors.bottomMargin: 0
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                                
                                Text {
                                    id: text95
                                    text: qsTr("Air")
                                    anchors.verticalCenter: parent.verticalCenter
                                    font.pixelSize: 70
                                    font.weight: Font.DemiBold
                                    anchors.verticalCenterOffset: -10
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                            }
                            
                            Rectangle {
                                id: rectangle90
                                x: 0
                                width: 1120
                                height: 80
                                color: "#00ffffff"
                                border.width: 0
                                Rectangle {
                                    id: rectangle91
                                    x: -610
                                    y: -115
                                    width: 1120
                                    height: 2
                                    color: "#000000"
                                    anchors.bottom: parent.bottom
                                    anchors.bottomMargin: 0
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                                
                                Text {
                                    id: text98
                                    text: qsTr("Tank Pressure V")
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.left: parent.left
                                    anchors.leftMargin: 40
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignLeft
                                    font.weight: Font.DemiBold
                                }
                                
                                Text {
                                    id: tkpresv
                                    text: qsTr("2.5")
                                    anchors.verticalCenter: parent.verticalCenter
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignHCenter
                                    font.weight: Font.DemiBold
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                                
                                Text {
                                    id: text101
                                    text: qsTr("0-5 V")
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.right: parent.right
                                    anchors.rightMargin: 40
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignHCenter
                                    font.weight: Font.DemiBold
                                }
                            }
                            
                            Rectangle {
                                id: rectangle98
                                x: 0
                                width: 1120
                                height: 80
                                color: "#00ffffff"
                                border.width: 0
                                Rectangle {
                                    id: rectangle99
                                    x: -610
                                    y: -115
                                    width: 1120
                                    height: 2
                                    color: "#000000"
                                    anchors.bottom: parent.bottom
                                    anchors.bottomMargin: 0
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                                
                                Text {
                                    id: text104
                                    text: qsTr("Tank Pressure")
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.left: parent.left
                                    anchors.leftMargin: 40
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignLeft
                                    font.weight: Font.DemiBold
                                }
                                
                                Text {
                                    id: tkpres
                                    text: qsTr("50")
                                    anchors.verticalCenter: parent.verticalCenter
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignHCenter
                                    font.weight: Font.DemiBold
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                                
                                Text {
                                    id: text107
                                    text: qsTr("0-200 PSI")
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.right: parent.right
                                    anchors.rightMargin: 40
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignHCenter
                                    font.weight: Font.DemiBold
                                }
                            }
                            
                            Rectangle {
                                id: rectangle100
                                x: 0
                                width: 1120
                                height: 80
                                color: "#00ffffff"
                                border.width: 0
                                Rectangle {
                                    id: rectangle101
                                    x: -610
                                    y: -115
                                    width: 1120
                                    height: 2
                                    color: "#000000"
                                    anchors.bottom: parent.bottom
                                    anchors.bottomMargin: 0
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                                
                                Text {
                                    id: text110
                                    text: qsTr("Shock Pressure V")
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.left: parent.left
                                    anchors.leftMargin: 40
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignLeft
                                    font.weight: Font.DemiBold
                                }
                                
                                Text {
                                    id: shpresv
                                    text: qsTr("2.5")
                                    anchors.verticalCenter: parent.verticalCenter
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignHCenter
                                    font.weight: Font.DemiBold
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                                
                                Text {
                                    id: text113
                                    text: qsTr("0-5 V")
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.right: parent.right
                                    anchors.rightMargin: 40
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignHCenter
                                    font.weight: Font.DemiBold
                                }
                            }
                            
                            Rectangle {
                                id: rectangle102
                                x: 0
                                width: 1120
                                height: 80
                                color: "#00ffffff"
                                border.width: 0
                                Rectangle {
                                    id: rectangle103
                                    x: -610
                                    y: -115
                                    width: 1120
                                    height: 2
                                    color: "#000000"
                                    anchors.bottom: parent.bottom
                                    anchors.bottomMargin: 0
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                                
                                Text {
                                    id: text116
                                    text: qsTr("Shock Pressure")
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.left: parent.left
                                    anchors.leftMargin: 40
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignLeft
                                    font.weight: Font.DemiBold
                                }
                                
                                Text {
                                    id: shpres
                                    text: qsTr("120")
                                    anchors.verticalCenter: parent.verticalCenter
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignHCenter
                                    font.weight: Font.DemiBold
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                                
                                Text {
                                    id: text119
                                    text: qsTr("0-200 PSI")
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.right: parent.right
                                    anchors.rightMargin: 40
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignHCenter
                                    font.weight: Font.DemiBold
                                }
                            }
                            
                            Rectangle {
                                id: rectangle104
                                x: 0
                                width: 1120
                                height: 80
                                color: "#00ffffff"
                                border.width: 0
                                Rectangle {
                                    id: rectangle105
                                    x: -610
                                    y: -115
                                    width: 1120
                                    height: 2
                                    color: "#000000"
                                    anchors.bottom: parent.bottom
                                    anchors.bottomMargin: 0
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                                
                                Text {
                                    id: text121
                                    text: qsTr("Seat Pressure V")
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.left: parent.left
                                    anchors.leftMargin: 40
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignLeft
                                    font.weight: Font.DemiBold
                                }
                                
                                Text {
                                    id: stpresv
                                    text: qsTr("2.5")
                                    anchors.verticalCenter: parent.verticalCenter
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignHCenter
                                    font.weight: Font.DemiBold
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                                
                                Text {
                                    id: text122
                                    text: qsTr("0-5 V")
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.right: parent.right
                                    anchors.rightMargin: 40
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignHCenter
                                    font.weight: Font.DemiBold
                                }
                            }
                            
                            Rectangle {
                                id: rectangle106
                                x: 0
                                width: 1120
                                height: 80
                                color: "#00ffffff"
                                border.width: 0
                                Rectangle {
                                    id: rectangle107
                                    x: -610
                                    y: -115
                                    width: 1120
                                    height: 2
                                    color: "#000000"
                                    anchors.bottom: parent.bottom
                                    anchors.bottomMargin: 0
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                                
                                Text {
                                    id: text123
                                    text: qsTr("Seat Pressure")
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.left: parent.left
                                    anchors.leftMargin: 40
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignLeft
                                    font.weight: Font.DemiBold
                                }
                                
                                Text {
                                    id: stpres
                                    text: qsTr("75")
                                    anchors.verticalCenter: parent.verticalCenter
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignHCenter
                                    font.weight: Font.DemiBold
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                                
                                Text {
                                    id: text124
                                    text: qsTr("0-200 PSI")
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.right: parent.right
                                    anchors.rightMargin: 40
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignHCenter
                                    font.weight: Font.DemiBold
                                }
                            }
                            
                            Rectangle {
                                id: rectangle108
                                x: 0
                                width: 1120
                                height: 80
                                color: "#00ffffff"
                                border.width: 0
                                Rectangle {
                                    id: rectangle109
                                    x: -610
                                    y: -115
                                    width: 1120
                                    height: 2
                                    color: "#000000"
                                    anchors.bottom: parent.bottom
                                    anchors.bottomMargin: 0
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                                
                                Text {
                                    id: text125
                                    text: qsTr("Tire Pressure V")
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.left: parent.left
                                    anchors.leftMargin: 40
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignLeft
                                    font.weight: Font.DemiBold
                                }
                                
                                Text {
                                    id: tipresv
                                    text: qsTr("2.5")
                                    anchors.verticalCenter: parent.verticalCenter
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignHCenter
                                    font.weight: Font.DemiBold
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                                
                                Text {
                                    id: text126
                                    text: qsTr("0-5 V")
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.right: parent.right
                                    anchors.rightMargin: 40
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignHCenter
                                    font.weight: Font.DemiBold
                                }
                            }
                            
                            Rectangle {
                                id: rectangle110
                                x: 0
                                width: 1120
                                height: 80
                                color: "#00ffffff"
                                border.width: 0
                                Rectangle {
                                    id: rectangle111
                                    x: -610
                                    y: -115
                                    width: 1120
                                    height: 2
                                    color: "#000000"
                                    anchors.bottom: parent.bottom
                                    anchors.bottomMargin: 0
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                                
                                Text {
                                    id: text127
                                    text: qsTr("Tire Pressure")
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.left: parent.left
                                    anchors.leftMargin: 40
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignLeft
                                    font.weight: Font.DemiBold
                                }
                                
                                Text {
                                    id: tipres
                                    text: qsTr("10")
                                    anchors.verticalCenter: parent.verticalCenter
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignHCenter
                                    font.weight: Font.DemiBold
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                                
                                Text {
                                    id: text128
                                    text: qsTr("0-200 PSI")
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.right: parent.right
                                    anchors.rightMargin: 40
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignHCenter
                                    font.weight: Font.DemiBold
                                }
                            }
                        }
                    }
                    
                    Rectangle {
                        id: light
                        width: 200
                        height: 200
                        color: "#00ffffff"
                        Column {
                            id: column10
                            x: 0
                            y: 100
                            anchors.fill: parent
                            topPadding: 0
                            spacing: 0
                            padding: 0
                            Rectangle {
                                id: rectangle162
                                x: 0
                                width: 1120
                                height: 80
                                color: "#00ffffff"
                                border.width: 0
                                Rectangle {
                                    id: rectangle163
                                    x: -610
                                    y: -115
                                    width: 1120
                                    height: 4
                                    color: "#000000"
                                    anchors.bottom: parent.bottom
                                    anchors.bottomMargin: 0
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                                
                                Text {
                                    id: text152
                                    text: qsTr("Light")
                                    anchors.verticalCenter: parent.verticalCenter
                                    font.pixelSize: 70
                                    font.weight: Font.DemiBold
                                    anchors.verticalCenterOffset: -10
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                            }
                            
                            Rectangle {
                                id: rectangle164
                                x: 0
                                width: 1120
                                height: 80
                                color: "#00ffffff"
                                border.width: 0
                                Rectangle {
                                    id: rectangle165
                                    x: -610
                                    y: -115
                                    width: 1120
                                    height: 2
                                    color: "#000000"
                                    anchors.bottom: parent.bottom
                                    anchors.bottomMargin: 0
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                                
                                Text {
                                    id: text156
                                    text: qsTr("Brake Switch")
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.left: parent.left
                                    anchors.leftMargin: 40
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignLeft
                                    font.weight: Font.DemiBold
                                }
                                
                                Text {
                                    id: brakeswitch
                                    text: qsTr("0")
                                    anchors.verticalCenter: parent.verticalCenter
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignHCenter
                                    font.weight: Font.DemiBold
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                                
                                Text {
                                    id: text157
                                    text: qsTr("0-1")
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.right: parent.right
                                    anchors.rightMargin: 40
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignHCenter
                                    font.weight: Font.DemiBold
                                }
                            }
                            
                            Rectangle {
                                id: rectangle166
                                x: 0
                                width: 1120
                                height: 80
                                color: "#00ffffff"
                                border.width: 0
                                Rectangle {
                                    id: rectangle167
                                    x: -610
                                    y: -115
                                    width: 1120
                                    height: 2
                                    color: "#000000"
                                    anchors.bottom: parent.bottom
                                    anchors.bottomMargin: 0
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                                
                                Text {
                                    id: text158
                                    text: qsTr("Left Turn Signal")
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.left: parent.left
                                    anchors.leftMargin: 40
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignLeft
                                    font.weight: Font.DemiBold
                                }
                                
                                Text {
                                    id: lturnsig
                                    text: qsTr("0")
                                    anchors.verticalCenter: parent.verticalCenter
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignHCenter
                                    font.weight: Font.DemiBold
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                                
                                Text {
                                    id: text159
                                    text: qsTr("0-200 PSI")
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.right: parent.right
                                    anchors.rightMargin: 40
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignHCenter
                                    font.weight: Font.DemiBold
                                }
                            }
                            
                            Rectangle {
                                id: rectangle168
                                x: 0
                                width: 1120
                                height: 80
                                color: "#00ffffff"
                                border.width: 0
                                Rectangle {
                                    id: rectangle169
                                    x: -610
                                    y: -115
                                    width: 1120
                                    height: 2
                                    color: "#000000"
                                    anchors.bottom: parent.bottom
                                    anchors.bottomMargin: 0
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                                
                                Text {
                                    id: text160
                                    text: qsTr("Right Turn Signal")
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.left: parent.left
                                    anchors.leftMargin: 40
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignLeft
                                    font.weight: Font.DemiBold
                                }
                                
                                Text {
                                    id: rturnsig
                                    text: qsTr("0")
                                    anchors.verticalCenter: parent.verticalCenter
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignHCenter
                                    font.weight: Font.DemiBold
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                                
                                Text {
                                    id: text161
                                    text: qsTr("0")
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.right: parent.right
                                    anchors.rightMargin: 40
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignHCenter
                                    font.weight: Font.DemiBold
                                }
                            }
                        }
                    }
                }
                
            }
            
            Rectangle {
                id: calibration
                width: 200
                height: 200
                visible: true
                color: "#00ffffff"
                
                
                Image {
                    id: image15
                    x: 0
                    y: 0
                    anchors.fill: parent
                    source: "../images/BackroundService.png"
                    fillMode: Image.TileHorizontally
                }
                
                Rectangle {
                    id: rectangle25
                    x: 0
                    y: 0
                    width: 1120
                    height: 100
                    color: "#00ffffff"
                    border.width: 0
                    Text {
                        id: text33
                        text: qsTr("Calibrations")
                        anchors.verticalCenter: parent.verticalCenter
                        font.pixelSize: 50
                        anchors.horizontalCenter: parent.horizontalCenter
                        font.styleName: "Semibold"
                    }
                    
                    Rectangle {
                        id: rectangle26
                        width: 1220
                        height: 7
                        color: "#000000"
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 0
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }
                
                
                PageChangeButton {
                    id: pageChangeButton2
                    x: 925
                    y: 195
                    rotation: -90
                    Connections {
                        target: pageChangeButton2
                        onClicked: if(stackLayout3.currentIndex > 0)
                                   {
                                       stackLayout3.currentIndex = stackLayout3.currentIndex - 1
                                   }
                    }
                }
                
                
                PageChangeButton {
                    id: pageChangeButton3
                    x: 925
                    y: 685
                    rotation: 90
                    Connections {
                        target: pageChangeButton3
                        onClicked: if(stackLayout3.currentIndex < 1)
                                   {
                                       stackLayout3.currentIndex = stackLayout3.currentIndex + 1
                                   }
                    }
                }
                
                StackLayout {
                    id: stackLayout3
                    anchors.fill: parent
                    anchors.rightMargin: 100
                    anchors.topMargin: 100
                    currentIndex: 0
                    
                    Column {
                        id: column7
                        width: 200
                        height: 400
                        
                        Rectangle {
                            id: rectangle44
                            width: 1120
                            height: 80
                            color: "#00ffffff"
                            border.width: 0
                            Rectangle {
                                id: rectangle63
                                x: -610
                                y: -115
                                width: 1120
                                height: 2
                                color: "#000000"
                                anchors.bottom: parent.bottom
                                anchors.bottomMargin: 0
                                anchors.horizontalCenter: parent.horizontalCenter
                            }
                            
                            Text {
                                id: text73
                                text: qsTr("Throttle Max Position Calibration")
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.left: parent.left
                                anchors.leftMargin: 40
                                font.pixelSize: 30
                                horizontalAlignment: Text.AlignLeft
                                font.weight: Font.DemiBold
                            }
                            
                            MouseArea {
                                id: mouseArea6
                                anchors.fill: parent
                                
                                Connections {
                                    target: mouseArea6
                                    onClicked: rectangle13.y = 0
                                }
                                
                                Connections{
                                    target: mouseArea6
                                    onClicked:stackLayout4.currentIndex = 0
                                }
                                
                                Connections{
                                    target: mouseArea6
                                    onClicked:stackLayout5.currentIndex = 0
                                }
                            }
                        }
                        
                        Rectangle {
                            id: rectangle64
                            width: 1120
                            height: 80
                            color: "#00ffffff"
                            border.width: 0
                            Rectangle {
                                id: rectangle65
                                x: -610
                                y: -115
                                width: 1120
                                height: 2
                                color: "#000000"
                                anchors.bottom: parent.bottom
                                anchors.bottomMargin: 0
                                anchors.horizontalCenter: parent.horizontalCenter
                            }
                            
                            Text {
                                id: text76
                                text: qsTr("Transmission Gears Calibration")
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.left: parent.left
                                anchors.leftMargin: 40
                                font.pixelSize: 30
                                horizontalAlignment: Text.AlignLeft
                                font.weight: Font.DemiBold
                            }
                            
                            MouseArea {
                                id: mouseArea7
                                anchors.fill: parent
                            }
                        }
                        
                        Rectangle {
                            id: rectangle66
                            width: 1120
                            height: 80
                            color: "#00ffffff"
                            border.width: 0
                            Rectangle {
                                id: rectangle67
                                x: -610
                                y: -115
                                width: 1120
                                height: 2
                                color: "#000000"
                                anchors.bottom: parent.bottom
                                anchors.bottomMargin: 0
                                anchors.horizontalCenter: parent.horizontalCenter
                            }
                            
                            Text {
                                id: text79
                                text: qsTr("Clutch Pedal Calibration")
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.left: parent.left
                                anchors.leftMargin: 40
                                font.pixelSize: 30
                                horizontalAlignment: Text.AlignLeft
                                font.weight: Font.DemiBold
                            }
                            
                            MouseArea {
                                id: mouseArea8
                                anchors.fill: parent
                            }
                        }
                        
                        Rectangle {
                            id: rectangle112
                            width: 1120
                            height: 80
                            color: "#00ffffff"
                            border.width: 0
                            Rectangle {
                                id: rectangle113
                                x: -610
                                y: -115
                                width: 1120
                                height: 2
                                color: "#000000"
                                anchors.bottom: parent.bottom
                                anchors.bottomMargin: 0
                                anchors.horizontalCenter: parent.horizontalCenter
                            }
                            
                            Text {
                                id: text81
                                text: qsTr("Clutch Calibration")
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.left: parent.left
                                anchors.leftMargin: 40
                                font.pixelSize: 30
                                horizontalAlignment: Text.AlignLeft
                                font.weight: Font.DemiBold
                            }
                            
                            MouseArea {
                                id: mouseArea9
                                anchors.fill: parent
                            }
                        }
                    }
                    
                    Column {
                        id: column8
                        width: 200
                        height: 400
                        Rectangle {
                            id: rectangle114
                            width: 1120
                            height: 80
                            color: "#ffffff"
                            border.width: 0
                            Rectangle {
                                id: rectangle115
                                x: -610
                                y: -115
                                width: 1120
                                height: 2
                                color: "#000000"
                                anchors.bottom: parent.bottom
                                anchors.bottomMargin: 0
                                anchors.horizontalCenter: parent.horizontalCenter
                            }
                            
                            Text {
                                id: text82
                                text: qsTr("FutureExpansoin")
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.left: parent.left
                                anchors.leftMargin: 40
                                font.pixelSize: 30
                                horizontalAlignment: Text.AlignLeft
                                font.weight: Font.DemiBold
                            }
                            
                            MouseArea {
                                id: mouseArea10
                                anchors.fill: parent
                            }
                        }
                    }
                }
                
                Rectangle {
                    id: rectangle13
                    y: 980
                    width: 1220
                    height: 980
                    color: "#00ffffff"
                    anchors.horizontalCenter: parent.horizontalCenter
                    
                    Image {
                        id: image17
                        anchors.fill: parent
                        source: "../images/BackroundService.png"
                        sourceSize.height: 935
                        sourceSize.width: 593
                        fillMode: Image.TileHorizontally
                    }
                    
                    StackLayout {
                        id: stackLayout4
                        anchors.fill: parent
                        
                        Rectangle {
                            id: throttlecal
                            width: 1220
                            height: 100
                            visible: true
                            color: "#00ffffff"
                            anchors.horizontalCenter: parent.horizontalCenter
                            
                            Image {
                                id: image18
                                x: 0
                                y: 0
                                anchors.fill: parent
                                source: "../images/BackroundService.png"
                                sourceSize.width: 593
                                sourceSize.height: 935
                                fillMode: Image.TileHorizontally
                            }
                            
                            StackLayout {
                                id: stackLayout5
                                anchors.fill: parent
                                currentIndex: 1
                                
                                Rectangle {
                                    id: rectangle14
                                    width: 200
                                    height: 200
                                    color: "#00ffffff"
                                    
                                    Rectangle {
                                        id: rectangle16
                                        x: 0
                                        y: 0
                                        width: 1220
                                        height: 100
                                        color: "#00ffffff"
                                        anchors.top: parent.top
                                        anchors.topMargin: 0
                                        anchors.horizontalCenter: parent.horizontalCenter
                                        
                                        Rectangle {
                                            id: rectangle15
                                            x: 0
                                            y: 95
                                            width: 1220
                                            height: 5
                                            color: "#000000"
                                            anchors.bottom: parent.bottom
                                            anchors.bottomMargin: 0
                                            anchors.horizontalCenter: parent.horizontalCenter
                                        }
                                        
                                        Text {
                                            id: text35
                                            y: -424
                                            text: qsTr("Throttle Max Position Calibration")
                                            anchors.verticalCenter: parent.verticalCenter
                                            anchors.left: parent.left
                                            anchors.leftMargin: 50
                                            font.pixelSize: 50
                                            font.styleName: "Semibold"
                                        }
                                        
                                        CloseButton {
                                            id: closeButton
                                            x: 1020
                                            anchors.verticalCenter: parent.verticalCenter
                                            anchors.right: parent.right
                                            anchors.rightMargin: 30
                                            
                                            Connections{
                                                target:closeButton
                                                onClicked: rectangle13.y = 980
                                            }
                                        }
                                    }
                                    
                                    Rectangle {
                                        id: rectangle17
                                        x: 0
                                        y: 100
                                        width: 1220
                                        height: 60
                                        color: "#00ffffff"
                                        anchors.top: parent.top
                                        anchors.topMargin: 100
                                        Rectangle {
                                            id: rectangle18
                                            x: 0
                                            y: 95
                                            width: 1220
                                            height: 3
                                            color: "#000000"
                                            anchors.bottom: parent.bottom
                                            anchors.bottomMargin: 0
                                            anchors.horizontalCenter: parent.horizontalCenter
                                        }
                                        
                                        Text {
                                            id: text36
                                            y: -424
                                            text: qsTr("Calibration Process")
                                            anchors.verticalCenter: parent.verticalCenter
                                            font.pixelSize: 30
                                            anchors.horizontalCenterOffset: -250
                                            anchors.horizontalCenter: parent.horizontalCenter
                                            font.styleName: "Semibold"
                                        }
                                        
                                        Text {
                                            id: text37
                                            y: -424
                                            text: qsTr("Details")
                                            anchors.verticalCenter: parent.verticalCenter
                                            font.pixelSize: 30
                                            anchors.horizontalCenterOffset: 350
                                            anchors.horizontalCenter: parent.horizontalCenter
                                            font.styleName: "Semibold"
                                        }
                                        anchors.horizontalCenter: parent.horizontalCenter
                                    }
                                    
                                    Rectangle {
                                        id: rectangle27
                                        x: 879
                                        y: 11
                                        width: 3
                                        height: 880
                                        color: "#0b0b0b"
                                        anchors.right: parent.right
                                        anchors.bottom: parent.bottom
                                        anchors.rightMargin: 500
                                        anchors.bottomMargin: 0
                                    }
                                    
                                    TextEdit {
                                        id: textEdit
                                        width: 700
                                        height: 800
                                        text: qsTr("This calibration will set the max throttle position\n\nThis calibration may be needed if engine is\nnot reaching rated engine speed")
                                        anchors.left: parent.left
                                        anchors.top: parent.top
                                        anchors.leftMargin: 20
                                        anchors.topMargin: 160
                                        font.pixelSize: 30
                                        horizontalAlignment: Text.AlignLeft
                                        wrapMode: Text.WordWrap
                                        
                                        Rectangle {
                                            id: rectangle28
                                            y: 580
                                            width: 300
                                            height: 100
                                            color: "#8c8c8c"
                                            radius: 15
                                            border.color: "#0b0b0b"
                                            anchors.bottom: parent.bottom
                                            anchors.bottomMargin: 50
                                            anchors.horizontalCenter: parent.horizontalCenter
                                            
                                            Text {
                                                id: text12
                                                text: qsTr("Start Calibration")
                                                anchors.fill: parent
                                                font.pixelSize: 30
                                                horizontalAlignment: Text.AlignHCenter
                                                verticalAlignment: Text.AlignVCenter
                                                font.weight: Font.DemiBold
                                            }
                                            
                                            MouseArea {
                                                id: mouseArea11
                                                anchors.fill: parent
                                            }
                                            
                                            Connections{
                                                target: mouseArea11
                                                onClicked:stackLayout5.currentIndex = 1
                                            }
                                            
                                            Connections {
                                                target: mouseArea11
                                                onClicked:backend.startCalibrationButtonPressed(1)
                                            }
                                        }
                                    }
                                    
                                    TextEdit {
                                        id: textEdit1
                                        x: 895
                                        width: 480
                                        height: 800
                                        text: qsTr("Perform as needed\n\nTakes 2 minutes\n\nIt is reccomended that engine is OFF\n\nMay require 2 people\n\nTRACTOR MUST BE IN NEUTRAL")
                                        anchors.right: parent.right
                                        anchors.top: parent.top
                                        anchors.rightMargin: 0
                                        anchors.topMargin: 160
                                        font.pixelSize: 30
                                    }
                                }
                                
                                Rectangle {
                                    id: rectangle29
                                    width: 200
                                    height: 200
                                    color: "#00ffffff"
                                    
                                    Rectangle {
                                        id: rectangle116
                                        x: 0
                                        y: 0
                                        width: 1220
                                        height: 100
                                        color: "#00ffffff"
                                        anchors.top: parent.top
                                        anchors.topMargin: 0
                                        Rectangle {
                                            id: rectangle117
                                            x: 0
                                            y: 95
                                            width: 1220
                                            height: 5
                                            color: "#000000"
                                            anchors.bottom: parent.bottom
                                            anchors.bottomMargin: 0
                                            anchors.horizontalCenter: parent.horizontalCenter
                                        }
                                        
                                        Text {
                                            id: text38
                                            y: -424
                                            text: qsTr("Throttle Max Position Calibration")
                                            anchors.verticalCenter: parent.verticalCenter
                                            anchors.left: parent.left
                                            anchors.leftMargin: 50
                                            font.pixelSize: 50
                                            font.styleName: "Semibold"
                                        }
                                        anchors.horizontalCenter: parent.horizontalCenter
                                    }
                                    
                                    Rectangle {
                                        id: rectangle118
                                        x: 0
                                        y: 100
                                        width: 1220
                                        height: 60
                                        color: "#00ffffff"
                                        anchors.top: parent.top
                                        anchors.topMargin: 100
                                        Rectangle {
                                            id: rectangle119
                                            x: 0
                                            y: 95
                                            width: 1220
                                            height: 3
                                            color: "#000000"
                                            anchors.bottom: parent.bottom
                                            anchors.bottomMargin: 0
                                            anchors.horizontalCenter: parent.horizontalCenter
                                        }
                                        
                                        Text {
                                            id: text39
                                            y: -424
                                            text: qsTr("Controls")
                                            anchors.verticalCenter: parent.verticalCenter
                                            font.pixelSize: 30
                                            font.styleName: "Semibold"
                                            anchors.horizontalCenterOffset: -250
                                            anchors.horizontalCenter: parent.horizontalCenter
                                        }
                                        
                                        Text {
                                            id: text40
                                            y: -424
                                            text: qsTr("Instructions")
                                            anchors.verticalCenter: parent.verticalCenter
                                            font.pixelSize: 30
                                            font.styleName: "Semibold"
                                            anchors.horizontalCenterOffset: 350
                                            anchors.horizontalCenter: parent.horizontalCenter
                                        }
                                        anchors.horizontalCenter: parent.horizontalCenter
                                    }
                                    
                                    Rectangle {
                                        id: rectangle120
                                        x: 717
                                        y: 100
                                        width: 3
                                        height: 880
                                        color: "#0b0b0b"
                                        anchors.right: parent.right
                                        anchors.bottom: parent.bottom
                                        anchors.rightMargin: 500
                                        anchors.bottomMargin: 0
                                    }
                                    
                                    TextEdit {
                                        id: textEdit3
                                        x: 895
                                        width: 480
                                        height: 800
                                        text: qsTr("Use the increase and decrease\nbuttons to move throttle until at \nmax position\n\nHit set max to end calibration")
                                        anchors.right: parent.right
                                        anchors.top: parent.top
                                        anchors.rightMargin: 0
                                        anchors.topMargin: 160
                                        font.pixelSize: 30
                                    }
                                    
                                    Rectangle {
                                        id: rectangle121
                                        x: 220
                                        y: 810
                                        width: 300
                                        height: 100
                                        color: "#8c8c8c"
                                        radius: 15
                                        border.color: "#0b0b0b"
                                        anchors.bottom: parent.bottom
                                        anchors.bottomMargin: 50
                                        anchors.horizontalCenterOffset: -250
                                        Text {
                                            id: text21
                                            text: qsTr("Set Max")
                                            anchors.fill: parent
                                            font.pixelSize: 30
                                            horizontalAlignment: Text.AlignHCenter
                                            verticalAlignment: Text.AlignVCenter
                                            font.weight: Font.DemiBold
                                        }
                                        
                                        MouseArea {
                                            id: mouseArea12
                                            x: -210
                                            y: -830
                                            anchors.fill: parent
                                            
                                            Connections {
                                                target: mouseArea12
                                                onClicked: stackLayout5.currentIndex = 0
                                            }
                                            
                                            Connections {
                                                target: mouseArea12
                                                onClicked:backend.setMaxButtonPressed(1)
                                            }
                                        }
                                        
                                        anchors.horizontalCenter: parent.horizontalCenter
                                    }
                                    
                                    IncreaseButton {
                                        id: increaseButton4
                                        x: 217
                                        y: 470
                                        
                                        Connections {
                                            target: increaseButton4
                                            onPressed:backend.increaseButton4Pressed(1)
                                        }
                                        
                                        Connections {
                                            target: increaseButton4
                                            onReleased:backend.increaseButton4Released(1)
                                        }
                                        
                                    }
                                    
                                    DecreaseButton {
                                        id: decreaseButton4
                                        x: 412
                                        y: 470
                                        
                                        Connections {
                                            target: decreaseButton4
                                            onPressed:backend.decreaseButton4Pressed(1)
                                        }
                                        
                                        Connections {
                                            target: decreaseButton4
                                            onReleased:backend.decreaseButton4Released(1)
                                        }
                                    }
                                }
                            }
                            
                            
                            
                        }
                        
                    }
                    
                }
                
            }
            
            Rectangle {
                id: manual
                width: 200
                height: 200
                visible: true
                color: "#ffffff"
                
                Text {
                    id: text27
                    text: qsTr("Extra")
                    font.pixelSize: 120
                }
            }
        }
        
        Rectangle {
            id: rectangle12
            width: 300
            height: 983
            color: "#494949"
            border.width: 3
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 200
            anchors.verticalCenterOffset: -1
            
            ServiceBar {
                id: serviceBar
                anchors.verticalCenter: parent.verticalCenter
                buttonAnimationCurrentFrame: 0
                anchors.horizontalCenter: parent.horizontalCenter
            }
            
            Column {
                id: column2
                anchors.fill: parent
                padding: 10
                spacing: 10
                
                MouseArea {
                    id: mouseArea
                    width: 280
                    height: 152
                    
                    Connections {
                        target: mouseArea
                        onClicked: stackLayout1.currentIndex = 0
                    }
                    
                    Connections {
                        target: mouseArea
                        onClicked: serviceBar.buttonAnimationCurrentFrame = 0
                    }
                }
                
                MouseArea {
                    id: mouseArea1
                    width: 280
                    height: 152
                    
                    Connections {
                        target: mouseArea1
                        onClicked: stackLayout1.currentIndex = 1
                    }
                    
                    Connections {
                        target: mouseArea1
                        onClicked: serviceBar.buttonAnimationCurrentFrame = 1
                    }
                }
                
                MouseArea {
                    id: mouseArea2
                    width: 280
                    height: 152
                    
                    Connections {
                        target: mouseArea2
                        onClicked: stackLayout1.currentIndex = 2
                    }
                    
                    Connections {
                        target: mouseArea2
                        onClicked: serviceBar.buttonAnimationCurrentFrame = 2
                    }
                }
                
                MouseArea {
                    id: mouseArea3
                    width: 280
                    height: 152
                    Connections {
                        target: mouseArea3
                        onClicked: stackLayout1.currentIndex = 3
                    }
                    
                    Connections {
                        target: mouseArea3
                        onClicked: serviceBar.buttonAnimationCurrentFrame = 3
                    }
                }
                
                MouseArea {
                    id: mouseArea4
                    width: 280
                    height: 152
                    Connections {
                        target: mouseArea4
                        onClicked: stackLayout1.currentIndex = 4
                    }
                    
                    Connections {
                        target: mouseArea4
                        onClicked: serviceBar.buttonAnimationCurrentFrame = 4
                    }
                }
                
                MouseArea {
                    id: mouseArea5
                    width: 280
                    height: 152
                    Connections {
                        target: mouseArea5
                        onClicked: stackLayout1.currentIndex = 5
                    }
                    
                    Connections {
                        target: mouseArea5
                        onClicked: serviceBar.buttonAnimationCurrentFrame = 5
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
