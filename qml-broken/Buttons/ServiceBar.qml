import QtQuick 2.15
import QtQuick.Timeline 1.0

Item {
    width: 300
    height: 983
    property alias buttonAnimationCurrentFrame: buttonAnimation.currentFrame

    Column {
        id: column
        anchors.fill: parent
        padding: 10
        spacing: 10

        Rectangle {
            id: rectangle
            width: 280
            height: 152
            color: "#8c8c8c"
            radius: 15
            border.width: 4

            Text {
                id: text1
                color: "#ffffff"
                text: qsTr("Settings")
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 40
                horizontalAlignment: Text.AlignHCenter
                font.weight: Font.DemiBold
                font.bold: false
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }

        Rectangle {
            id: rectangle1
            width: 280
            height: 152
            color: "#8c8c8c"
            radius: 15
            border.width: 4
            Text {
                id: text2
                color: "#ffffff"
                text: qsTr("Maintenance")
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 40
                horizontalAlignment: Text.AlignHCenter
                font.weight: Font.DemiBold
                font.bold: false
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }

        Rectangle {
            id: rectangle2
            width: 280
            height: 152
            color: "#8c8c8c"
            radius: 15
            border.width: 4
            Text {
                id: text3
                color: "#ffffff"
                text: qsTr("Trouble Codes")
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 40
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignTop
                wrapMode: Text.WrapAnywhere
                maximumLineCount: 1
                font.weight: Font.DemiBold
                font.bold: false
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }

        Rectangle {
            id: rectangle3
            width: 280
            height: 152
            color: "#8c8c8c"
            radius: 15
            border.width: 4
            Text {
                id: text4
                color: "#ffffff"
                text: qsTr("Sensors")
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 40
                font.weight: Font.DemiBold
                font.bold: false
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }

        Rectangle {
            id: rectangle4
            width: 280
            height: 152
            color: "#8c8c8c"
            radius: 15
            border.width: 4
            Text {
                id: text5
                color: "#ffffff"
                text: qsTr("Calibrations")
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 40
                font.weight: Font.DemiBold
                font.bold: false
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }

        Rectangle {
            id: rectangle5
            width: 280
            height: 152
            color: "#1164d7"
            radius: 15
            border.width: 4
            Text {
                id: text6
                color: "#ffffff"
                text: qsTr("Manuals")
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 40
                font.weight: Font.DemiBold
                font.bold: false
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }
    }

    Timeline {
        id: buttonAnimation
        currentFrame: 1
        animations: [
            TimelineAnimation {
                id: buttonTimeline
                running: false
                loops: 1
                duration: 1000
                to: 1000
                from: 0
            }
        ]
        startFrame: 0
        endFrame: 5
        enabled: true

        KeyframeGroup {
            target: rectangle
            property: "color"
            Keyframe {
                value: "#1164d7"
                frame: 0
            }

            Keyframe {
                value: "#8c8c8c"
                frame: 1
            }
        }

        KeyframeGroup {
            target: rectangle1
            property: "color"
            Keyframe {
                value: "#8c8c8c"
                frame: 0
            }

            Keyframe {
                value: "#1164d7"
                frame: 1
            }

            Keyframe {
                value: "#8c8c8c"
                frame: 2
            }
        }

        KeyframeGroup {
            target: rectangle2
            property: "color"
            Keyframe {
                value: "#8c8c8c"
                frame: 0
            }

            Keyframe {
                value: "#8c8c8c"
                frame: 1
            }

            Keyframe {
                value: "#1164d7"
                frame: 2
            }

            Keyframe {
                value: "#8c8c8c"
                frame: 3
            }
        }

        KeyframeGroup {
            target: rectangle3
            property: "color"
            Keyframe {
                value: "#8c8c8c"
                frame: 0
            }

            Keyframe {
                value: "#8c8c8c"
                frame: 2
            }

            Keyframe {
                value: "#1164d7"
                frame: 3
            }

            Keyframe {
                value: "#8c8c8c"
                frame: 4
            }
        }

        KeyframeGroup {
            target: rectangle4
            property: "color"
            Keyframe {
                value: "#8c8c8c"
                frame: 0
            }

            Keyframe {
                value: "#8c8c8c"
                frame: 3
            }

            Keyframe {
                value: "#1164d7"
                frame: 4
            }

            Keyframe {
                value: "#8c8c8c"
                frame: 5
            }
        }

        KeyframeGroup {
            target: rectangle5
            property: "color"
            Keyframe {
                value: "#8c8c8c"
                frame: 0
            }

            Keyframe {
                value: "#8c8c8c"
                frame: 4
            }

            Keyframe {
                value: "#1164d7"
                frame: 5
            }
        }
    }

}
