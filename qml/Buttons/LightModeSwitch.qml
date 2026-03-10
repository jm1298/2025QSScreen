

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick 2.15
import QtQuick.Controls 2.15
import "../../qml/Icons"

Button {
    id: control
    width: 240
    height: 80

    leftPadding: 4
    rightPadding: 4

    text: ""
    property int mode: 0
    state: "Mode 1"
    focusPolicy: Qt.StrongFocus
    enabled: true
    hoverEnabled: false
    checked: false
    checkable: true
    flat: true
    icon.color: "#0f0f0f"
    highlighted: false
    icon.cache: true
    icon.height: 150
    icon.width: 150
    icon.source: "../../images/compressor.png"
    display: AbstractButton.TextOnly

    background: buttonBackground
    Rectangle {
        id: buttonBackground
        color: "#48494949"
        implicitWidth: 100
        implicitHeight: 40
        opacity: enabled ? 1 : 0.3
        radius: 15
        border.color: "#0b0b0b"
        border.width: 1
        anchors.fill: parent
    }

    Rectangle {
        id: rectangle
        width: 115
        height: 76
        color: "#ffffff"
        radius: 15
        border.width: 1
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 4

        LightMode1Icon {
            id: lightMode1Icon
            anchors.verticalCenter: parent.verticalCenter
            icon.height: 75
            icon.width: 75
            focusPolicy: Qt.NoFocus
            enabled: false
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

    Rectangle {
        id: rectangle1
        width: 115
        height: 76
        color: "#ffffff"
        radius: 15
        border.width: 1
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: 4

        LowBeamIcon {
            id: lowBeamIcon
            anchors.verticalCenter: parent.verticalCenter
            enabled: false
            focusPolicy: Qt.NoFocus
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }


    states: [
        State {
            name: "Mode 1"
            when: control.checked

            PropertyChanges {
                target: rectangle1
                color: "#f6ff00"
            }

            PropertyChanges {
                target: control
                mode: 1
            }

            PropertyChanges {
                target: rectangle
                color: "#26494949"
            }

            PropertyChanges {
                target: lowBeamIcon
                opacity: 1
                focusPolicy: Qt.NoFocus
                enabled: false
                icon.color: "#000000"
            }

            PropertyChanges {
                target: lightMode1Icon
                enabled: false
                focusPolicy: Qt.NoFocus
            }

        },
        State {
            name: "Mode 2"
            when: !control.checked

            PropertyChanges {
                target: rectangle
                color: "#f6ff00"
            }

            PropertyChanges {
                target: control
                height: 82
                mode: 0
            }

            PropertyChanges {
                target: rectangle1
                color: "#26494949"
            }

            PropertyChanges {
                target: lightMode1Icon
                opacity: 1
                checkable: false
                focusPolicy: Qt.NoFocus
                enabled: false
                highlighted: false
                icon.color: "#000000"
            }

            PropertyChanges {
                target: lowBeamIcon
                focusPolicy: Qt.NoFocus
                enabled: false
            }

        }
    ]
}
