import QtQuick 2.15

Item {
    id: item1
    width: 80
    height: 80
    property int sound: 0

    Image {
        id: image
        width: 80
        height: 80
        source: "../../images/SpeakerUp.png"
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: image1
        width: 80
        height: 80
        visible: false
        source: "../../images/SpeakerDown.png"
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: image2
        width: 80
        height: 80
        visible: false
        source: "../../images/SpeakerMute.png"
        fillMode: Image.PreserveAspectFit
    }
    states: [
        State {
            name: "State1"
            when: item1.sound = 1

            PropertyChanges {
                target: image2
                visible: false
            }

            PropertyChanges {
                target: image1
                visible: true
            }

            PropertyChanges {
                target: image
                visible: false
            }
        },
        State {
            name: "State2"
            when: item1.sound = 2

            PropertyChanges {
                target: image2
                visible: true
            }

            PropertyChanges {
                target: image1
                visible: false
            }

            PropertyChanges {
                target: image
                visible: false
            }
        }
    ]
}
