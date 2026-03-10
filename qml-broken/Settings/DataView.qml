import QtQuick 6.5
import QtQuick.Timeline 1.0
import QtQuick.Layouts

import "images"

Rectangle {
    id: mainRectangle
    width: 1520
    height: 980

    //property alias stackIndex: stacklayoutengoil.currentIndex       //for main to comm. with child

    signal requestStackChange(int newIndex)                         //for child to comm. with main

/*
    Image {
        id: newTestBackround9
        anchors.top: parent.top
        anchors.left: parent.left
        source: "../../images/NewTestBackround.png"
        fillMode: Image.PreserveAspectFit


    }*/

    Rectangle {
        id: topBar
        anchors.top: parent.top
        anchors.topMargin: 150

        anchors.left: parent.left

        width: parent.width
        height: 5
        color: "#000000"

        Rectangle {
            id: sensorBar0
            anchors.top: parent.top
            anchors.topMargin: 55

            anchors.left: parent.left

            width: parent.width
            height: 5
            color: "#000000"

            Text {
                id: sensorNumber1
                text: "1"
                color: "#0b0b0b"
                font.pixelSize: 30
                horizontalAlignment: Text.AlignRight
                font.italic: false
                font.bold: true
                font.weight: Font.DemiBold

                anchors.right: parent.left
                anchors.rightMargin: -70
                anchors.bottom: parent.top
                anchors.bottomMargin: 5
            }

            Rectangle {
                id: sensorBar1
                anchors.top: parent.top
                anchors.topMargin: 55

                anchors.left: parent.left

                width: parent.width
                height: 5
                color: "#000000"

                Text {
                    id: sensorNumber2
                    text: "2"
                    color: "#0b0b0b"
                    font.pixelSize: 30
                    horizontalAlignment: Text.AlignRight
                    font.italic: false
                    font.bold: true
                    font.weight: Font.DemiBold

                    anchors.right: parent.left
                    anchors.rightMargin: -70
                    anchors.bottom: parent.top
                    anchors.bottomMargin: 5
                }

                Rectangle {
                    id: sensorBar2
                    anchors.top: parent.top
                    anchors.topMargin: 55

                    anchors.left: parent.left

                    width: parent.width
                    height: 5
                    color: "#000000"

                    Text {
                        id: sensorNumber3
                        text: "3"
                        color: "#0b0b0b"
                        font.pixelSize: 30
                        horizontalAlignment: Text.AlignRight
                        font.italic: false
                        font.bold: true
                        font.weight: Font.DemiBold

                        anchors.right: parent.left
                        anchors.rightMargin: -70
                        anchors.bottom: parent.top
                        anchors.bottomMargin: 5
                    }

                    Rectangle {
                        id: sensorBar3
                        anchors.top: parent.top
                        anchors.topMargin: 55

                        anchors.left: parent.left

                        width: parent.width
                        height: 5
                        color: "#000000"

                        Text {
                            id: sensorNumber4
                            text: "4"
                            color: "#0b0b0b"
                            font.pixelSize: 30
                            horizontalAlignment: Text.AlignRight
                            font.italic: false
                            font.bold: true
                            font.weight: Font.DemiBold

                            anchors.right: parent.left
                            anchors.rightMargin: -70
                            anchors.bottom: parent.top
                            anchors.bottomMargin: 5
                        }

                        Rectangle {
                            id: sensorBar4
                            anchors.top: parent.top
                            anchors.topMargin: 55

                            anchors.left: parent.left

                            width: parent.width
                            height: 5
                            color: "#000000"

                            Text {
                                id: sensorNumber5
                                text: "5"
                                color: "#0b0b0b"
                                font.pixelSize: 30
                                horizontalAlignment: Text.AlignRight
                                font.italic: false
                                font.bold: true
                                font.weight: Font.DemiBold

                                anchors.right: parent.left
                                anchors.rightMargin: -70
                                anchors.bottom: parent.top
                                anchors.bottomMargin: 5
                            }

                            Rectangle {
                                id: sensorBar5
                                anchors.top: parent.top
                                anchors.topMargin: 55

                                anchors.left: parent.left

                                width: parent.width
                                height: 5
                                color: "#000000"

                                Text {
                                    id: sensorNumber6
                                    text: "6"
                                    color: "#0b0b0b"
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignRight
                                    font.italic: false
                                    font.bold: true
                                    font.weight: Font.DemiBold

                                    anchors.right: parent.left
                                    anchors.rightMargin: -70
                                    anchors.bottom: parent.top
                                    anchors.bottomMargin: 5
                                }

                                Rectangle {
                                    id: sensorBar6
                                    anchors.top: parent.top
                                    anchors.topMargin: 55

                                    anchors.left: parent.left

                                    width: parent.width
                                    height: 5
                                    color: "#000000"

                                    Text {
                                        id: sensorNumber7
                                        text: "7"
                                        color: "#0b0b0b"
                                        font.pixelSize: 30
                                        horizontalAlignment: Text.AlignRight
                                        font.italic: false
                                        font.bold: true
                                        font.weight: Font.DemiBold

                                        anchors.right: parent.left
                                        anchors.rightMargin: -70
                                        anchors.bottom: parent.top
                                        anchors.bottomMargin: 5
                                    }

                                    Rectangle {
                                        id: sensorBar7
                                        anchors.top: parent.top
                                        anchors.topMargin: 55

                                        anchors.left: parent.left

                                        width: parent.width
                                        height: 5
                                        color: "#000000"

                                        Text {
                                            id: sensorNumber8
                                            text: "8"
                                            color: "#0b0b0b"
                                            font.pixelSize: 30
                                            horizontalAlignment: Text.AlignRight
                                            font.italic: false
                                            font.bold: true
                                            font.weight: Font.DemiBold

                                            anchors.right: parent.left
                                            anchors.rightMargin: -70
                                            anchors.bottom: parent.top
                                            anchors.bottomMargin: 5
                                        }

                                        Rectangle {
                                            id: sensorBar8
                                            anchors.top: parent.top
                                            anchors.topMargin: 55

                                            anchors.left: parent.left

                                            width: parent.width
                                            height: 5
                                            color: "#000000"

                                            Text {
                                                id: sensorNumber9
                                                text: "9"
                                                color: "#0b0b0b"
                                                font.pixelSize: 30
                                                horizontalAlignment: Text.AlignRight
                                                font.italic: false
                                                font.bold: true
                                                font.weight: Font.DemiBold

                                                anchors.right: parent.left
                                                anchors.rightMargin: -70
                                                anchors.bottom: parent.top
                                                anchors.bottomMargin: 5
                                            }

                                            Rectangle {
                                                id: sensorBar9
                                                anchors.top: parent.top
                                                anchors.topMargin: 55

                                                anchors.left: parent.left

                                                width: parent.width
                                                height: 5
                                                color: "#000000"

                                                Text {
                                                    id: sensorNumber10
                                                    text: "10"
                                                    color: "#0b0b0b"
                                                    font.pixelSize: 30
                                                    horizontalAlignment: Text.AlignRight
                                                    font.italic: false
                                                    font.bold: true
                                                    font.weight: Font.DemiBold

                                                    anchors.right: parent.left
                                                    anchors.rightMargin: -70
                                                    anchors.bottom: parent.top
                                                    anchors.bottomMargin: 5
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }



        Text {
            id: sensorNumber
            text: "No. "
            color: "#0b0b0b"
            font.pixelSize: 30
            horizontalAlignment: Text.AlignHCenter
            font.italic: false
            font.bold: true
            font.weight: Font.DemiBold

            anchors.left: parent.left
            anchors.leftMargin: 20
            anchors.bottom: parent.top
            anchors.bottomMargin: 5
        }


    }

    Rectangle {
        id: functionLine
        x: 88
        y: 105
        width: 5
        height: 875
        color: "#000000"

        Text {
            id: sensorFunction
            y: 3
            text: "Sensor Function"
            color: "#0b0b0b"
            font.pixelSize: 30
            horizontalAlignment: Text.AlignHCenter
            font.italic: false
            font.bold: true
            font.weight: Font.DemiBold

            anchors.left: parent.left
            anchors.leftMargin: 20

        }

        Rectangle {
            x: 359
            y: 0
            width: 5
            height: 875
            color: "#000000"

            Text {
                id: sensorRange
                y: 3
                text: "Expected Range"
                color: "#0b0b0b"
                font.pixelSize: 30
                horizontalAlignment: Text.AlignHCenter
                font.italic: false
                font.bold: true
                font.weight: Font.DemiBold

                anchors.left: parent.left
                anchors.leftMargin: 20

            }

            Rectangle {
                x: 262
                y: 0
                width: 5
                height: 875
                color: "#000000"

                Text {
                    id: sensorRaw
                    y: 3
                    text: "Raw Value"
                    color: "#0b0b0b"
                    font.pixelSize: 30
                    horizontalAlignment: Text.AlignHCenter
                    font.italic: false
                    font.bold: true
                    font.weight: Font.DemiBold

                    anchors.left: parent.left
                    anchors.leftMargin: 20

                }

                Rectangle {
                    x: 182
                    y: 0
                    width: 5
                    height: 875
                    color: "#000000"

                    Text {
                        id: sensorMultiplier
                        y: 3
                        text: "Multiplier"
                        color: "#0b0b0b"
                        font.pixelSize: 30
                        horizontalAlignment: Text.AlignHCenter
                        font.italic: false
                        font.bold: true
                        font.weight: Font.DemiBold

                        anchors.left: parent.left
                        anchors.leftMargin: 20

                    }

                    Rectangle {
                        x: 174
                        y: 0
                        width: 5
                        height: 875
                        color: "#000000"

                        Text {
                            id: calcdValue
                            y: 3
                            text: "Calculated Value"
                            color: "#0b0b0b"
                            font.pixelSize: 30
                            horizontalAlignment: Text.AlignHCenter
                            font.italic: false
                            font.bold: true
                            font.weight: Font.DemiBold

                            anchors.left: parent.left
                            anchors.leftMargin: 20

                        }
                    }
                }


            }
        }

    }


}


