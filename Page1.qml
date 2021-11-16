import QtQuick 2.1
import QtQuick.Controls 2.14
import Qt.labs.settings 1.1

Page {
    width: screenWidth
    height: screenHight

    Grid {
        id: grid
        x: 0
        y: 0
        width: screenWidth
        height: screenHight * 0.75
        Image {
            id: imageTemp
            width: grid.width * 0.5
            height: grid.height * 0.5
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.topMargin: 0
            source: "images/RGBbg.png"
            fillMode: Image.Stretch
            Rectangle {
                id: neo1
                x: 0
                y: 0
                width: imageTemp.width / 3
                height: imageTemp.height / 6
                color: "#F0BF06"
                radius: 10
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        request('http://'+ ipAddress +':5000/neopixel/240/191/96', function (o) {
                            console.log(o.responseText);
                            var errorText = '';
                        });
                    }
                }
            }
            Rectangle {
                id: neo2
                x: neo1.width
                y: 0
                width: imageTemp.width / 3
                height: imageTemp.height / 6
                color: "#7FFFD4"
                radius: 10
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        request('http://'+ ipAddress +':5000/neopixel/127/255/212', function (o) {
                            console.log(o.responseText);
                            var errorText = '';
                        });
                    }
                }
            }
            Rectangle {
                id: neo3
                x: neo2.width + neo2.x
                y: 0
                width: imageTemp.width / 3
                height: imageTemp.height / 6
                color: "#FFFFFF"
                radius: 10
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        request('http://'+ ipAddress +':5000/neopixel/255/255/255', function (o) {
                            console.log(o.responseText);
                            var errorText = '';
                        });
                    }
                }
            }
            Label {
                id: lblRGB
                x: (imageTemp.width - lblRGB.width) * 0.5
                y: neo1.height * 1.5
                font.family: "Helvetica"
                font.pointSize: 40
                text: "RGB"
            }

            Label {
                id: lblRGBDesc
                x: (imageTemp.width - lblRGBDesc.width) * 0.5
                y: lblRGB.height + (lblRGBDesc.height * 2) + 15
                font.family: "Helvetica"
                font.pointSize: 10
                text: "Select color for neopixel light."
            }

            Label {
                id: lblRGBCurVal
                x: imageTemp.width * 0.5 + lblRGB.width
                y: lblRGB.y + lblRGB.height * 0.5
                font.family: "Helvetica"
                font.pointSize: 18
                text: sliderRgb.value + "%"
            }

            Image {
                id: wheelColor
                x: lblRGB.x - wheelColor.width - 7
                y: lblRGB.y + neo1.height * 0.55 - 7
                width: imageTemp.height * 0.25
                height: imageTemp.height * 0.25
                source: "images/wheel.png"
            }
            Slider {
                id: sliderRgb
                x: neo1.width * 0.5
                y: lblRGBDesc.y + (lblRGBDesc.height * 0.85)
                z: 99
                height: lblRGB.height
                width: neo1.width * 2
                orientation: Qt.Horizontal
                from: 0
                stepSize: 5
                live: true
                to: 100
                snapMode: Slider.SnapAlways

                Settings {
                    id: settingRGB
                    fileName: "Settings.dat"
                    category: "Controls"
                    property alias rgbVal: sliderRgb.value
                }

                onMoved: {
                    request('http://'+ ipAddress +':5000/neopixel/' + (sliderRgb.value * 2.5) + '/' + (sliderRgb.value * 2.5) + '/' + (sliderRgb.value * 2.5), function (o) {
                        console.log(o.responseText);
                        var errorText = '';
                    });

                    settingRGB.sync();
                }
            }

        }

        Image {
            id: imageHumid
            x: grid.width / 2
            y: grid.height / 2
            z: 99
            width: grid.width / 2
            height: grid.height / 2
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.rightMargin: 0
            anchors.topMargin: 0
            source: "images/IONbg.png"

            Label {
                id: lblIonize
                x: (imageHumid.width - lblIonize.width) * 0.5
                y: neo1.height * 1.5
                font.family: "Helvetica"
                font.pointSize: 40
                text: "ION"
            }

            Label {
                id: lblIonizeDesc
                x:  (imageHumid.width - lblIonizeDesc.width) * 0.5
                y: lblRGB.height + (lblRGBDesc.height * 2) + 15
                font.family: "Helvetica"
                font.pointSize: 10
                text: "Turn on/off ionize module."
            }

            Label {
                id: lblIonizeOff
                x: imageTemp.width * 0.8
                y: lblRGB.height + (lblIonizeDesc.height * 2) - 7
                font.family: "Helvetica"
                font.pointSize: 10
                text: "Off"
            }

            Label {
                id: lblIonizeOn
                x: imageTemp.width * 0.8
                y: neo1.height * 1.5 + 3
                font.family: "Helvetica"
                font.pointSize: 10
                text: "On"
            }

            Image {
                id: ionic
                x: lblIonize.x - ionic.width - 7
                y: lblRGB.y + neo1.height * 0.55 - 7
                width: imageHumid.height * 0.25
                height: imageHumid.height * 0.25
                source: "images/ionic.png"
            }
            Rectangle {
                id: recIonic
                x: imageHumid.width * 0.875 - 2
                y: neo1.height * 1.7 - 10
                width: 40
                height: lblRGB.height + 10
                color: "#ffffff"
                radius: 15
            }
            Slider {
                id: sliderIonic
                x: imageTemp.width * 0.875
                y: neo1.height * 1.7
                height: lblRGB.height
                orientation: Qt.Vertical
                from: 0
                stepSize: 1
                live: true
                to: 1
                snapMode: Slider.SnapAlways

                Settings {
                    id: settingIonic
                    fileName: "Settings.dat"
                    category: "Controls"
                    property alias ionicVal: sliderIonic.value
                }

                onMoved: {
                    if (sliderIonic.value) {
                        request('http://' + ipAddress + ':5000/relay/2/0', function (o) {
                            console.log(o.responseText);
                            var errorText = '';
                        });
                    } else {
                        request('http://' + ipAddress + ':5000/relay/2/1', function (o) {
                            console.log(o.responseText);
                            var errorText = '';
                        });
                    }
                    settingIonic.sync();
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if (sliderIonic.value) {
                            sliderIonic.value = 0;
                            request('http://' + ipAddress + ':5000/relay/2/0', function (o) {
                            console.log(o.responseText);
                            var errorText = '';
                        });
                        } else {
                            sliderIonic.value = 1;
                            request('http://' + ipAddress + ':5000/relay/2/1', function (o) {
                            console.log(o.responseText);
                            var errorText = '';
                        });
                        }
                    }
                }
            }

        }

        Image {
            id: imageCO2
            width: grid.width / 2
            height: grid.height / 2
            x: 0
            y: grid.height / 2
            anchors.bottomMargin: 0
            sourceSize.height: grid.height / 2
            sourceSize.width: grid.width / 2
            fillMode: Image.Stretch
            source: "images/UVbg.png"

            Label {
                id: lblUV
                x: (imageCO2.width - lblUV.width) * 0.5
                y: neo1.height * 1.5
                font.family: "Helvetica"
                font.pointSize: 40
                text: "UV"
            }

            Label {
                id: lblUVDesc
                x: (imageCO2.width - lblUVDesc.width) * 0.5
                y: lblUV.height + (lblRGBDesc.height * 2) + 15
                font.family: "Helvetica"
                font.pointSize: 10
                text: "Turn on/off UV light."
            }

            Label {
                id: lblUVOff
                x: imageCO2.width * 0.8
                y: lblUV.height + (lblUVDesc.height * 2) - 7
                font.family: "Helvetica"
                font.pointSize: 10
                text: "Off"
            }

            Label {
                id: lblUVOn
                x: imageCO2.width * 0.8
                y: neo1.height * 1.5 + 3
                font.family: "Helvetica"
                font.pointSize: 10
                text: "On"
            }

            Image {
                id: uvlight
                x: lblUV.x - uvlight.width - 7
                y: lblUV.y + neo1.height * 0.55 - 7
                width: imageCO2.height * 0.25
                height: imageCO2.height * 0.25
                source: "images/uv.png"
            }
            Rectangle {
                id: recUV
                x: imageCO2.width * 0.875 - 2
                y: neo1.height * 1.7 - 10
                width: 40
                height: lblRGB.height + 10
                color: "#ffffff"
                radius: 15
            }
            Slider {
                id: sliderUV
                x: imageCO2.width * 0.875
                y: neo1.height * 1.7
                height: lblRGB.height
                orientation: Qt.Vertical
                from: 0
                stepSize: 1
                live: true
                to: 1
                snapMode: Slider.SnapAlways

                Settings {
                    id: settingUV
                    fileName: "Settings.dat"
                    category: "Controls"
                    property alias uvVal: sliderUV.value
                }

                onMoved: {
                    if (sliderUV.value) {
                        request('http://' + ipAddress + ':5000/relay/1/0', function (o) {
                            console.log(o.responseText);
                            var errorText = '';
                        });
                    } else {
                        request('http://' + ipAddress + ':5000/relay/1/1', function (o) {
                            console.log(o.responseText);
                            var errorText = '';
                        });
                    }
                    settingUV.sync();
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if(sliderUV.value) {
                            sliderUV.value = 0;
                            request('http://' + ipAddress + ':5000/relay/1/0', function(o) {
                            console.log(o.responseText);
                            var errorText = '';
                        });
                        } else {
                            sliderUV.value = 1;
                            request('http://' + ipAddress + ':5000/relay/1/1', function(o) {
                            console.log(o.responseText);
                            var errorText = '';
                        });
                        }
                    }
                }
            }
        }

        Image {
            id: imageO2
            x: grid.width / 2 + 1
            y: 0
            width: grid.width / 2
            height: grid.height / 2
            sourceSize.height: 200
            sourceSize.width: 400
            layer.textureMirroring: ShaderEffectSource.NoMirroring
            fillMode: Image.Stretch
            source: "images/FANbg.png"

            Label {
                id: lblFan
                x: (imageO2.width - lblFan.width) * 0.5
                y: neo1.height * 1.5
                font.family: "Helvetica"
                font.pointSize: 40
                text: "FAN"
            }

            Label {
                id: lblFanCurVal
                x: imageO2.width * 0.5 + lblFan.width
                y: lblFan.y + lblFan.height * 0.5
                font.family: "Helvetica"
                font.pointSize: 18
                text: sliderFan.value>2?"High":sliderFan.value>1?"Medium":sliderFan.value>0?"Low":"OFF"
            }

            Label {
                id: lblFanDesc
                x: (imageO2.width - lblFanDesc.width) * 0.5
                y: lblFan.height + (lblRGBDesc.height * 2) + 15
                font.family: "Helvetica"
                font.pointSize: 10
                text: "Turn on/off Fan."
            }
            Image {
                id: fan
                x: lblFan.x - fan.width - 7
                y: lblUV.y + neo1.height * 0.55 - 7
                width: imageO2.height * 0.25
                height: imageO2.height * 0.25
                source: "images/fan.png"
            }
            Slider {
                id: sliderFan
                x: neo1.width * 0.5
                y: lblRGBDesc.y + (lblRGBDesc.height * 0.85)
                z: 99
                height: lblRGB.height
                width: neo1.width * 2
                orientation: Qt.Horizontal
                from: 0
                stepSize: 1
                live: true
                to: 3
                snapMode: Slider.SnapAlways

                Settings {
                    id: settingFan
                    fileName: "Settings.dat"
                    category: "Controls"
                    property alias fanVal: sliderFan.value
                }

                onMoved: {
                    if (sliderFan.value) {
                        request('http://' + ipAddress + ':5000/relay/3/1', function (o) {
                            console.log(o.responseText);
                            var errorText = '';
                        });
                    } else {
                        request('http://' + ipAddress + ':5000/relay/3/0', function (o) {
                            console.log(o.responseText);
                            var errorText = '';
                        });
                    }
                    settingFan.sync();
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
