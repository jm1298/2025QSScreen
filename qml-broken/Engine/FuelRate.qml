import QtQuick 6.5
import QtQuick.Timeline 1.0
//import QtQuick.Studio.Components

Rectangle {
    id: rectangle0
    width: 550
    height: 125
    color: "#00ffffff"

    property alias fuelRate_timelineCurrentFrame: fuelRate_timeline.currentFrame

    Text {
        id: title
        y: 0
        color: "#0b0b0b"
        text: qsTr("Fuel Rate")
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
            text: (fuelRate_timeline.currentFrame/100).toFixed(2);
            font.pixelSize: 20
            horizontalAlignment: Text.AlignRight
            font.bold: true
            font.weight: Font.DemiBold
            anchors.right: unit.left
        }

        Text {
            id: unit
            color: "#0b0b0b"
            text: " gal/hr"
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
            x: 482
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
            color: "#1164d7"
            anchors.left: parent.left
        }

        Rectangle {
            id: colorbar
            x: 0
            y: 40
            width: 500
            height: 5
            color: "#000000"
            anchors.horizontalCenter: parent.horizontalCenter

            Rectangle {
                id: leftEnd
                y: -2
                width: 5
                height: 20
                color: "#000000"
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left

                Text {
                    id: leftText
                    x: -3.2
                    y: 15
                    color: "#0b0b0b"
                    text: qsTr("0")
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
                color: "#000000"
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right

                Text {
                    id: rightText
                    x: -2
                    y: 15
                    color: "#0b0b0b"
                    text: qsTr("1")
                    font.pixelSize: 20
                    horizontalAlignment: Text.AlignHCenter
                    font.weight: Font.DemiBold
                }
            }
        }
    }

    Timeline {
        id: fuelRate_timeline
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
        endFrame: 100
        enabled: true

        KeyframeGroup {
            target: triangle
            property: "x"
            Keyframe {
                value: -17
                frame: 0
            }

            Keyframe {
                value: 482
                frame: 100
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
                frame: 100
            }
        }
    }




}
