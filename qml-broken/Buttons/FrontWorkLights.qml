


import QtQuick 2.15
import QtQuick.Controls 2.15

Button {
    id: control
    width: 80
    height: 80
    opacity: 1

    leftPadding: 4
    rightPadding: 4

    text: "My Button"
    property bool memorystate: false
    checked: false
    checkable: false
    hoverEnabled: false
    flat: true
    icon.color: "#0f0f0f"
    highlighted: false
    icon.cache: true
    icon.height: 75
    icon.width: 75
    icon.source: "../../images/WorkLight.png"
    display: AbstractButton.IconOnly

    background: buttonBackground
    Rectangle {
        id: buttonBackground
        color: "#26494949"
        implicitWidth: 100
        implicitHeight: 40
        opacity: enabled ? 1 : 0.3
        visible: true
        radius: 15
        border.color: "#0b0b0b"
        border.width: 1
    }


    Connections {
        target: control
        onClicked: control.memorystate = !control.memorystate
    }

    Image {
        id: image
        visible: false
        anchors.fill: parent
        anchors.leftMargin: 5
        anchors.rightMargin: 5
        anchors.topMargin: 5
        anchors.bottomMargin: 5
        horizontalAlignment: Image.AlignHCenter
        verticalAlignment: Image.AlignVCenter
        source: "../../images/WorkLightOff.png"
        mirror: false
        mipmap: false
        sourceSize.height: 75
        sourceSize.width: 75
        fillMode: Image.PreserveAspectFit
    }





    states: [
        State {
            name: "On"
            when: control.memorystate
            PropertyChanges {
                target: buttonBackground
                color: "#f6ff00"
                border.color: "#000000"
            }

            PropertyChanges {
                target: control
                icon.color: "#000000"
            }


        },
        State {
            name: "Off"
            when: !control.memorystate
            PropertyChanges {
                target: control
                text: ""
                display: AbstractButton.TextOnly
            }

            PropertyChanges {
                target: image
                visible: true
            }




        }
    ]
}
