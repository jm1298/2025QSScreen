import QtQuick 2.15
import "../../qml/controls"

Item {
    id: item1
    width: 150
    height: 150

    TriangleItem {
        id: triangle
        x: 92
        width: 65
        height: 65
        radius: 0
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: 5
        fillColor: "#d0d0d0"
        strokeColor: "#8c8c8c"
        arcRadius: 0
        rotation: 90

        Rectangle {
            id: rectangle
            y: 75
            width: 60
            height: 36
            color: "#d0d0d0"
            border.color: "#8c8c8c"
            border.width: 4
            anchors.bottom: parent.bottom
            anchors.bottomMargin: -49
            anchors.horizontalCenter: parent.horizontalCenter
            rotation: -90

            Rectangle {
                id: rectangle1
                color: "#d0d0d0"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.leftMargin: 4
                anchors.rightMargin: -11
                anchors.topMargin: 4
                anchors.bottomMargin: 4
            }
        }
    }
    states: [
        State {
            name: "On"

            PropertyChanges {
                target: triangle
                strokeColor: "#000000"
                fillColor: "#04e515"
            }

            PropertyChanges {
                target: rectangle1
                color: "#04e515"
            }

            PropertyChanges {
                target: rectangle
                border.color: "#000000"
                focus: false
            }
        }
    ]

}
