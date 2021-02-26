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
            Layout.preferredHeight: screenHight * 0.85
            Layout.preferredWidth: screenWidth
            currentIndex: 1

            Page1{}
            Page2{}
            Page3{}

        }
        Row {
            id: statusBar
            Layout.preferredHeight: screenHight * 0.15
            Layout.preferredWidth: screenWidth
            spacing: 10
            anchors.left: parent.left
            Text {
                id: lblStatus
                height: statusBar.height  - (statusBar.height * 0.25) / 2
                text: qsTr("Normal Running State")
                font.pixelSize: statusBar.height * 0.25
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.left: parent.left
                rightPadding: 10
                leftPadding: 10
                textFormat: Text.PlainText
            }
            Row {
                id: iconBar
                x: (screenWidth - iconBar.width) * 0.5
                spacing: 10
                RoundButton {
                    id: btnFan
                    width: statusBar.height * 0.85
                    height: statusBar.height * 0.85
                    padding: 0
                    rightPadding: 0
                    bottomPadding: 0
                    topPadding: 0
                    icon.color: "transparent"
                    icon.width: statusBar.height * 0.85
                    icon.height: statusBar.height * 0.85
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
                    width: statusBar.height * 0.85
                    height: statusBar.height * 0.85
                    padding: 0
                    rightPadding: 0
                    bottomPadding: 0
                    topPadding: 0
                    icon.color: "transparent"
                    icon.width: statusBar.height * 0.85
                    icon.height: statusBar.height * 0.85
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
                    width: statusBar.height * 0.85
                    height: statusBar.height * 0.85
                    padding: 0
                    rightPadding: 0
                    bottomPadding: 0
                    topPadding: 0
                    icon.color: "transparent"
                    icon.width: statusBar.height * 0.85
                    icon.height: statusBar.height * 0.85
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
                    width: statusBar.height * 0.85
                    height: statusBar.height * 0.85
                    padding: 0
                    rightPadding: 0
                    bottomPadding: 0
                    topPadding: 0
                    icon.color: "transparent"
                    icon.width: statusBar.height * 0.85
                    icon.height: statusBar.height * 0.85
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
                    width: statusBar.height * 0.85
                    height: statusBar.height * 0.85
                    padding: 0
                    rightPadding: 0
                    bottomPadding: 0
                    topPadding: 0
                    icon.color: "transparent"
                    icon.width: statusBar.height * 0.85
                    icon.height: statusBar.height * 0.85
                    icon.source: "images/offplug.png"
                    onPressed: {
                        btnPlug.icon.source = "file:///" + applicationDirPath + "/../images/plug.png"
                    }
                    onReleased: {
                        btnPlug.icon.source = "file:///" + applicationDirPath + "/../images/offplug.png"
                    }
                    onClicked: {
                        request('http://192.168.1.45:8080/command?data=UDYwIFIxIFQw', function (o) {

                                                // log the json response
                                                console.log(o.responseText);

    //                                            // translate response into object
    //                                            var d = eval('new Object(' + o.responseText + ')');

    //                                            // access elements inside json object with dot notation
    //                                            emailLabel.text = d.email
    //                                            urlLabel.text = d.url
    //                                            sinceLabel.text = d.since
    //                                            bioLabel.text = d.bio

                                            });
                    }
                }
            }

            Text {
                id: lblDateTime
                height: statusBar.height  - (statusBar.height * 0.25) / 2
                font.pixelSize: statusBar.height * 0.25
                anchors.right: parent.right
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
    // this function is included locally, but you can also include separately via a header definition
    function request(url, callback) {
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = (function(myxhr) {
            return function() {
                callback(myxhr);
            }
        })(xhr);
        xhr.open('GET', url, true);
        xhr.send('');
    }
}


