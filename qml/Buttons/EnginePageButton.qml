

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
    width: 180
    height: 184.6

    leftPadding: 4
    rightPadding: 4

    text: ""
    flat: true
    icon.color: "#0f0f0f"
    highlighted: false
    icon.cache: true
    icon.height: 100
    icon.width: 100
    icon.source: "../../images/Settings.png"
    display: AbstractButton.TextOnly

    background: buttonBackground
    Rectangle {
        id: buttonBackground
        color: "#1164d7"
        implicitWidth: 100
        implicitHeight: 40
        opacity: enabled ? 1 : 0.3
        radius: 15
        border.color: "#0b0b0b"
        border.width: 3
    }

    Image {
        id: engine_shadow
        x: 22
        y: 44
        width: 136
        height: 97
        source: "../../images/engine_shadow.png"
        fillMode: Image.PreserveAspectFit
    }

    Text {
        id: text1
        x: 52
        y: 136
        color: "#ffffff"
        text: "Engine"
        font.pixelSize: 25
        horizontalAlignment: Text.AlignHCenter
        font.weight: Font.DemiBold
    }

    states: [
        State {
            name: "normal"
            when: !control.down

            PropertyChanges {
                target: buttonBackground
                color: "#387bd7"
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



