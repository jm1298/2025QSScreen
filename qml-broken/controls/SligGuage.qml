import QtQuick 6.5

Rectangle {
    id: rectangle2
    width: 400
    height: 400
    color: "#00ffffff"

    ArcItem {
        id: arc
        x: -50
        y: 0
        width: 350
        height: 350
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
            width: 318
            height: 318
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
                x: -180
                y: 3
                width: 20
                height: 5
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
                x: 166
                y: 0
                width: 20
                height: 5
                color: "#0b0b0b"
            }
        }

        ArcItem {
            id: arc2
            x: 0
            y: 0
            width: 310
            height: 310
            anchors.verticalCenter: parent.verticalCenter
            end: -20
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
            rotation: 70
            anchors.horizontalCenter: parent.horizontalCenter

            TriangleItem {
                id: triangle
                x: -151
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
            text: qsTr("20")
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 75
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
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
            text: qsTr("%")
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 20
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.horizontalCenterOffset: 1
            font.weight: Font.DemiBold
            anchors.verticalCenterOffset: 45
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Text {
            id: text3
            x: 20
            y: 260
            color: "#000000"
            text: qsTr("0")
            font.pixelSize: 20
            font.weight: Font.DemiBold
        }

        Text {
            id: text4
            x: 300
            y: 260
            color: "#000000"
            text: qsTr("100")
            font.pixelSize: 20
            font.weight: Font.DemiBold
        }

        Image {
            id: image
            x: 145
            width: 70
            height: 70
            opacity: 0.8
            anchors.verticalCenter: parent.verticalCenter
            source: "../../images/SlipageIcon.png"
            anchors.verticalCenterOffset: 90
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
            sourceSize.height: 200
            sourceSize.width: 200
            fillMode: Image.PreserveAspectFit
        }


    }
}
