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
    property alias rpmtimelineCurrentFrame: rpmtimeline.currentFrame

    ArcItem {
        id: outerBlackArc
        width: 900
        height: 900
        anchors.left: parent.left
        anchors.top: parent.top
        round: false
        anchors.topMargin: 20
        anchors.leftMargin: 20
        strokeWidth: 5
        strokeColor: "#000000"
        end: 350
        begin: 270
        fillColor: "#001a1a1a"

        Item {
            id: largeTicks
            anchors.fill: parent

            Item {
                id: item1
                x: 447
                y: 447
                width: 5
                height: 5
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                rotation: 0

                Rectangle {
                    id: rectangle
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
                id: item2
                x: 447
                y: 447
                width: 5
                height: 5
                anchors.verticalCenter: parent.verticalCenter
                rotation: 20
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
                rotation: 40
                anchors.horizontalCenter: parent.horizontalCenter
                Rectangle {
                    id: rectangle3
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
                id: item4
                x: 454
                y: 454
                width: 5
                height: 5
                anchors.verticalCenter: parent.verticalCenter
                rotation: 60
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

            Item {
                id: item5
                x: 445
                y: 445
                width: 5
                height: 5
                anchors.verticalCenter: parent.verticalCenter
                rotation: 80
                anchors.horizontalCenter: parent.horizontalCenter
                Rectangle {
                    id: rectangle5
                    x: -447
                    y: 0
                    width: 30
                    height: 5
                    color: "#c51b00"
                    radius: 2.5
                    border.color: "#00000000"
                }
            }
        }

        Item {
            id: smallTicks
            anchors.fill: parent

            Item {
                id: item6
                x: 447
                y: 447
                width: 5
                height: 5
                anchors.verticalCenter: parent.verticalCenter
                rotation: 10
                anchors.horizontalCenter: parent.horizontalCenter
                Rectangle {
                    id: rectangle6
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
                id: item9
                x: 456
                y: 456
                width: 5
                height: 5
                anchors.verticalCenter: parent.verticalCenter
                rotation: 30
                anchors.horizontalCenter: parent.horizontalCenter
                Rectangle {
                    id: rectangle7
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
                id: item10
                x: 456
                y: 456
                width: 5
                height: 5
                anchors.verticalCenter: parent.verticalCenter
                rotation: 50
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
                rotation: 70
                anchors.horizontalCenter: parent.horizontalCenter
                Rectangle {
                    id: rectangle9
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
                id: item12
                x: 451
                y: 451
                width: 5
                height: 5
                anchors.verticalCenter: parent.verticalCenter
                rotation: 90
                anchors.horizontalCenter: parent.horizontalCenter
                Rectangle {
                    id: rectangle10
                    x: -447
                    y: -2
                    width: 25
                    height: 4
                    color: "#c51b00"
                    radius: 2.5
                    border.color: "#00000000"
                }
            }
        }

        ArcItem {
            id: blackBackroundArc
            x: -8
            y: -8
            width: 828
            height: 828
            anchors.verticalCenter: parent.verticalCenter
            strokeWidth: 38
            round: false
            fillColor: "#001a1a1a"
            end: 360
            begin: 270
            anchors.horizontalCenter: parent.horizontalCenter
            strokeColor: "#0b0b0b"
        }

        ArcItem {
            id: rpmArc
            width: 820
            height: 820
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            strokeWidth: 30
            round: false
            fillColor: "#001a1a1a"
            end: 360
            begin: 270
            strokeColor: "#ff0000"
        }

        Item {
            id: needle
            x: 252
            y: 252
            width: 5
            height: 5
            anchors.verticalCenter: parent.verticalCenter
            rotation: 79.7
            anchors.horizontalCenter: parent.horizontalCenter

            TriangleItem {
                id: triangle
                x: -408
                y: -35
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
            id: rpmText
            x: -6
            y: -6
            anchors.fill: parent

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
                    x: -485
                    y: -40
                    text: qsTr("0")
                    font.pixelSize: 50
                    font.weight: Font.DemiBold
                }
            }

            Item {
                id: item16
                x: 442
                y: 442
                width: 5
                height: 5
                anchors.verticalCenter: parent.verticalCenter
                rotation: 20
                anchors.horizontalCenter: parent.horizontalCenter
                Text {
                    id: text6
                    x: -485
                    y: -40
                    text: qsTr("1")
                    font.pixelSize: 50
                    rotation: -20
                    font.weight: Font.DemiBold
                }
            }

            Item {
                id: item17
                x: 443
                y: 443
                width: 5
                height: 5
                anchors.verticalCenter: parent.verticalCenter
                rotation: 40
                anchors.horizontalCenter: parent.horizontalCenter
                Text {
                    id: text7
                    x: -490
                    y: -40
                    text: qsTr("2")
                    font.pixelSize: 50
                    font.weight: Font.DemiBold
                    rotation: -40
                }
            }

            Item {
                id: item18
                x: 435
                y: 435
                width: 5
                height: 5
                anchors.verticalCenter: parent.verticalCenter
                rotation: 60
                anchors.horizontalCenter: parent.horizontalCenter
                Text {
                    id: text8
                    x: -490
                    y: -40
                    text: qsTr("3")
                    font.pixelSize: 50
                    font.weight: Font.DemiBold
                    rotation: -60
                }
            }

            Item {
                id: item19
                x: 439
                y: 439
                width: 5
                height: 5
                anchors.verticalCenter: parent.verticalCenter
                rotation: 80
                anchors.horizontalCenter: parent.horizontalCenter
                Text {
                    id: text9
                    x: -490
                    y: -40
                    color: "#c51b00"
                    text: qsTr("4")
                    font.pixelSize: 50
                    font.weight: Font.DemiBold
                    rotation: -80
                }
            }
        }
    }

    ArcItem {
        id: outerRedArc
        width: 900
        height: 900
        anchors.left: parent.left
        anchors.top: parent.top
        capStyle: 0
        strokeStyle: 1
        strokeWidth: 5
        round: false
        fillColor: "#001a1a1a"
        end: 360.5
        anchors.leftMargin: 20
        begin: 350
        strokeColor: "#c51b00"
        anchors.topMargin: 20
    }

    Text {
        id: rpmReadOut
        x: 230
        y: 220
        width: 200
        height: 200
        color: "#ff0000"
        text: rpmtimeline.currentFrame
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        font.pixelSize: 100
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        rotation: 2.5
        anchors.bottomMargin: 130
        anchors.rightMargin: 120
        font.weight: Font.DemiBold

        Text {
            id: text1
            x: 33
            y: 145
            opacity: 0.8
            color: "#494949"
            text: qsTr("RPM X 1000")
            font.pixelSize: 25
            font.weight: Font.DemiBold
        }
    }

    Timeline {
        id: rpmtimeline
        //currentFrame: 2000
        animations: [
            TimelineAnimation {
                id: rpmAnimation
                running: false
                loops: 1
                duration: 1000
                to: 4500
                from: 0
            }
        ]
        startFrame: 0
        endFrame: 4500
        enabled: true

        KeyframeGroup {
            target: needle
            property: "rotation"
            Keyframe {
                value: 0
                frame: 0
            }

            Keyframe {
                value: 90
                frame: 4500
            }

            Keyframe {
                value: 19.7
                frame: 1000
            }

            Keyframe {
                value: 79.7
                frame: 4000
            }
        }

        KeyframeGroup {
            target: rpmArc
            property: "end"
            Keyframe {
                value: 270
                frame: 0
            }

            Keyframe {
                value: 360
                frame: 4500
            }
        }

        KeyframeGroup {
            target: rpmArc
            property: "strokeColor"
            Keyframe {
                value: "#1164d7"
                frame: 0
            }

            Keyframe {
                value: "#1164d7"
                frame: 3999
            }

            Keyframe {
                value: "#ff0000"
                frame: 4000
            }
        }

        KeyframeGroup {
            target: rpmReadOut
            property: "color"
            Keyframe {
                value: "#000000"
                frame: 0
            }

            Keyframe {
                value: "#000000"
                frame: 3999
            }

            Keyframe {
                value: "#ff0000"
                frame: 4000
            }
        }
    }
}
