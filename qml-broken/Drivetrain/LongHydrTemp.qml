import QtQuick 6.5
import QtQuick.Timeline 1.0
//import QtQuick.Studio.Components

Rectangle {
    id: rectangle0
    width: 550
    height: 125
    color: "#00ffffff"

    property alias longHydTempTimelineCurrentFrame: longHydTempTimeline.currentFrame

    Text {
        id: title
        y: 0
        color: "#0b0b0b"
        text: qsTr("System Temperature")
        font.pixelSize: 20
        horizontalAlignment: Text.AlignHCenter
        font.bold: true
        font.weight: Font.DemiBold
        anchors.left: rectangle1.left
    }

    Rectangle {
        id: readoutBox
        width: 100
        height: 27
        color: "#00ffffff"
        anchors.right: rectangle1.right

        Text {
            id: readout
            y: 0
            color: "#0b0b0b"
            text: longHydTempTimeline.currentFrame
            font.pixelSize: 20
            horizontalAlignment: Text.AlignRight
            font.bold: true
            font.weight: Font.DemiBold
            anchors.right: unit.left
        }

        Text {
            id: unit
            color: "#0b0b0b"
            text: " °F"
            font.pixelSize: 20
            horizontalAlignment: Text.AlignRight
            font.bold: true
            font.weight: Font.DemiBold
            anchors.right: parent.right

        }
    }



    Rectangle {
        id: rectangle1
        y: 50
        width: 500
        height: 30
        color: "#000000"
        anchors.horizontalCenter: parent.horizontalCenter

        TriangleItem {
            id: triangle
            x: 480
            y: -21
            width: 35
            height: 25
            radius: 0
            strokeColor: "#c51b00"
            rotation: 180
            //joinStyle: 1
            fillColor: "#c51b00"
            strokeWidth: 0
        }

        Rectangle {
            id: slideIndicator
            y: 5
            width: 500
            height: 20
            color: "#c51b00"
            anchors.left: parent.left
        }

        Rectangle {
            id: colorbar
            x: 0
            y: 40
            width: 500
            height: 5
            color: "#00000000"
            anchors.horizontalCenter: parent.horizontalCenter

            Rectangle {
                id: okayRange
                height: 5
                color: "#0b0b0b"
                anchors.left: okayLow.right
                anchors.right: okayHigh.left
            }

            Rectangle {
                id: lowRange
                height: 5
                color: "#1164d7"
                anchors.left: leftEnd.right
                anchors.right: okayLow.left
            }

            Rectangle {
                id: highRange
                height: 5
                color: "#c51b00"
                anchors.left: okayHigh.right
                anchors.right: rightEnd.left
            }


            Rectangle {
                id: leftEnd
                y: -2
                width: 5
                height: 20
                color: "#1164d7"
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left

                Text {
                    id: leftText
                    x: -3.2
                    y: 15
                    color: "#1164d7"
                    text: qsTr("0")
                    font.pixelSize: 20
                    horizontalAlignment: Text.AlignHCenter
                    font.weight: Font.DemiBold
                }
            }

            Rectangle {
                id: okayLow
                x: 131
                y: -2
                width: 5
                height: 20
                color: "#000000"
                anchors.verticalCenter: parent.verticalCenter

                Text {
                    id: lowText
                    x: -8
                    y: 15
                    color: "#000000"
                    text: qsTr("70")
                    font.pixelSize: 20
                    horizontalAlignment: Text.AlignHCenter
                    font.weight: Font.DemiBold
                }
            }

            Rectangle {
                id: okayHigh
                x: 420
                y: -2
                width: 5
                height: 20
                color: "#000000"
                anchors.verticalCenter: parent.verticalCenter

                Text {
                    id: highText
                    x: -14
                    y: 15
                    color: "#000000"
                    text: qsTr("220")
                    font.pixelSize: 20
                    horizontalAlignment: Text.AlignHCenter
                    font.weight: Font.DemiBold
                }
            }

            Rectangle {
                id: rightEnd
                y: -2
                width: 5
                height: 20
                color: "#c51b00"
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right

                Text {
                    id: rightText
                    x: -14
                    y: 15
                    color: "#c51b00"
                    text: qsTr("220")
                    font.pixelSize: 20
                    horizontalAlignment: Text.AlignHCenter
                    font.weight: Font.DemiBold
                }
            }
        }
    }

    Timeline {
        id: longHydTempTimeline
        animations: [
            TimelineAnimation {
                id: timelineAnimation
                running: false
                loops: 1
                duration: 1000
                to: 1000
                from: 0
            }
        ]
        startFrame: 0
        endFrame: 260
        enabled: true

        KeyframeGroup {
            target: triangle
            property: "x"
            Keyframe {
                value: -17
                frame: 0
            }

            Keyframe {
                value: 480
                frame: 260
            }
        }

        KeyframeGroup {
            target: slideIndicator
            property: "width"
            Keyframe {
                value: 0
                frame: 0
            }

            Keyframe {
                value: 500
                frame: 260
            }
        }

        KeyframeGroup {
            target: slideIndicator
            property: "color"
            Keyframe {
                value: "#1164d7"
                frame: 70
            }

            Keyframe {
                value: "#c51b00"
                frame: 221
            }

            Keyframe {
                value: "#1164d7"
                frame: 220
            }

            Keyframe {
                value: "#ffffff"
                frame: 69
            }

            Keyframe {
                value: "#ffffff"
                frame: 0
            }
        }
    }




}
