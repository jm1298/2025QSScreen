import QtQuick 6.5
import QtQuick.Controls 6.5
import QtQuick.Layouts
import QtQuick.Timeline 1.0

Rectangle {
    id: rectangle3
    width: 400
    height: 400
    color: "#00ffffff"
    property alias arc5End: arc5.end
    property alias fuelGuageCurrentFrame: fuelGuage.currentFrame

    ArcItem {
        id: arc
        width: 500
        height: 500
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.topMargin: 20
        anchors.leftMargin: 20
        end: 360
        begin: 281
        strokeColor: "#0b0b0b"
        strokeWidth: 5
        fillColor: "#00000000"

        ArcItem {
            id: arc1
            width: 400
            height: 400
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            strokeWidth: 5
            fillColor: "#00000000"
            end: 360
            begin: 270
            strokeColor: "#0b0b0b"

            ArcItem {
                id: arc4
                x: 0
                y: 0
                width: 368
                height: 368
                anchors.verticalCenter: parent.verticalCenter
                strokeWidth: 23
                fillColor: "#00000000"
                end: 360
                begin: 270
                anchors.horizontalCenter: parent.horizontalCenter
                strokeColor: "#0b0b0b"

                ArcItem {
                    id: arc5
                    x: 0
                    y: 0
                    width: 360
                    height: 360
                    anchors.verticalCenter: parent.verticalCenter
                    strokeWidth: 15
                    fillColor: "#00000000"
                    end: 360
                    begin: 270
                    anchors.horizontalCenter: parent.horizontalCenter
                    strokeColor: "#8fb4ff"
                }
            }

            Rectangle {
                id: rectangle2
                x: -6
                y: 200
                width: 20
                height: 3
                color: "#0b0b0b"
            }

            Rectangle {
                id: rectangle4
                x: 191
                y: 1
                width: 20
                height: 3
                color: "#0b0b0b"
                rotation: 90
            }
        }

        Rectangle {
            id: rectangle
            x: -6
            y: 249
            width: 20
            height: 3
            color: "#c51b00"
        }

        ArcItem {
            id: arc2
            width: 468
            height: 468
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            strokeWidth: 23
            fillColor: "#00000000"
            end: 360
            begin: 270
            strokeColor: "#0b0b0b"
        }

        Rectangle {
            id: rectangle1
            x: 241
            y: 1
            width: 20
            height: 3
            color: "#0b0b0b"
            rotation: 90
        }

        ArcItem {
            id: arc3
            x: -5
            y: -5
            width: 460
            height: 460
            anchors.verticalCenter: parent.verticalCenter
            strokeWidth: 15
            fillColor: "#00000000"
            end: 360
            begin: 270
            anchors.horizontalCenter: parent.horizontalCenter
            strokeColor: "#1164d7"
        }

        Text {
            id: text1
            x: 240
            y: -37
            text: qsTr("F")
            anchors.bottom: arc2.top
            font.pixelSize: 25
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.weight: Font.DemiBold
            anchors.bottomMargin: 18
            anchors.horizontalCenterOffset: 14
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Text {
            id: text2
            x: 249
            y: 233
            color: "#c51b00"
            text: qsTr("E")
            anchors.verticalCenter: parent.verticalCenter
            anchors.bottom: arc2.top
            font.pixelSize: 25
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.verticalCenterOffset: 0
            anchors.bottomMargin: 18
            font.weight: Font.DemiBold
            anchors.horizontalCenterOffset: -276
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Text {
            id: text3
            x: 240
            y: 33
            text: qsTr("6")
            anchors.bottom: arc2.top
            anchors.bottomMargin: -52
            font.pixelSize: 25
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.weight: Font.DemiBold
            anchors.horizontalCenterOffset: 15
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Text {
            id: text4
            x: 249
            y: 233
            text: qsTr("0")
            anchors.verticalCenter: parent.verticalCenter
            anchors.bottom: arc2.top
            anchors.bottomMargin: 18
            font.pixelSize: 25
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.weight: Font.DemiBold
            anchors.verticalCenterOffset: 16
            anchors.horizontalCenterOffset: -201
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Rectangle {
            id: rectangle5
            x: 63
            y: 72
            width: 20
            height: 3
            color: "#0b0b0b"
            rotation: 45
        }

        Text {
            id: text5
            color: "#000000"
            text: qsTr("1")
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 35
            anchors.verticalCenterOffset: -60
            anchors.horizontalCenterOffset: -60
            anchors.horizontalCenter: parent.horizontalCenter
            font.weight: Font.Bold

            Text {
                id: text6
                opacity: 0.8
                color: "#494949"
                text: qsTr("Gal/ Hr")
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 15
                anchors.verticalCenterOffset: 30
                anchors.horizontalCenter: parent.horizontalCenter
                font.weight: Font.Bold
            }
        }

        Text {
            id: text7
            x: 240
            y: 39
            text: qsTr("1/2")
            anchors.bottom: arc2.top
            anchors.bottomMargin: -58
            font.pixelSize: 25
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.weight: Font.DemiBold
            anchors.horizontalCenterOffset: -201
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

    ArcItem {
        id: arc6
        width: 500
        height: 500
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 20
        anchors.topMargin: 20
        strokeWidth: 5
        strokeColor: "#c51b00"
        fillColor: "#00000000"
        end: 281
        begin: 270
    }

    Image {
        id: image
        x: 0
        y: 276
        width: 40
        height: 40
        verticalAlignment: Image.AlignVCenter
        source: "../../images/FuelIcon.png"
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: image1
        x: 80
        y: 271
        width: 50
        height: 50
        verticalAlignment: Image.AlignVCenter
        source: "../../images/FuelUsageIcon.png"
        fillMode: Image.PreserveAspectFit
    }

    Timeline {
        id: fuelGuage
        animations: [
            TimelineAnimation {
                id: fuelGuageAnimation
                running: false
                loops: 1
                duration: 100
                to: 100
                from: 0
            }
        ]
        startFrame: 0
        endFrame: 100
        enabled: true

        KeyframeGroup {
            target: arc3
            property: "strokeColor"
            Keyframe {
                value: "#cf2f0e"
                frame: 0
            }

            Keyframe {
                value: "#1164d7"
                frame: 100
            }

            Keyframe {
                value: "#cf2f0e"
                frame: 12
            }

            Keyframe {
                value: "#1164d7"
                frame: 13
            }
        }

        KeyframeGroup {
            target: arc3
            property: "end"
            Keyframe {
                value: 270
                frame: 0
            }

            Keyframe {
                value: 360
                frame: 100
            }
        }
    }
}
