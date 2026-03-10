

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick 2.15
import QtQuick.Controls 2.15

Button {
    id: maintenanceButton
    width: 180
    height: 184.6

    leftPadding: 4
    rightPadding: 4

    text: ""
    flat: false
    icon.color: "#ffffff"
    highlighted: false
    icon.cache: true
    icon.height: 100
    icon.width: 100
    icon.source: "../../images/Light.png"
    display: AbstractButton.TextOnly

    background: buttonBackground
    Rectangle {
        id: buttonBackground
        color: "#8c8c8c"
        implicitWidth: 100
        implicitHeight: 40
        opacity: enabled ? 1 : 0.3
        radius: 15
        border.color: "#000000"
        border.width: 3
    }

    Image {
        id: image
        width: 135
        height: 135
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: -10
        source: "../../images/wrench.png"
        sourceSize.height: 120
        sourceSize.width: 120
        anchors.horizontalCenter: parent.horizontalCenter
        fillMode: Image.PreserveAspectFit
    }

    Text {
        id: text1
        x: 15
        y: 136
        color: "#ffffff"
        text: "Maintenance"
        font.pixelSize: 25
        horizontalAlignment: Text.AlignHCenter
        font.weight: Font.DemiBold
    }




    states: [
        State {
            name: "normal"
            when: !maintenanceButton.down

            PropertyChanges {
                target: buttonBackground
                color: "#8c8c8c"
                border.color: "#0b0b0b"
            }

            PropertyChanges {
                target: maintenanceButton
                icon.color: "#ffffff"
                highlighted: false
                flat: false
            }
        },
        State {
            name: "down"
            when: maintenanceButton.down

            PropertyChanges {
                target: buttonBackground
                color: "#474747"
                border.color: "#00000000"
            }

            PropertyChanges {
                target: maintenanceButton
                icon.color: "#ffffff"
                highlighted: false
                flat: false
            }
        }
    ]
}
