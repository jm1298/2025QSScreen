

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick 2.15
import QtQuick.Controls 2.15

Button {
    id: control
    width: 120
    height: 80

    leftPadding: 4
    rightPadding: 4

    text: ""
    hoverEnabled: false
    flat: true
    icon.color: "#0f0f0f"
    highlighted: false
    icon.cache: true
    icon.height: 200
    icon.width: 200
    icon.source: "../../images/Steering.png"
    display: AbstractButton.TextOnly

    background: buttonBackground
    Rectangle {
        id: buttonBackground
        color: "#8c8c8c"
        implicitWidth: 100
        implicitHeight: 40
        opacity: enabled ? 1 : 0.3
        radius: 15
        border.color: "#0b0b0b"
        border.width: 1
    }

    Rectangle {
        id: rectangle
        width: 5
        height: 60
        color: "#000000"
        anchors.verticalCenter: parent.verticalCenter
        rotation: 45
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Rectangle {
        id: rectangle1
        width: 5
        height: 60
        color: "#000000"
        anchors.verticalCenter: parent.verticalCenter
        rotation: -45
        anchors.horizontalCenter: parent.horizontalCenter
    }

    states: [
        State {
            name: "normal"
            when: !control.down

            PropertyChanges {
                target: buttonBackground
                color: "#8c8c8c"
                border.color: "#000000"
            }

            PropertyChanges {
                target: control
                icon.color: "#ffffff"
                highlighted: false
                flat: false
            }
        },
        State {
            name: "down"
            when: control.down

            PropertyChanges {
                target: buttonBackground
                color: "#7d7d7d"
                border.color: "#00000000"
            }

            PropertyChanges {
                target: control
                icon.color: "#ffffff"
                highlighted: false
                flat: false
            }
        }
    ]
}
