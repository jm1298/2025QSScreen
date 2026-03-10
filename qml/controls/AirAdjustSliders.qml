import QtQuick 6.5
import QtQuick.Controls 6.5
import QtQuick.Layouts 6.5

Item {
    id: item1
    width: 200
    height: 650
    property alias text3Text: text3.text
    Rectangle {
        id: rectangle
        width: 8
        height: 500
        color: "#000000"
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter

        Rectangle {
            id: rectangle2
            width: 95
            height: 6
            color: "#000000"
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Rectangle {
            id: rectangle4
            width: 95
            height: 6
            color: "#000000"
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Rectangle {
            id: rectangle3
            width: 35
            height: 480
            color: "#000000"
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenterOffset: -30
            anchors.horizontalCenter: parent.horizontalCenter

            Rectangle {
                id: rectangle5
                y: 0
                width: 29
                height: 350
                color: "#ffffff"
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 0
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }

        Rectangle {
            id: rectangle6
            width: 35
            height: 480
            color: "#000000"
            anchors.verticalCenter: parent.verticalCenter
            Rectangle {
                id: rectangle7
                y: 0
                width: 29
                height: 200
                color: "#1164d7"
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 0
                anchors.horizontalCenter: parent.horizontalCenter
            }
            anchors.horizontalCenterOffset: 30
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Text {
            id: text1
            x: -30
            y: -25
            text: qsTr("T")
            font.pixelSize: 20
            horizontalAlignment: Text.AlignHCenter
            font.weight: Font.DemiBold
        }

        Text {
            id: text2
            x: 30
            y: -25
            text: qsTr("A")
            font.pixelSize: 20
            horizontalAlignment: Text.AlignHCenter
            font.weight: Font.DemiBold
        }

        Text {
            id: text3
            x: -83
            y: -10
            text: qsTr("200")
            font.pixelSize: 20
            horizontalAlignment: Text.AlignHCenter
            font.weight: Font.DemiBold
        }

        Text {
            id: text4
            x: -61
            y: 483
            text: qsTr("0")
            font.pixelSize: 20
            horizontalAlignment: Text.AlignHCenter
            font.weight: Font.DemiBold
        }
    }

}
