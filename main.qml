import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.VirtualKeyboard 2.4
import QtQuick.Layouts 1.0

ApplicationWindow {
    id: window
    width: 800
    height: 480
    visible: true

    InputPanel {
        id: inputPanel
        z: 99
        x: 0
        y: window.height
        width: window.width

        states: State {
            name: "visible"
            when: inputPanel.active
            PropertyChanges {
                target: inputPanel
                y: window.height - inputPanel.height
            }
        }
        transitions: Transition {
            from: ""
            to: "visible"
            reversible: true
            ParallelAnimation {
                NumberAnimation {
                    properties: "y"
                    duration: 250
                    easing.type: Easing.InOutQuad
                }
            }
        }
    }

    ColumnLayout {
        x: 0
        y: 0

        SwipeView {
            id: swipeView
            Layout.preferredHeight: 400
            Layout.preferredWidth: 800

            Item {
                TextInput {
                    id: textInput
                    x: 159
                    y: 45
                    width: 80
                    height: 20
                    text: qsTr("Maru-san")
                    font.pixelSize: 16
                }

                Text {
                    id: lblPetName
                    x: 91
                    y: 45
                    text: qsTr("PetName")
                    font.pixelSize: 16
                    minimumPointSize: 16
                    minimumPixelSize: 16
                    rotation: 0.665
                }
            }

            Item {
                Text {
                    id: lblShiro
                    x: 91
                    y: 45
                    text: qsTr("Shiro")
                    font.pixelSize: 16
                    minimumPointSize: 16
                    minimumPixelSize: 16
                    rotation: 0.665
                }
            }
        }

        Row {
            Layout.preferredHeight: 70
            Layout.preferredWidth: 800
            spacing: 10

            Text {
                id: lblStatus
                height: 60
                text: qsTr("Normal Running State")
                font.pixelSize: 20
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                rightPadding: 10
                leftPadding: 10
                textFormat: Text.PlainText
            }

            RoundButton {
                id: btnFan
                width: 60
                height: 60
                padding: 0
                rightPadding: 0
                bottomPadding: 0
                topPadding: 0
                icon.color: "transparent"
                icon.width: 80
                icon.height: 80
                icon.source: "images/offgreenfan.png"
                onPressed: {
                    btnFan.icon.source = "file:///" + applicationDirPath + "/../images/greenfan.png"
                }
                onReleased: {
                    btnFan.icon.source = "file:///" + applicationDirPath + "/../images/offgreenfan.png"
                }
            }

            RoundButton {
                id: btnPeltier
                width: 60
                height: 60
                padding: 0
                rightPadding: 0
                bottomPadding: 0
                topPadding: 0
                icon.color: "transparent"
                icon.width: 80
                icon.height: 80
                icon.source: "images/offgreenice.png"
                onPressed: {
                    btnPeltier.icon.source = "file:///" + applicationDirPath + "/../images/greenice.png"
                }
                onReleased: {
                    btnPeltier.icon.source = "file:///" + applicationDirPath + "/../images/offgreenice.png"
                }
            }

            RoundButton {
                id: btnNeoPixel
                width: 60
                height: 60
                padding: 0
                rightPadding: 0
                bottomPadding: 0
                topPadding: 0
                icon.color: "transparent"
                icon.width: 80
                icon.height: 80
                icon.source: "images/offneopixel.png"
                onPressed: {
                    btnNeoPixel.icon.source = "file:///" + applicationDirPath + "/../images/neopixel.png"
                }
                onReleased: {
                    btnNeoPixel.icon.source = "file:///" + applicationDirPath + "/../images/offneopixel.png"
                }
            }

            RoundButton {
                id: btnLamp
                width: 60
                height: 60
                padding: 0
                rightPadding: 0
                bottomPadding: 0
                topPadding: 0
                icon.color: "transparent"
                icon.width: 80
                icon.height: 80
                icon.source: "images/offlamp.png"
                onPressed: {
                    btnLamp.icon.source = "file:///" + applicationDirPath + "/../images/yellolamp.png"
                }
                onReleased: {
                    btnLamp.icon.source = "file:///" + applicationDirPath + "/../images/offlamp.png"
                }
            }

            RoundButton {
                id: btnPlug
                width: 60
                height: 60
                padding: 0
                rightPadding: 0
                bottomPadding: 0
                topPadding: 0
                icon.color: "transparent"
                icon.width: 80
                icon.height: 80
                icon.source: "images/offplug.png"
                onPressed: {
                    btnPlug.icon.source = "file:///" + applicationDirPath + "/../images/plug.png"
                    serial.sendCommand("P50", 0, false);
                }
                onReleased: {
                    btnPlug.icon.source = "file:///" + applicationDirPath + "/../images/offplug.png"
                }
            }

            Text {
                id: lblDateTime
                height: 60
                font.pixelSize: 20
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                rightPadding: 10
                leftPadding: 10
                textFormat: Text.PlainText
                Timer {
                   interval: 1000
                   running: true
                   repeat: true
                   onTriggered: {
                       var currentdate = new Date();
                       var datetime = currentdate.getDate() + "/"
                                       + (currentdate.getMonth()+1)  + "/"
                                       + currentdate.getFullYear() + " "
                                       + currentdate.getHours() + ":"
                                       + currentdate.getMinutes() + ":"
                                       + currentdate.getSeconds();
                       lblDateTime.text = datetime;
                   }
                }
            }

        }
    }
}


