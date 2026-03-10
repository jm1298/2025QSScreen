import QtQuick 6.5
import QtQuick.Controls 6.5
import QtQuick.Layouts

Rectangle {
    id: rectangle3
    width: 400
    height: 400
    color: "#00ffffff"
    property alias tankGBegin: tankG.begin
    property alias arcItem5Begin: tireG.begin
    property alias text1Text: text1.text

    ArcItem {
        id: arcItem
        x: 251
        width: 500
        height: 500
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.rightMargin: 20
        anchors.topMargin: 20
        end: 80
        strokeWidth: 8
        fillColor: "#00ffffff"
        strokeColor: "#000000"

        ArcItem {
            id: arcItem1
            width: 400
            height: 400
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            strokeWidth: 8
            strokeColor: "#000000"
            fillColor: "#00ffffff"

            Rectangle {
                id: rectangle7
                x: 188
                y: 1
                width: 20
                height: 5
                color: "#0b0b0b"
                rotation: 90
            }

            Rectangle {
                id: rectangle8
                x: 386
                y: 200
                width: 20
                height: 5
                color: "#0b0b0b"
                rotation: 0
            }

            ArcItem {
                id: arcItem3
                x: 0
                y: 0
                width: 370
                height: 370
                anchors.verticalCenter: parent.verticalCenter
                strokeWidth: 25
                strokeColor: "#000000"
                fillColor: "#00ffffff"
                anchors.horizontalCenter: parent.horizontalCenter

                ArcItem {
                    id: tireG
                    x: 0
                    y: 0
                    width: 360
                    height: 360
                    anchors.verticalCenter: parent.verticalCenter
                    begin: 45
                    end: 90
                    strokeWidth: 15
                    strokeColor: "#8fb4ff"
                    fillColor: "#00ffffff"
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }
        }

        Rectangle {
            id: rectangle5
            x: 238
            y: 1
            width: 20
            height: 5
            color: "#0b0b0b"
            rotation: 90
        }

        Rectangle {
            id: rectangle6
            x: 486
            y: 250
            width: 20
            height: 5
            color: "#0b0b0b"
            rotation: 0
        }

        ArcItem {
            id: arcItem2
            width: 470
            height: 470
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            strokeWidth: 25
            strokeColor: "#000000"
            fillColor: "#00ffffff"

            ArcItem {
                id: tankG
                x: 0
                y: 0
                width: 460
                height: 460
                anchors.verticalCenter: parent.verticalCenter
                begin: 10
                strokeWidth: 15
                strokeColor: "#1164d7"
                fillColor: "#00ffffff"
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }

        Text {
            id: text5
            x: 509
            y: 232
            color: "#0b0b0b"
            text: qsTr("0")
            anchors.bottomMargin: 18
            font.pixelSize: 25
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.weight: Font.DemiBold
        }

        ArcItem {
            id: arcItem6
            width: 500
            height: 500
            anchors.verticalCenter: parent.verticalCenter
            begin: 80
            anchors.horizontalCenter: parent.horizontalCenter
            strokeWidth: 8
            strokeColor: "#0b0b0b"
            fillColor: "#00ffffff"

            Image {
                id: image
                x: 402
                y: 256
                width: 40
                height: 40
                source: "../../images/TirePressure.png"
                sourceSize.height: 200
                sourceSize.width: 200
                fillMode: Image.PreserveAspectFit
            }

            Image {
                id: image1
                x: 450
                y: 243
                width: 65
                height: 65
                source: "../../images/Air Pressure.png"
                fillMode: Image.PreserveAspectFit
            }
        }

        Text {
            id: text6
            x: 213
            y: -36
            text: qsTr("200")
            anchors.bottomMargin: 18
            font.pixelSize: 25
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.weight: Font.DemiBold
        }

        Text {
            id: text7
            x: 213
            y: 34
            text: qsTr("25")
            anchors.bottomMargin: 18
            font.pixelSize: 25
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.weight: Font.DemiBold
        }

        Text {
            id: text1
            text: qsTr("15")
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 35
            anchors.verticalCenterOffset: -60
            anchors.horizontalCenterOffset: 60
            anchors.horizontalCenter: parent.horizontalCenter
            font.weight: Font.DemiBold

            Text {
                id: text2
                opacity: 0.8
                color: "#494949"
                text: qsTr("PSI")
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 15
                anchors.verticalCenterOffset: 25
                anchors.horizontalCenter: parent.horizontalCenter
                font.weight: Font.DemiBold
            }
        }
    }
}
