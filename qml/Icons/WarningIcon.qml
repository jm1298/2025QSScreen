

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
    height: 151
    opacity: 0.5

    leftPadding: 4
    rightPadding: 4
    text: "My Button"

    states: [
        State {
            name: "On"

            PropertyChanges {
                target: control
                opacity: 1
                state: ""
                flat: true
                focusPolicy: Qt.NoFocus
                focus: false
                enabled: false
                smooth: true
                highlighted: false
                hoverEnabled: false
                icon.color: "#ffa700"
            }
        }
    ]
    flat: true
    icon.color: "#0f0f0f"
    highlighted: false
    icon.cache: true
    icon.height: 150
    icon.width: 150
    icon.source: "../../images/Warning.png"
    display: AbstractButton.IconOnly

}
