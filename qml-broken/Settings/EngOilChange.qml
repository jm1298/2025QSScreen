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
        width: 1217
        height: 976
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

                text: "Engine Oil Change"

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
                text: "The recommended oil change interval is once every 100 engine hours.

The oil filter should be replaced every time the oil is changed.

JTC Engineers recommend JTC-Brand Engine Oil for long-lasting, reliable performance."
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
                source: "../../images/jackoff oil.png"
                fillMode: Image.PreserveAspectFit
            }

            CloseButtonSettigns {
                x: 200
                y: 796
                width: 200
                height: 80
                id: closeButtonSettings
                //anchors.left: parent.left
                //anchors.leftMargin: 200
                //anchors.bottom: parent.bottom
                //anchors.bottomMargin: 100

                Connections {
                    target: closeButtonSettings
                    onClicked: mainRectangle.requestStackChange(0)      //switch back to maintenance overview in main
                }
            }
            NextButtonSettings {
                id: nextButtonSettings
                x: 817
                y: 796
                width: 200
                height: 80
                //anchors.right: parent.right
                //anchors.rightMargin: 200
                //anchors.bottom: parent.bottom
                //anchors.bottomMargin: 100

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
                text: "1. 2.5 Quarts JTC 10W-30 Motor Oil
2. Oil Filter (Part No. JTC102C06)
3. Filter Wrench
4. Drain Pan
5. Rags"
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
                text: "1. Park the tractor in a safe, well ventialted location.

2. Start and run the engine for 10 minutes or until the temperature gauge reads in the middle of its range.

3. Turn the engine off and remove key.

4. Gather listed supplies."
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
                text: "1. 2.5 Quarts JTC 10W-30 Motor Oil
2. Oil Filter (Part No. JTC102C06)
3. Filter Wrench
4. Drain Pan
5. Rags"
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
                source: "../../images/jackoff oil.png"
                fillMode: Image.PreserveAspectFit
            }


            CloseButtonSettigns {
                id: closeButtonSettings1
                x: 200
                y: 796
                width: 200
                height: 80

                Connections {
                    target:  closeButtonSettings1
                    onClicked: stacklayoutengoil.currentIndex = 0
                }
            }

            NextButtonSettings {
                id: nextButtonSettings1
                x: 817
                y: 796
                width: 200
                height: 80

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
                text: "Note: Filter and drain plug are on the left side of the engine.

4. Remove Oil Reservoir Drain Plug.
5. Allow oil to drain completely.
6. Replace drain plug.

7. Remove oil filter.

8. Using fresh oil, lubricate seal on new filter.
9. Install new filter. After filter is snug, tighten an additional 3/4 turn."
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
                x: 200
                y: 796
                width: 200
                height: 80

                Connections {
                    target:  closeButtonSettings2
                    onClicked: stacklayoutengoil.currentIndex = 1
                }
            }

            NextButtonSettings {
                id: nextButtonSettings2
                x: 817
                y: 796
                width: 200
                height: 80

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
                text: "10. Remove oil fill cap/dipstick

11. Pour 2.5 Quarts JTC-brand 10W-30 Motor Oil

12. Replace fill cap/dipstick

13. Clean up any spills.

13. Start and run engine for 1 minute.

14. Check engine oil to confirm proper oil level."
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
                x: 200
                y: 796
                width: 200
                height: 80

                Connections {
                    target:  closeButtonSettings3
                    onClicked: stacklayoutengoil.currentIndex = 2
                }
            }

            NextButtonSettings {
                id: nextButtonSettings3
                x: 817
                y: 796
                width: 200
                height: 80

                Connections {
                    target:  nextButtonSettings3
                    onClicked: {
                        stacklayoutengoil.currentIndex = 0
                        mainRectangle.requestStackChange(0)      //switch back to maintenance overview in mai
                    }
                }
            }
        }
    }


}


