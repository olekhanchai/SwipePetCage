import QtQuick 2.11
import QtQuick.Controls 2.2
import QtQuick.VirtualKeyboard 2.2
import QtQuick.Layouts 1.0
import Qt.labs.settings 1.1

ApplicationWindow {
    id: window
    width: screenWidth
    height: screenHight
    visible: true
    visibility: "FullScreen"
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
        y: 15
        Row {
            width: parent.width
            height: statusBar.height
            id: titleBar
            Layout.preferredHeight: screenHight * 0.1
            Layout.preferredWidth: screenWidth

            Text {
                id: lblDateTime
                height: screenHight * 0.1
                font.pixelSize: statusBar.height * 0.4
                anchors.left: parent.left
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                textFormat: Text.PlainText
                Timer {
                   interval: 1000
                   running: true
                   repeat: true
                   onTriggered: {
                       var currentdate = new Date();
                       var datetime = String(currentdate.getDate()).padStart(2,'0') + "/"
                                       + String((currentdate.getMonth()+1)).padStart(2,'0')  + "/"
                                       + String(currentdate.getFullYear()).padStart(2,'0') + " "
                                       + String(currentdate.getHours()).padStart(2,'0') + ":"
                                       + String(currentdate.getMinutes()).padStart(2,'0') + ":"
                                       + String(currentdate.getSeconds()).padStart(2,'0');
                       lblDateTime.text = datetime;
                   }
                }
            }

            Image {
                id: claw
                source: 'images/claw.png'
                x: parent.width * 0.5 + 17
                y: (parent.height - claw.height) * 0.5
                width: 120
                height: 40
                Label {
                    id: lblName
                    height: screenHight * 0.1 + 15
                    text: qsTr("Name")
                    font.pixelSize: statusBar.height * 0.2
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.left: parent.left
                    leftPadding: 50
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        inputPanel.active = !inputPanel.active;
                    }
                }
            }

            Rectangle {
                x: claw.x + claw.width + 20
                id: recName
                y: -5
                width: screenWidth / 3
                height: screenHight * 0.1
                color: "#64F03C"
                radius: 15
                TextInput {
                    id: statusTextName
                    anchors.fill: parent
                    font.pixelSize: statusBar.height * 0.5
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    Keys.onReleased: {
                        if (event.key === Qt.Key_Return) {
                            inputPanel.active = false;
                            claw.forceActiveFocus();
                            if (statusTextName.text == "") {
                                lblCounter.cntUsage = 0;
                            }
                            setting.sync();
                        }
                    }
                    Settings {
                        id: settingName
                        fileName: "Settings.dat"
                        category: "Commons"
                        property alias petName: statusTextName.text
                    }
                }
            }
        }
        SwipeView {
            id: swipeView
            width: screenWidth
            height: screenHeight * 0.75
            Layout.preferredHeight: screenHight * 0.75
            Layout.preferredWidth: screenWidth
            currentIndex: 1
            Page1{}
            Page2{}
            Page3{}
            Page4{}
            Page5{}
        }
        Row {
            id: statusBar
            Layout.preferredHeight: screenHight * 0.15
            Layout.preferredWidth: screenWidth
            spacing: 10

            Image {
                height: 70
                width: 400
                source: 'images/hospitallogo.png'
                anchors.left: parent.left
            }

            Text {
                id: lblCounter
                height: screenHight * 0.1 + 30
                font.pixelSize: statusBar.height * 0.4
                anchors.right: parent.right
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                textFormat: Text.PlainText
                property double cntUsage: 0
                text: "Usaged : " + (cntUsage/60).toFixed(2) + " hrs "

                Settings {
                    id: settingCounter
                    fileName: "Settings.dat"
                    category: "Commons"
                    property alias timeUsaged: lblCounter.cntUsage
                }

                Timer {
                   interval: 60000
                   running: true
                   repeat: true
                   onTriggered: {
                       lblCounter.cntUsage++;
                       settingCounter.sync();
                   }
                }
            }

        }
    }

    MouseArea {
        anchors.fill: parent
        enabled: false
        cursorShape: Qt.BlankCursor
    }

    Label {
        id: curTempValue
        visible: false
    }

    Label {
        id: curHumidValue
        visible: false
    }

    Label {
        id: curO2Value
        visible: false
    }

    Label {
        id: curCo2Value
        visible: false
    }

    // this function is included locally, but you can also include separately via a header definition
//    function request(url, callback) {
//        var xhr = new XMLHttpRequest();
//        xhr.onreadystatechange = (function(myxhr) {
//            return function() {
//                callback(myxhr);
//            }
//        })(xhr);
//        xhr.open('GET', url, true);
//        xhr.send('');
//    }
//    Timer {
//       interval: 60000
//       running: true
//       repeat: true
//       onTriggered: {
//            console.log("save data to database server")
//       }
//    }
}


