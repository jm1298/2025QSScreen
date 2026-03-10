import QtQuick
import QtQuick.Window
import QtQuick.Controls 6.5
import "controls"
import QtQuick.Layouts 6.5
import "Icons"
import "Buttons"

Window {
    id: window
    width: 1920
    height: 1080
    visible: true
    title: qsTr("Hello World")
    visibility: "FullScreen"

    Rectangle {
        id: rectangle
        width: 1920
        height: 100
        color: "#387bd7"
        border.width: 3
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.horizontalCenter: parent.horizontalCenter

        Text {
            id: temperature
            width: 127
            height: 100
            color: "#ffffff"
            text: "- - F"
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 1593
            font.pixelSize: 50
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.verticalCenterOffset: 0
            font.weight: Font.DemiBold

            Component.onCompleted: {
                backend.updateIntakeTemp.connect((intakeTempValue) => {
                    temperature.text = intakeTempValue;
                });
            }

        }

        Text {
            id: dateReadout
            width: 350
            height: 100
            color: "#ffffff"
            text: "4/20/1969"
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 20
            font.pixelSize: 50
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            anchors.verticalCenterOffset: 0
            font.weight: Font.DemiBold

            Component.onCompleted: {
                backend.updateDate.connect((dateValue) => {
                    dateReadout.text = dateValue;
                });
            }
        }






        Rectangle {
            width: 200
            height: 100
            x: 1721
            color: "#387bd7"
            border.width: 3
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.horizontalCenterOffset: 860
            anchors.horizontalCenter: parent.horizontalCenter

            Text {
                id: clock1
                x: 1
                width: 199
                height: 100
                color: "#ffffff"
                text: "- - : - -"
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 0
                font.pixelSize: 50
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.verticalCenterOffset: 0
                font.weight: Font.DemiBold

                Component.onCompleted: {
                    backend.updateTime.connect((timeValue) => {
                        clock1.text = timeValue;
                    });
                }

            }
        }


        Image {
            id: jtcText
            //x: 816
            //y: 4
            anchors.fill: parent
            anchors.topMargin: 8
            anchors.bottomMargin: 8
            anchors.rightMargin: 200
            source: "../images/jtc_svg.svg"
            fillMode: Image.PreserveAspectFit
        }


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

                /*Connections {
                    target: lightButton
                    onClicked: regularPolygonItem.anchors.rightMargin = 0
                }*/
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

                /*Connections {
                    target: enginePageButton
                    onClicked: regularPolygonItem.anchors.rightMargin = 0
                }*/

            }

            DrivetrainButton {
                id: drivetrainButton
                hoverEnabled: false

                Connections {
                    target: drivetrainButton
                    onClicked: screens.currentIndex = 3
                }

                Connections {
                    target: drivetrainButton
                    onClicked: rectangle2.visible = true
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

                /*Connections {
                    target: settingsButton
                    onClicked: regularPolygonItem.anchors.rightMargin = 0
                }*/

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

                /*Connections {
                    target: homeButton
                    onClicked: regularPolygonItem.anchors.rightMargin = 200
                }*/
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








}
