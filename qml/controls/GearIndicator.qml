import QtQuick 6.5
import QtQuick.Controls 6.5
import QtQuick.Layouts
import QtQuick.Timeline 1.0

ColumnLayout {
    id: columnLayout
    width: 60
    height: 300
    property alias currentGearTimelineCurrentFrame: currentGearTimeline.currentFrame
    spacing: -20

    Text {
        id: text7
        width: 60
        height: 76
        color: "#1164d7"
        text: qsTr("F")
        font.pixelSize: 70
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        clip: false
        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        font.weight: Font.Bold
    }

    Text {
        id: text9
        width: 60
        height: 78
        color: "#0b0b0b"
        text: qsTr("N")
        font.pixelSize: 70
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        font.weight: Font.Bold
    }

    Text {
        id: text8
        width: 60
        height: 80
        color: "#1164d7"
        text: qsTr("R")
        font.pixelSize: 70
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        font.weight: Font.Bold
    }

    Timeline {
        id: currentGearTimeline
        animations: [
            TimelineAnimation {
                id: currentGearAnimation
                pingPong: false
                paused: false
                running: false
                loops: 1
                duration: 1000
                to: 1000
                from: 0
            }
        ]
        startFrame: 0
        endFrame: 2
        enabled: true
        currentFrame: 1         //comment out to make timeline work in design studio

        KeyframeGroup {
            target: text8
            property: "color"
            Keyframe {
                value: "#1164d7"
                frame: 0
            }

            Keyframe {
                value: "#0b0b0b"
                frame: 1
            }

            Keyframe {
                value: "#0b0b0b"
                frame: 2
            }
        }

        KeyframeGroup {
            target: text9
            property: "color"
            Keyframe {
                value: "#0b0b0b"
                frame: 0
            }

            Keyframe {
                value: "#1164d7"
                frame: 1
            }

            Keyframe {
                value: "#0b0b0b"
                frame: 2
            }
        }

        KeyframeGroup {
            target: text7
            property: "color"
            Keyframe {
                value: "#0b0b0b"
                frame: 0
            }

            Keyframe {
                value: "#0b0b0b"
                frame: 1
            }

            Keyframe {
                value: "#1164d7"
                frame: 2
            }
        }
    }
}
