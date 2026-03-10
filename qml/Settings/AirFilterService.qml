import QtQuick 6.5
import QtQuick.Timeline 1.0
import QtQuick.Layouts

//import "images"

Rectangle {
    id: mainRectangle
    width: 1217
    height: 976

    //property alias stackIndex: stacklayoutengoil.currentIndex       //for main to comm. with child

    signal requestStackChange(int newIndex)                         //for child to comm. with main


    Image {
        id: oilBackground
        x: 0
        y: 0
        source: "../../images/oilBackground.png"
        width: parent.width
        height: parent.height
    }

    StackLayout {
        id: stacklayoutengoil
        width: parent.width
        height: parent.height
        currentIndex: 0         //REOMVE CURRENTINDEX TO MAKE RESETTING FROM MAIN.QML WORK!!!!!!

        Rectangle {
            id: page0
            width: parent.width
            height: parent.height
            color: "#00ffffff"
            border.width: 0

            Text {
                id: title
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 10
                anchors.topMargin: 10

                text: "Hydraulic Oil Change"

                font.pixelSize: 45

                horizontalAlignment: Text.AlignLeft
                font.weight: Font.DemiBold
            }

            Rectangle {
                id: headerLine
                width: stacklayoutengoil.width
                height: 8
                anchors.top: title.bottom
                anchors.topMargin: 8
                color: "#000000"
            }



            Text {
                id: subtitle1
                width: 108
                height: 41
                anchors.left: title.left
                anchors.top: headerLine.top
                anchors.topMargin: 15

                text: "Details"
                font.pixelSize: 30
                horizontalAlignment: Text.AlignLeft
                font.bold: true
                font.weight: Font.DemiBold

                Rectangle {
                    id: detailsLine
                    x: -10
                    y: 50
                    width: 700
                    height: 4
                    color: "#000000"

                    Rectangle {
                        id: verticalRect
                        x: parent.width
                        y: -60
                        width: 4
                        height: 899
                        //height: 400
                        color: "#000000"


                    }

                    Rectangle {
                        id: infoLine
                        x: parent.width
                        y: 0
                        width: 520
                        height: 4
                        color: "#000000"


                        Text {
                            id: subtitle2
                            width: 259
                            height: 41
                            x: 10
                            y: -50
                            text: "Needed Supplies"
                            font.pixelSize: 30
                            horizontalAlignment: Text.AlignLeft
                            font.bold: true
                            font.weight: Font.DemiBold
                        }
                    }
                }
            }

            Text {
                id: detailstext
                x: 8
                y: 146
                width: 684
                height: 830
                text: "The recommended hydraulic oil change interval is once every 800 engine hours or once per year.

The hydraulic oil filter should be replaced every time the oil is changed.

JTC Engineers recommend JTC HydraLube Hydraulic Oil for long-lasting, reliable performance."
                font.pixelSize: 30
                horizontalAlignment: Text.AlignLeft
                wrapMode: Text.WordWrap
                font.bold: false
                font.weight: Font.Normal
            }

            Image {
                id: jackoffOil
                x: 723
                y: 377
                width: 388
                height: 388
                source: "../../images/jackoff hydoil.png"
                fillMode: Image.PreserveAspectFit
            }

            CloseButtonSettigns {
                id: closeButtonSettings
                anchors.left: parent.left
                anchors.leftMargin: 200
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 100

                Connections {
                    target: closeButtonSettings
                    onClicked: mainRectangle.requestStackChange(1)      //switch back to maintenance overview in main
                }
            }
            NextButtonSettings {
                id: nextButtonSettings
                anchors.right: parent.right
                anchors.rightMargin: 200
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 100

                Connections {
                    target:  nextButtonSettings
                    onClicked: stacklayoutengoil.currentIndex = 1
                }
            }


            Text {
                id: detailstext0
                x: 710
                y: 151
                width: 499
                height: 830
                text: "1. 4 gal. JTC HydraLube Hydraulic Oil
2. Oil Filter (Part No. JTC102HD7)
3. 1/8 inch allen key
4. Floor jack & jackstand
5. Drain Pan
6. Rags"
                font.pixelSize: 30
                horizontalAlignment: Text.AlignLeft
                wrapMode: Text.WordWrap
                font.bold: false
                font.weight: Font.Normal
            }
        }

        /*#############################################################*/
        //Page 1

        Rectangle {
            id: page1
            width: parent.width
            height: parent.height
            color: "#00ffffff"

            Text {
                id: title13
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 10
                anchors.topMargin: 10

                text: "Engine Oil Change (Step 1 of 3)"

                font.pixelSize: 45

                horizontalAlignment: Text.AlignLeft
                font.weight: Font.DemiBold


            }

            Rectangle {
                id: headerLine1
                width: stacklayoutengoil.width
                height: 8
                anchors.top: title13.bottom
                anchors.topMargin: 8
                color: "#000000"
            }

            Text {
                id: subtitle11
                width: 108
                height: 41
                anchors.left: title13.left
                anchors.top: headerLine1.top
                anchors.topMargin: 15

                text: "Instructions"
                font.pixelSize: 30
                horizontalAlignment: Text.AlignLeft
                font.bold: true
                font.weight: Font.DemiBold

                Rectangle {
                    id: detailsLine1
                    x: -10
                    y: 50
                    width: 700
                    height: 4
                    color: "#000000"

                    Rectangle {
                        id: verticalRect1
                        x: parent.width
                        y: -60
                        width: 4
                        height: 899
                        //height: 400
                        color: "#000000"


                    }

                    Rectangle {
                        id: infoLine1
                        x: parent.width
                        y: 0
                        width: 520
                        height: 4
                        color: "#000000"


                        Text {
                            id: subtitle21
                            width: 259
                            height: 41
                            x: 10
                            y: -50
                            text: "Needed Supplies"
                            font.pixelSize: 30
                            horizontalAlignment: Text.AlignLeft
                            font.bold: true
                            font.weight: Font.DemiBold
                        }
                    }
                }
            }


            Text {
                id: maintext1
                x: 8
                y: 146
                width: 684
                height: 830
                text: "1. Park the tractor in a safe, well ventialted location. Chock the rear wheels.

2. Using a floor jack, raise the front end of the tractor. Place a jack stand when done.

3. Remove reservoir drain plug. Allow oil to drain completely.

4. Replace drain plug."
                font.pixelSize: 30
                horizontalAlignment: Text.AlignLeft
                wrapMode: Text.WordWrap
                font.bold: false
                font.weight: Font.Normal
            }

            Text {
                id: detailstext1
                x: 710
                y: 151
                width: 499
                height: 830
                text: "1. 4 gal. JTC HydraLube Hydraulic Oil
2. Oil Filter (Part No. JTC102HD7)
3. 1/8 inch allen key
4. Floor jack & jackstand
5. Drain Pan
6. Rags"
                font.pixelSize: 30
                horizontalAlignment: Text.AlignLeft
                wrapMode: Text.WordWrap
                font.bold: false
                font.weight: Font.Normal
            }

            Image {
                id: jackoffOil1
                x: 723
                y: 377
                width: 388
                height: 388
                source: "../../images/jackoff hydoil.png"
                fillMode: Image.PreserveAspectFit
            }


            CloseButtonSettigns {
                id: closeButtonSettings1
                anchors.left: parent.left
                anchors.leftMargin: 200
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 100

                Connections {
                    target:  closeButtonSettings1
                    onClicked: stacklayoutengoil.currentIndex = 0
                }
            }

            NextButtonSettings {
                id: nextButtonSettings1
                anchors.right: parent.right
                anchors.rightMargin: 200
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 100

                Connections {
                    target:  nextButtonSettings1
                    onClicked: stacklayoutengoil.currentIndex = 2
                }
            }
        }

        /*#############################################################*/
        //Page 2
        Rectangle {
            id: page2
            width: parent.width
            height: parent.height
            color: "#00ffffff"

            Text {
                id: title2
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 10
                anchors.topMargin: 10

                text: "Engine Oil Change (Step 2 of 3)"

                font.pixelSize: 45

                horizontalAlignment: Text.AlignLeft
                font.weight: Font.DemiBold
            }

            Rectangle {
                id: headerLine2
                width: stacklayoutengoil.width
                height: 8
                anchors.top: title2.bottom      //need to chagnge this for each page
                anchors.topMargin: 8
                color: "#000000"
            }

            Text {
                id: subtitle12
                width: 108
                height: 41
                anchors.left: title2.left       //change this one too
                anchors.top: headerLine2.top    //and this!
                anchors.topMargin: 15

                text: "Instructions"
                font.pixelSize: 30
                horizontalAlignment: Text.AlignLeft
                font.bold: true
                font.weight: Font.DemiBold

                Rectangle {
                    id: detailsLine2
                    x: -10
                    y: 50
                    width: 700
                    height: 4
                    color: "#000000"

                    Rectangle {
                        id: verticalRect2
                        x: parent.width
                        y: -60
                        width: 4
                        height: 899
                        //height: 400
                        color: "#000000"


                    }

                    Rectangle {
                        id: infoLine2
                        x: parent.width
                        y: 0
                        width: 520
                        height: 4
                        color: "#000000"


                        Text {
                            id: subtitle22
                            width: 259
                            height: 41
                            x: 10
                            y: -50
                            text: "Diagram"
                            font.pixelSize: 30
                            horizontalAlignment: Text.AlignLeft
                            font.bold: true
                            font.weight: Font.DemiBold
                        }
                    }
                }
            }


            Text {
                id: maintext2
                x: 8
                y: 146
                width: 684
                height: 830
                text: "Note: Oil filter housing and fill cap are on right side of tractor.

5. Use a crecent wrench to unscrew the oil filter housing cap.

6. Remove and replace oil filter.

7. Reinstall oil filter housing cap. Do not overtighten."
                font.pixelSize: 30
                horizontalAlignment: Text.AlignLeft
                wrapMode: Text.WordWrap
                font.bold: false
                font.weight: Font.Normal
            }

            Text {
                id: detailstext2
                x: 710
                y: 151
                width: 499
                height: 830
                text: "Drain plug:







Oil filter: "
                font.pixelSize: 30
                horizontalAlignment: Text.AlignLeft
                wrapMode: Text.WordWrap
                font.bold: false
                font.weight: Font.Normal
            }

            Image {
                id: oilPlugNew
                x: 710
                y: 197
                width: 499
                height: 268
                source: "../../images/oilPlugNew.jpg"
                fillMode: Image.PreserveAspectFit
            }

            Image {
                id: oilFilterNew
                x: 710
                y: 513
                width: 499
                height: 268
                source: "../../images/oilFilterNew.jpg"
                fillMode: Image.PreserveAspectFit
            }

            CloseButtonSettigns {
                id: closeButtonSettigns2
                anchors.left: parent.left
                anchors.leftMargin: 200
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 100

                Connections {
                    target:  closeButtonSettings2
                    onClicked: stacklayoutengoil.currentIndex = 1
                }
            }

            NextButtonSettings {
                id: nextButtonSettings2
                anchors.right: parent.right
                anchors.rightMargin: 200
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 100

                Connections {
                    target:  nextButtonSettings2
                    onClicked: stacklayoutengoil.currentIndex = 3
                }
            }
        }

        /*#############################################################*/
        //Page 3
        Rectangle {
            id: page3
            width: parent.width
            height: parent.height
            color: "#00ffffff"

            Text {
                id: title3
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 10
                anchors.topMargin: 10

                text: "Engine Oil Change (Step 3 of 3)"

                font.pixelSize: 45

                horizontalAlignment: Text.AlignLeft
                font.weight: Font.DemiBold
            }

            Rectangle {
                id: headerLine3
                width: stacklayoutengoil.width
                height: 8
                anchors.top: title3.bottom      //need to chagnge this for each page
                anchors.topMargin: 8
                color: "#000000"
            }

            Text {
                id: subtitle13
                width: 108
                height: 41
                anchors.left: title3.left       //change this one too
                anchors.top: headerLine3.top    //and this!
                anchors.topMargin: 15

                text: "Instructions"
                font.pixelSize: 30
                horizontalAlignment: Text.AlignLeft
                font.bold: true
                font.weight: Font.DemiBold

                Rectangle {
                    id: detailsLine3
                    x: -10
                    y: 50
                    width: 700
                    height: 4
                    color: "#000000"

                    Rectangle {
                        id: verticalRect3
                        x: parent.width
                        y: -60
                        width: 4
                        height: 899
                        //height: 400
                        color: "#000000"


                    }

                    Rectangle {
                        id: infoLine3
                        x: parent.width
                        y: 0
                        width: 520
                        height: 4
                        color: "#000000"


                        Text {
                            id: subtitle23
                            width: 259
                            height: 41
                            x: 10
                            y: -50
                            text: "Note"
                            font.pixelSize: 30
                            horizontalAlignment: Text.AlignLeft
                            font.bold: true
                            font.weight: Font.DemiBold
                        }
                    }
                }
            }


            Text {
                id: maintext3
                x: 8
                y: 146
                width: 684
                height: 830
                text: "8. Remove oil fill cap.

9. Pour 4 gallons JTC HydraLube Hydraulic Oil.

10. Replace oil fill cap.

11. Start and run tractor. Drive forward and backward for 5 minutes.

12. Check reservoir sight gauge to ensure proper fluid level."
                font.pixelSize: 30
                horizontalAlignment: Text.AlignLeft
                wrapMode: Text.WordWrap
                font.bold: false
                font.weight: Font.Normal
            }

            Text {
                id: detailstext3
                x: 710
                y: 151
                width: 499
                height: 830
                text: "The oil fill cap/dipstick is located on the left side of the engine."
                font.pixelSize: 30
                horizontalAlignment: Text.AlignLeft
                wrapMode: Text.WordWrap
                font.bold: false
                font.weight: Font.Normal
            }

            Image {
                id: oilCap
                x: 710
                y: 231
                width: 499
                height: 395
                source: "../../images/oilCap.jpg"
                fillMode: Image.PreserveAspectFit
            }



            CloseButtonSettigns {
                id: closeButtonSettigns3
                anchors.left: parent.left
                anchors.leftMargin: 200
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 100

                Connections {
                    target:  closeButtonSettings3
                    onClicked: stacklayoutengoil.currentIndex = 2
                }
            }

            NextButtonSettings {
                id: nextButtonSettings3
                anchors.right: parent.right
                anchors.rightMargin: 200
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 100

                Connections {
                    target:  nextButtonSettings3
                    onClicked: {
                        stacklayoutengoil.currentIndex = 0
                        mainRectangle.requestStackChange(1)      //switch back to maintenance overview in mai
                    }
                }
            }
        }
    }




}


