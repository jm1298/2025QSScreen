


import QtQuick 2.15
import QtQuick.Controls 2.15

Button {
    id: control
    width: 80
    height: 80

    leftPadding: 4
    rightPadding: 4

    text: "My Button"
    hoverEnabled: false
    flat: true
    icon.color: "#0f0f0f"
    highlighted: false
    icon.cache: true
    icon.height: 75
    icon.width: 75
    icon.source: "../../images/SpeakerDown.png"
    display: AbstractButton.IconOnly

    background: buttonBackground
    Rectangle {
        id: buttonBackground
        color: "#1164d7"
        implicitWidth: 100
        implicitHeight: 40
        opacity: enabled ? 1 : 0.3
        visible: false
        radius: 15
        border.color: "#0b0b0b"
        border.width: 4
    }

    states: [
        State {
            name: "normal"
            when: !control.down

            PropertyChanges {
                target: buttonBackground
                color: "#1164d7"
                border.color: "#000000"
            }

            PropertyChanges {
                target: control
                icon.color: "#494949"
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
