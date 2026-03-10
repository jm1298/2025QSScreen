import QtQuick 6.5

Item {
    id: item1
    width: 500
    height: 500
    property alias pitchRotation: roll.rotation

    ArcItem {
        id: arcItem
        width: 450
        height: 450
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        fillColor: "#00ffffff"
        strokeColor: "#353535"
        end: 520
        begin: 200

        ArcItem {
            id: pitchstroke
            width: 510
            height: 510
            anchors.verticalCenter: parent.verticalCenter
            end: roll.rotation
            strokeWidth: 25
            anchors.horizontalCenter: parent.horizontalCenter
            strokeColor: "#1164d7"
            fillColor: "#00387bd7"
        }

        Item {
            id: roll
            anchors.fill: parent
            rotation: 0

            Image {
                id: image
                x: -10
                y: -20
                width: 500
                height: 500
                anchors.verticalCenter: parent.verticalCenter
                source: "../../images/BackOn.png"
                anchors.horizontalCenterOffset: -10
                anchors.verticalCenterOffset: -20
                anchors.horizontalCenter: parent.horizontalCenter
                sourceSize.height: 1000
                sourceSize.width: 1000
                fillMode: Image.PreserveAspectFit
            }

            Rectangle {
                id: rectangle
                width: 35
                height: 3
                color: "#353535"
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 10
            }

            Rectangle {
                id: rectangle1
                width: 35
                height: 3
                color: "#353535"
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 10
            }

            Rectangle {
                id: rectangle2
                width: 3
                height: 35
                color: "#353535"
                anchors.verticalCenter: parent.verticalCenter
                anchors.verticalCenterOffset: 175
                anchors.horizontalCenterOffset: 0
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Rectangle {
                id: rectangle3
                width: 3
                height: 80
                color: "#353535"
                anchors.verticalCenter: parent.verticalCenter
                anchors.verticalCenterOffset: -215
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }


        Text {
            id: text1
            y: 288
            text: roll.rotation
            anchors.bottom: parent.bottom
            anchors.bottomMargin: -22
            font.pixelSize: 40
            anchors.horizontalCenter: parent.horizontalCenter
            font.weight: Font.DemiBold

            Text {
                id: text2
                x: -16
                y: 22
                color: "#494949"
                text: qsTr("Degrees")
                anchors.bottom: parent.bottom
                anchors.bottomMargin: -10
                font.pixelSize: 15
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }


        Rectangle {
            id: rectangle4
            x: 148
            y: -32
            width: 4
            height: 83
            color: "#cf2f0e"
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: -215
            anchors.horizontalCenter: parent.horizontalCenter
        }


    }

}
