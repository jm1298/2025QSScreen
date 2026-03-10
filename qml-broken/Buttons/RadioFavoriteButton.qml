

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
    width: 254
    height: 100

    leftPadding: 4
    rightPadding: 4

    text: "102.8"
    property alias text2Text: text2.text
    bottomPadding: 20
    font.capitalization: Font.MixedCase
    font.styleName: "Regular"
    font.weight: Font.DemiBold
    font.pointSize: 40
    hoverEnabled: false
    flat: true
    icon.color: "#0f0f0f"
    highlighted: false
    icon.cache: true
    icon.height: 75
    icon.width: 75
    icon.source: "../../images/SpeakerUp.png"
    display: AbstractButton.TextOnly

    background: buttonBackground
    Rectangle {
        id: buttonBackground
        color: "#001164d7"
        implicitWidth: 100
        implicitHeight: 40
        opacity: enabled ? 1 : 0.3
        visible: true
        radius: 0
        border.color: "#0b0b0b"
        border.width: 2
    }

    Text {
        id: text1
        y: 69
        text: qsTr("FM")
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        font.pixelSize: 20
        font.weight: Font.DemiBold
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Text {
        id: text2
        x: 229
        text: qsTr("1")
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.rightMargin: 10
        anchors.topMargin: 0
        font.pixelSize: 25
        font.weight: Font.DemiBold
    }

    states: [
        State {
            name: "normal"
            when: !control.down

            PropertyChanges {
                target: buttonBackground
                color: "#001164d7"
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
