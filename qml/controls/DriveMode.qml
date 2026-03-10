import QtQuick 6.5
import QtQuick.Timeline 1.0
//import QtQuick.Studio.Components

Rectangle {
    id: driveModeRectangle
    x: -198
    width: 201
    height: 100
    color: "#387bd7"
    border.width: 3

    property alias drivemodeTimelineCurrentFrame: drivemodeTimeline.currentFrame

    Text {
                id: driveModeText
                width: 156
                height: 100
                color: "#ffffff"
                text: "Turboboost"
                anchors.verticalCenter: parent.verticalCenter
                anchors.verticalCenterOffset: -8

                anchors.left: parent.left
                anchors.leftMargin: 10

                font.pixelSize: 35
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                font.weight: Font.DemiBold

                Text {
                    id: driveModeTextLabel
                    width: 156
                    height: 20
                    color: "#ffffff"
                    text: "Drive Mode"
                    font.pixelSize: 15
                    horizontalAlignment: Text.AlignLeft
                    font.weight: Font.DemiBold

                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 15

                    anchors.left: parent.left
                }
    }

    Timeline {
        id: drivemodeTimeline
        animations: [
                    TimelineAnimation {
                        id: timelineAnimation
                        running: true
                        loops: 1
                        duration: 1000
                        to: 1000
                        from: 0
                    }
                ]
                startFrame: 0
                endFrame: 2
                enabled: true

                KeyframeGroup {
                    target: driveModeText
                    property: "text"

                    Keyframe {
                        value: "Standard"
                        frame: 0
                    }

                    Keyframe {
                        value: "Eco"
                        frame: 1
                    }

                    Keyframe {
                        value: "Durability"
                        frame: 2
                    }
                }

                KeyframeGroup {
                    target: driveModeRectangle
                    property: "color"

                    Keyframe {
                        value: "#11d72b"
                        frame: 1
                    }

                    Keyframe {
                        value: "#c51b00"
                        frame: 2
                    }

                    Keyframe {
                        value: "#387bd7"
                        frame: 0
                    }
                }
    }
}
