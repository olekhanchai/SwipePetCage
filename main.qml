import QtQuick 2.11
import QtQuick.Controls 2.2
import QtQuick.VirtualKeyboard 2.2
import QtQuick.Layouts 1.0

ApplicationWindow {
    id: window
    width: screenWidth
    height: screenHight
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
            Layout.preferredHeight: screenHight - (screenHight / 6)
            Layout.preferredWidth: screenWidth
            currentIndex: 1

            Page1Form{}
            Page2Form{}
            Page3Form{}

        }

        Row {
            Layout.preferredHeight: (screenHight / 6)
            Layout.preferredWidth: screenWidth
            spacing: 10

            Text {
                id: lblStatus
                height: screenHight / 6
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
                width: screenHight / 10
                height: screenHight / 10
                padding: 0
                rightPadding: 0
                bottomPadding: 0
                topPadding: 0
                icon.color: "transparent"
                icon.width: screenHight / 10
                icon.height: screenHight / 10
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
                width: screenHight / 10
                height: screenHight / 10
                padding: 0
                rightPadding: 0
                bottomPadding: 0
                topPadding: 0
                icon.color: "transparent"
                icon.width: screenHight / 10
                icon.height: screenHight / 10
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
                width: screenHight / 10
                height: screenHight / 10
                padding: 0
                rightPadding: 0
                bottomPadding: 0
                topPadding: 0
                icon.color: "transparent"
                icon.width: screenHight / 10
                icon.height: screenHight / 10
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
                width: screenHight / 10
                height: screenHight / 10
                padding: 0
                rightPadding: 0
                bottomPadding: 0
                topPadding: 0
                icon.color: "transparent"
                icon.width: screenHight / 10
                icon.height: screenHight / 10
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
                width: screenHight / 10
                height: screenHight / 10
                padding: 0
                rightPadding: 0
                bottomPadding: 0
                topPadding: 0
                icon.color: "transparent"
                icon.width: screenHight / 10
                icon.height: screenHight / 10
                icon.source: "images/offplug.png"
                onPressed: {
                    btnPlug.icon.source = "file:///" + applicationDirPath + "/../images/plug.png"
                }
                onReleased: {
                    btnPlug.icon.source = "file:///" + applicationDirPath + "/../images/offplug.png"
                }
            }

            Text {
                id: lblDateTime
                height: screenHight / 10
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


