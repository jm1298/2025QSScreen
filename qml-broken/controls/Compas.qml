import QtQuick 6.5

Item {
    id: item1
    width: 500
    height: 500
    property alias compneedleRotation: compneedle.rotation

    ArcItem {
        id: arcItem
        width: 350
        height: 350
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        fillColor: "#00ffffff"
        strokeColor: "#353535"
        end: 360
        begin: 0


        Item {
            id: compneedle
            anchors.fill: parent
            rotation: 0

            Image {
                id: image
                width: 150
                height: 150
                anchors.top: parent.top
                anchors.topMargin: 0
                source: "../../images/CompassArrow.png"
                anchors.horizontalCenter: parent.horizontalCenter
                fillMode: Image.PreserveAspectFit
            }
        }

        Text {
            id: text3
            x: 164
            y: 393
            color: "#353535"
            text: "N"
            anchors.bottom: parent.top
            anchors.bottomMargin: 0
            font.pixelSize: 40
            font.weight: Font.DemiBold
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Text {
            id: text4
            color: "#353535"
            text: "E"
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.right
            anchors.leftMargin: 0
            font.pixelSize: 40
            font.weight: Font.DemiBold
        }

        Text {
            id: text5
            x: 164
            color: "#353535"
            text: "S"
            anchors.top: parent.bottom
            anchors.topMargin: 0
            font.pixelSize: 40
            font.weight: Font.DemiBold
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Text {
            id: text6
            color: "#353535"
            text: "W"
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.left
            anchors.rightMargin: 0
            font.pixelSize: 40
            font.weight: Font.DemiBold
        }

        Text {
            id: text7
            color: "#353535"
            text: "NW"
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 40
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.horizontalCenter: parent.horizontalCenter
            font.weight: Font.DemiBold
        }



    }

}
