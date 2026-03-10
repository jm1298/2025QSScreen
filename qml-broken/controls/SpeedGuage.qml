/* NOTE:
   Inputs to this gauge must be multiplied by 10!

   Why? Keyframes for this file are 10 times what is needed for this gauge.
   We have 120 keyframes instead of 12. This gives us more precision
   when the gauge moves, and prevents choppiness. Also allows for non-
   whole number to be displayed (ex. 2.3mph). Displayed text decimal
   precision is limited to 0.0 on purpose. Math is done on component ID
   "textInput" near line 850. See note there.
*/

import QtQuick 6.5
import QtQuick.Controls 6.5
import QtQuick.Layouts
import QtQuick.Timeline 1.0


Rectangle {
    id: rectangle2
    width: 550
    height: 550
    visible: true
    color: "#00ffffff"
    property alias speedTimelineCurrentFrame: speedTimeline.currentFrame

    ArcItem {
        id: outerArc
        width: 900
        height: 900
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.rightMargin: 20
        round: false
        anchors.topMargin: 20
        strokeWidth: 5
        strokeColor: "#000000"
        end: 90
        begin: 0
        fillColor: "#001a1a1a"

        Item {
            id: bigTicks
            anchors.fill: parent
            rotation: 112.5

            Item {
                id: item5
                x: 445
                y: 445
                width: 5
                height: 5
                anchors.verticalCenter: parent.verticalCenter
                rotation: -4.5
                anchors.horizontalCenter: parent.horizontalCenter
                Rectangle {
                    id: rectangle5
                    x: -447
                    y: -2
                    width: 30
                    height: 5
                    color: "#000000"
                    radius: 2.5
                    border.color: "#00000000"
                }
            }

            Item {
                id: item1
                x: 447
                y: 447
                width: 5
                height: 5
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                rotation: 13.5

                Rectangle {
                    id: rectangle
                    x: -447
                    y: -2
                    width: 25
                    height: 4
                    color: "#000000"
                    radius: 2.5
                    border.color: "#00000000"
                }
            }

            Item {
                id: item2
                x: 447
                y: 447
                width: 5
                height: 5
                anchors.verticalCenter: parent.verticalCenter
                rotation: 31.5
                anchors.horizontalCenter: parent.horizontalCenter
                Rectangle {
                    id: rectangle1
                    x: -447
                    y: 0
                    width: 30
                    height: 5
                    color: "#000000"
                    radius: 2.5
                    border.color: "#00000000"
                }
            }

            Item {
                id: item3
                x: 448
                y: 448
                width: 5
                height: 5
                anchors.verticalCenter: parent.verticalCenter
                rotation: 49.5
                anchors.horizontalCenter: parent.horizontalCenter
                Rectangle {
                    id: rectangle3
                    x: -447
                    y: 0
                    width: 25
                    height: 4
                    color: "#000000"
                    radius: 2.5
                    border.color: "#00000000"
                }
            }

            Item {
                id: item4
                x: 454
                y: 454
                width: 5
                height: 5
                anchors.verticalCenter: parent.verticalCenter
                rotation: 67.5
                anchors.horizontalCenter: parent.horizontalCenter
                Rectangle {
                    id: rectangle4
                    x: -447
                    y: 0
                    width: 30
                    height: 5
                    color: "#000000"
                    radius: 2.5
                    border.color: "#00000000"
                }
            }
        }

        Item {
            id: smallTicks
            anchors.fill: parent
            rotation: 90

            Item {
                id: item35
                x: 459
                y: 465
                width: 5
                height: 5
                anchors.verticalCenter: parent.verticalCenter
                rotation: 0
                anchors.horizontalCenter: parent.horizontalCenter
                Rectangle {
                    id: rectangle26
                    x: -447
                    y: -1
                    width: 25
                    height: 4
                    color: "#000000"
                    radius: 2.5
                    border.color: "#00000000"
                }
            }

            Item {
                id: item33
                x: 451
                y: 457
                width: 5
                height: 5
                anchors.verticalCenter: parent.verticalCenter
                rotation: 3.6
                anchors.horizontalCenter: parent.horizontalCenter
                Rectangle {
                    id: rectangle24
                    x: -447
                    y: -1
                    width: 30
                    height: 5
                    color: "#000000"
                    radius: 2.5
                    border.color: "#00000000"
                }
            }

            Item {
                id: item34
                x: 449
                y: 455
                width: 5
                height: 5
                anchors.verticalCenter: parent.verticalCenter
                rotation: 7.2
                anchors.horizontalCenter: parent.horizontalCenter
                Rectangle {
                    id: rectangle25
                    x: -447
                    y: -1
                    width: 25
                    height: 4
                    color: "#000000"
                    radius: 2.5
                    border.color: "#00000000"
                }
            }

            Item {
                id: item28
                x: 451
                y: 457
                width: 5
                height: 5
                anchors.verticalCenter: parent.verticalCenter
                rotation: 10.8
                anchors.horizontalCenter: parent.horizontalCenter
                Rectangle {
                    id: rectangle19
                    x: -447
                    y: -1
                    width: 30
                    height: 5
                    color: "#000000"
                    radius: 2.5
                    border.color: "#00000000"
                }
            }

            Item {
                id: item29
                x: 447
                y: 453
                width: 5
                height: 5
                anchors.verticalCenter: parent.verticalCenter
                rotation: 14.4
                anchors.horizontalCenter: parent.horizontalCenter
                Rectangle {
                    id: rectangle20
                    x: -447
                    y: -1
                    width: 25
                    height: 4
                    color: "#000000"
                    radius: 2.5
                    border.color: "#00000000"
                }
            }

            Item {
                id: item30
                x: 445
                y: 451
                width: 5
                height: 5
                anchors.verticalCenter: parent.verticalCenter
                rotation: 21.6
                anchors.horizontalCenter: parent.horizontalCenter
                Rectangle {
                    id: rectangle21
                    x: -447
                    y: -1
                    width: 25
                    height: 4
                    color: "#000000"
                    radius: 2.5
                    border.color: "#00000000"
                }
            }

            Item {
                id: item31
                x: 448
                y: 454
                width: 5
                height: 5
                anchors.verticalCenter: parent.verticalCenter
                rotation: 25.2
                anchors.horizontalCenter: parent.horizontalCenter
                Rectangle {
                    id: rectangle22
                    x: -447
                    y: -1
                    width: 30
                    height: 5
                    color: "#000000"
                    radius: 2.5
                    border.color: "#00000000"
                }
            }

            Item {
                id: item32
                x: 456
                y: 462
                width: 5
                height: 5
                anchors.verticalCenter: parent.verticalCenter
                rotation: 28.8
                anchors.horizontalCenter: parent.horizontalCenter
                Rectangle {
                    id: rectangle23
                    x: -447
                    y: -1
                    width: 25
                    height: 4
                    color: "#000000"
                    radius: 2.5
                    border.color: "#00000000"
                }
            }

            Item {
                id: item26
                x: 447
                y: 453
                width: 5
                height: 5
                anchors.verticalCenter: parent.verticalCenter
                rotation: 32.4
                anchors.horizontalCenter: parent.horizontalCenter
                Rectangle {
                    id: rectangle17
                    x: -447
                    y: -1
                    width: 30
                    height: 5
                    color: "#000000"
                    radius: 2.5
                    border.color: "#00000000"
                }
            }

            Item {
                id: item27
                x: 447
                y: 453
                width: 5
                height: 5
                anchors.verticalCenter: parent.verticalCenter
                rotation: 39.6
                anchors.horizontalCenter: parent.horizontalCenter
                Rectangle {
                    id: rectangle18
                    x: -447
                    y: -1
                    width: 30
                    height: 5
                    color: "#000000"
                    radius: 2.5
                    border.color: "#00000000"
                }
            }

            Item {
                id: item23
                x: 447
                y: 453
                width: 5
                height: 5
                anchors.verticalCenter: parent.verticalCenter
                rotation: 43.2
                anchors.horizontalCenter: parent.horizontalCenter
                Rectangle {
                    id: rectangle14
                    x: -447
                    y: -1
                    width: 25
                    height: 4
                    color: "#000000"
                    radius: 2.5
                    border.color: "#00000000"
                }
            }

            Item {
                id: item24
                x: 455
                y: 461
                width: 5
                height: 5
                anchors.verticalCenter: parent.verticalCenter
                rotation: 46.8
                anchors.horizontalCenter: parent.horizontalCenter
                Rectangle {
                    id: rectangle15
                    x: -447
                    y: -1
                    width: 30
                    height: 5
                    color: "#000000"
                    radius: 2.5
                    border.color: "#00000000"
                }
            }

            Item {
                id: item25
                x: 442
                y: 448
                width: 5
                height: 5
                anchors.verticalCenter: parent.verticalCenter
                rotation: 50.4
                anchors.horizontalCenter: parent.horizontalCenter
                Rectangle {
                    id: rectangle16
                    x: -447
                    y: -1
                    width: 25
                    height: 4
                    color: "#000000"
                    radius: 2.5
                    border.color: "#00000000"
                }
            }

            Item {
                id: item21
                x: 447
                y: 453
                width: 5
                height: 5
                anchors.verticalCenter: parent.verticalCenter
                rotation: 57.6
                anchors.horizontalCenter: parent.horizontalCenter
                Rectangle {
                    id: rectangle12
                    x: -447
                    y: -1
                    width: 25
                    height: 4
                    color: "#000000"
                    radius: 2.5
                    border.color: "#00000000"
                }
            }

            Item {
                id: item22
                x: 448
                y: 454
                width: 5
                height: 5
                anchors.verticalCenter: parent.verticalCenter
                rotation: 61.2
                anchors.horizontalCenter: parent.horizontalCenter
                Rectangle {
                    id: rectangle13
                    x: -447
                    y: -1
                    width: 30
                    height: 5
                    color: "#000000"
                    radius: 2.5
                    border.color: "#00000000"
                }
            }

            Item {
                id: item20
                x: 447
                y: 453
                width: 5
                height: 5
                anchors.verticalCenter: parent.verticalCenter
                rotation: 64.8
                anchors.horizontalCenter: parent.horizontalCenter
                Rectangle {
                    id: rectangle11
                    x: -447
                    y: -1
                    width: 25
                    height: 4
                    color: "#000000"
                    radius: 2.5
                    border.color: "#00000000"
                }
            }

            Item {
                id: item6
                x: 447
                y: 447
                width: 5
                height: 5
                anchors.verticalCenter: parent.verticalCenter
                rotation: 68.4
                anchors.horizontalCenter: parent.horizontalCenter
                Rectangle {
                    id: rectangle6
                    x: -447
                    y: -1
                    width: 30
                    height: 5
                    color: "#000000"
                    radius: 2.5
                    border.color: "#00000000"
                }
            }

            Item {
                id: item9
                x: 456
                y: 456
                width: 5
                height: 5
                anchors.verticalCenter: parent.verticalCenter
                rotation: 75.6
                anchors.horizontalCenter: parent.horizontalCenter
                Rectangle {
                    id: rectangle7
                    x: -447
                    y: -1
                    width: 30
                    height: 5
                    color: "#000000"
                    radius: 2.5
                    border.color: "#00000000"
                }
            }

            Item {
                id: item10
                x: 456
                y: 456
                width: 5
                height: 5
                anchors.verticalCenter: parent.verticalCenter
                rotation: 79.2
                anchors.horizontalCenter: parent.horizontalCenter
                Rectangle {
                    id: rectangle8
                    x: -447
                    y: -1
                    width: 25
                    height: 4
                    color: "#000000"
                    radius: 2.5
                    border.color: "#00000000"
                }
            }

            Item {
                id: item11
                x: 440
                y: 440
                width: 5
                height: 5
                anchors.verticalCenter: parent.verticalCenter
                rotation: 82.8
                anchors.horizontalCenter: parent.horizontalCenter
                Rectangle {
                    id: rectangle9
                    x: -447
                    y: -1
                    width: 30
                    height: 5
                    color: "#0b0b0b"
                    radius: 2.5
                    border.color: "#00000000"
                }
            }

            Item {
                id: item12
                x: 451
                y: 451
                width: 5
                height: 5
                anchors.verticalCenter: parent.verticalCenter
                rotation: 86.4
                anchors.horizontalCenter: parent.horizontalCenter
                Rectangle {
                    id: rectangle10
                    x: -447
                    y: 2
                    width: 25
                    height: 4
                    color: "#0b0b0b"
                    radius: 2.5
                    border.color: "#00000000"
                }
            }
        }

        ArcItem {
            id: backroundArc
            x: -8
            y: -8
            width: 828
            height: 828
            anchors.verticalCenter: parent.verticalCenter
            strokeWidth: 38
            round: false
            fillColor: "#001a1a1a"
            end: 90
            begin: 0
            anchors.horizontalCenter: parent.horizontalCenter
            strokeColor: "#0b0b0b"
        }

        ArcItem {
            id: speedArc
            width: 820
            height: 820
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            strokeWidth: 30
            round: false
            fillColor: "#001a1a1a"
            end: 90
            begin: 3.9
            strokeColor: "#1164d7"
        }

        Item {
            id: needle
            x: 252
            y: 252
            width: 5
            height: 5
            anchors.verticalCenter: parent.verticalCenter
            rotation: 94.3
            anchors.horizontalCenter: parent.horizontalCenter
            
            TriangleItem {
                id: triangle
                x: -409
                y: -31
                width: 20
                height: 70
                radius: 0
                strokeColor: "#c51b00"
                rotation: -90
                joinStyle: 0
                fillColor: "#c51b00"
                strokeWidth: 1
            }
        }

        Item {
            id: numberText
            x: -6
            y: -6
            anchors.fill: parent
            rotation: 0

            Item {
                id: item14
                x: 447
                y: 447
                width: 5
                height: 5
                anchors.verticalCenter: parent.verticalCenter
                rotation: 0
                anchors.horizontalCenter: parent.horizontalCenter

                Text {
                    id: text2
                    x: 462
                    y: -30
                    text: qsTr("0")
                    font.pixelSize: 50
                    rotation: -2.5
                    font.weight: Font.DemiBold
                }
            }

            Item {
                id: item16
                x: 443
                y: 443
                width: 5
                height: 5
                anchors.verticalCenter: parent.verticalCenter
                rotation: -18
                anchors.horizontalCenter: parent.horizontalCenter
                Text {
                    id: text3
                    x: 457
                    y: 78
                    text: qsTr("1")
                    font.pixelSize: 25

                    rotation: 15.5
                    font.weight: Font.DemiBold
                }

                Text {
                    id: text7
                    x: 467
                    y: 18
                    text: qsTr("2")
                    font.pixelSize: 25
                    rotation: 15.5
                    font.weight: Font.DemiBold
                }

                Text {
                    id: text8
                    x: 468
                    y: -41
                    text: qsTr("3")
                    font.pixelSize: 25
                    rotation: 15.5
                    font.weight: Font.DemiBold
                }

                Text {
                    id: text9
                    x: 461
                    y: -102
                    text: qsTr("4")
                    font.pixelSize: 25
                    rotation: 15.5
                    font.weight: Font.DemiBold
                }

                Text {
                    id: text11
                    x: 432
                    y: -214
                    text: qsTr("6")
                    font.pixelSize: 25
                    rotation: 15.5
                    font.weight: Font.DemiBold
                }

                Text {
                    id: text12
                    x: 402
                    y: -266
                    text: qsTr("7")
                    font.pixelSize: 25
                    rotation: 15.5
                    font.weight: Font.DemiBold
                }

                Text {
                    id: text13
                    x: 364
                    y: -315
                    text: qsTr("8")
                    font.pixelSize: 25
                    rotation: 15.5
                    font.weight: Font.DemiBold
                }

                Text {
                    id: text14
                    x: 323
                    y: -360
                    text: qsTr("9")
                    font.pixelSize: 25
                    rotation: 15.5
                    font.weight: Font.DemiBold
                }

                Text {
                    id: text15
                    x: 228
                    y: -427
                    text: qsTr("11")
                    font.pixelSize: 25
                    rotation: 15.5
                    font.weight: Font.DemiBold
                }

                Text {
                    id: text16
                    x: 173
                    y: -453
                    text: qsTr("12")
                    font.pixelSize: 25
                    rotation: 15.5
                    font.weight: Font.DemiBold
                }
            }

            Item {
                id: item17
                x: 452
                y: 452
                width: 5
                height: 5
                anchors.verticalCenter: parent.verticalCenter
                rotation: -36
                anchors.horizontalCenter: parent.horizontalCenter
                Text {
                    id: text4
                    x: 466
                    y: -34
                    text: qsTr("5")
                    font.pixelSize: 50
                    font.weight: Font.DemiBold
                    rotation: 33.5
                }
            }

            Item {
                id: item18
                x: 453
                y: 453
                width: 5
                height: 5
                anchors.verticalCenter: parent.verticalCenter
                rotation: -54
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Item {
                id: item19
                x: 448
                y: 448
                width: 5
                height: 5
                anchors.verticalCenter: parent.verticalCenter
                rotation: -72
                anchors.horizontalCenter: parent.horizontalCenter
                Text {
                    id: text6
                    x: 459
                    y: -22
                    text: qsTr("10")
                    font.pixelSize: 50
                    font.weight: Font.DemiBold
                    rotation: 69.5
                }
            }
        }
    }

    TextInput {
        id: textInput
        y: 260
        width: 200
        height: 200
        color: "#000000"
        text: (speedTimeline.currentFrame/10).toFixed(1);
        /* get current keyframe (speedTimeline.currentFrame). Divide this by
           10 to get correct value. Then use toFixed() to limit decimal places,
           just in case that is an issue
        */

        anchors.left: parent.left
        anchors.bottom: parent.bottom
        font.pixelSize: 100
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        rotation: -2.5
        anchors.leftMargin: 120
        anchors.bottomMargin: 130
        font.weight: Font.DemiBold

        Text {
            id: text1
            x: 72
            y: 144
            opacity: 0.8
            color: "#494949"
            text: qsTr("MPH")
            font.pixelSize: 25
            font.weight: Font.DemiBold
        }
    }
    
    Timeline {
        id: speedTimeline

        animations: [
            TimelineAnimation {
                id: speedAnimation
                running: false
                loops: 1
                duration: 1000
                to: 25
                from: 0
            }
        ]
        startFrame: 0
        endFrame: 120
        enabled: true
        
        KeyframeGroup {
            target: needle
            property: "rotation"
            Keyframe {
                value: 180.3
                frame: 0
            }

            Keyframe {
                value: 94.3
                frame: 120
            }
        }

        KeyframeGroup {
            target: speedArc
            property: "begin"
            Keyframe {
                value: 90
                frame: 0
            }

            Keyframe {
                value: 3.9
                frame: 120
            }
        }
    }
}
