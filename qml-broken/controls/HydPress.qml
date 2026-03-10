import QtQuick 6.5
import QtQuick.Timeline 1.0

Rectangle {
    id: rectangle2
    width: 300
    height: 300
    color: "#00ffffff"
    property alias hydraulicPSICurrentFrame: hydraulicPSI.currentFrame

    ArcItem {
        id: arc
        x: -50
        y: 0
        width: 250
        height: 250
        anchors.verticalCenter: parent.verticalCenter
        end: 120
        anchors.verticalCenterOffset: 0
        anchors.horizontalCenterOffset: 0
        strokeColor: "#0b0b0b"
        strokeWidth: 5
        anchors.horizontalCenter: parent.horizontalCenter
        begin: -120
        fillColor: "#00000000"

        ArcItem {
            id: arc1
            x: 0
            y: 0
            width: 218
            height: 218
            anchors.verticalCenter: parent.verticalCenter
            end: 120
            strokeWidth: 18
            strokeColor: "#0b0b0b"
            fillColor: "#00000000"
            begin: -120
            anchors.verticalCenterOffset: 0
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Item {
            id: item2
            width: 5
            height: 5
            anchors.verticalCenter: parent.verticalCenter
            rotation: -29
            anchors.horizontalCenter: parent.horizontalCenter

            Rectangle {
                id: rectangle
                x: -128
                y: 3
                width: 20
                height: 3
                color: "#0b0b0b"
            }
        }





        Item {
            id: item3
            width: 5
            height: 5
            anchors.verticalCenter: parent.verticalCenter
            rotation: 29.8
            anchors.horizontalCenter: parent.horizontalCenter

            Rectangle {
                id: rectangle1
                x: 114
                y: 0
                width: 20
                height: 3
                color: "#0b0b0b"
            }
        }

        ArcItem {
            id: arc2
            x: 0
            y: 0
            width: 210
            height: 210
            anchors.verticalCenter: parent.verticalCenter
            end: 100
            strokeWidth: 10
            strokeColor: "#1164d7"
            fillColor: "#00000000"
            begin: -120
            anchors.verticalCenterOffset: 0
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
        }



        Item {
            id: item1
            width: 10
            height: 10
            anchors.verticalCenter: parent.verticalCenter
            rotation: 210
            anchors.horizontalCenter: parent.horizontalCenter

            TriangleItem {
                id: triangle
                x: -101
                y: -9
                width: 10
                height: 30
                radius: 0
                strokeColor: "#c51b00"
                rotation: -90
                joinStyle: 1
                fillColor: "#c51b00"
                strokeWidth: 0
            }
        }



        Text {
            id: text1
            x: 83
            y: 61
            color: "#000000"
            text: hydraulicPSI.currentFrame
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 50
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.family: none.none
            anchors.verticalCenterOffset: -10
            anchors.horizontalCenter: parent.horizontalCenter
            font.weight: Font.DemiBold
        }



        Text {
            id: text2
            x: 83
            y: 61
            opacity: 0.8
            color: "#494949"
            text: qsTr("PSI")
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 20
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.horizontalCenterOffset: 1
            font.weight: Font.DemiBold
            anchors.verticalCenterOffset: 25
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Text {
            id: text3
            x: 20
            y: 185
            text: qsTr("0")
            font.pixelSize: 20
            font.weight: Font.DemiBold
        }

        Text {
            id: text4
            x: 186
            y: 185
            color: "#0b0b0b"
            text: qsTr("4000")
            font.pixelSize: 20
            font.weight: Font.DemiBold
        }


    }

    ArcItem {
        id: arc3
        x: -50
        y: 0
        width: 250
        height: 250
        strokeWidth: 5
        strokeColor: "#c51b00"
        fillColor: "#00000000"
        end: 120
        begin: 120
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: 0
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Timeline {
        id: hydraulicPSI
        animations: [
            TimelineAnimation {
                id: hydraulicPSITimeline
                running: false
                loops: 1
                duration: 1000
                to: 800
                from: 0
            }
        ]
        startFrame: 0
        endFrame: 4000
        enabled: true

        KeyframeGroup {
            target: arc2
            property: "end"
            Keyframe {
                value: -120
                frame: 0
            }

            Keyframe {
                value: 120
                frame: 4000
            }
        }

        KeyframeGroup {
            target: item1
            property: "rotation"
            Keyframe {
                value: -29
                frame: 0
            }

            Keyframe {
                value: 210
                frame: 4000
            }
        }
    }

    Image {
        id: hydraulicPressure
        x: 128
        y: 191
        width: 45
        height: 49
        source: "../../images/hydraulicPressure.png"
        fillMode: Image.PreserveAspectFit
    }
}
