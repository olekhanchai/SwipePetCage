import QtQuick 2.15
import QtQuick.Controls 2.15

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
                color: "#FF0000"
                radius: 10
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        request('http://192.168.1.51:8080/command?data=UDYwIFIyNTUgRzAgQjAgVDY0', function (o) {
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
                color: "#00FF00"
                radius: 10
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        request('http://192.168.1.51:8080/command?data=UDYwIFIwIEcyNTUgQjAgVDY0', function (o) {
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
                color: "#0000FF"
                radius: 10
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        request('http://192.168.1.51:8080/command?data=UDYwIFIwIEcwIEIyNTUgVDY0', function (o) {
                            console.log(o.responseText);
                            var errorText = '';
                        });
                    }
                }
            }
            Rectangle {
                id: neo7
                x: 0
                y: imageTemp.height - neo1.height
                width: imageTemp.width / 3
                height: imageTemp.height / 6
                color: "#C800C8"
                radius: 10
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        request('http://192.168.1.51:8080/command?data=UDYwIFIyMDAgRzAgQjIwMCBUNjQ=', function (o) {
                            console.log(o.responseText);
                            var errorText = '';
                        });
                    }
                }
            }
            Rectangle {
                id: neo8
                x: neo7.width
                y: imageTemp.height - neo1.height
                width: imageTemp.width / 3
                height: imageTemp.height / 6
                color: "#32E6FF"
                radius: 10
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        request('http://192.168.1.51:8080/command?data=UDYwIFI1MCBHMjMwIEIyNTUgVDY0=', function (o) {
                            console.log(o.responseText);
                            var errorText = '';
                        });
                    }
                }
            }
            Rectangle {
                id: neo9
                x: neo8.width + neo8.x
                y: imageTemp.height - neo1.height
                width: imageTemp.width / 3
                height: imageTemp.height / 6
                color: "#FF6400"
                radius: 10
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        request('http://192.168.1.51:8080/command?data=UDYwIFIyNTUgRzEwMCBCMCBUNjQ=', function (o) {
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
                font.pointSize: 80
                text: "RGB"
            }

            Label {
                id: lblRGBDesc
                x: (imageTemp.width - lblRGBDesc.width) * 0.5
                y: lblRGB.height + (lblRGBDesc.height * 2)
                font.family: "Helvetica"
                font.pointSize: 20
                text: "Select color for neopixel light."
            }

            Label {
                id: lblRgbOff
                x: imageTemp.width * 0.8 + 20
                y: lblRGB.height + (lblRGBDesc.height * 2) - 20
                font.family: "Helvetica"
                font.pointSize: 20
                text: "-"
            }

            Label {
                id: lblRgbOn
                x: imageTemp.width * 0.8 + 20
                y: neo1.height * 1.5
                font.family: "Helvetica"
                font.pointSize: 20
                text: "+"
            }

            Label {
                id: lblRgbText
                x: imageTemp.width * 0.8 + 40
                y: recRgb.y + recRgb.height + 5
                font.family: "Helvetica"
                font.pointSize: 8
                text: "Brightness"
            }

            Image {
                id: wheelColor
                x: lblRGB.x - wheelColor.width
                y: lblRGB.y + neo1.height * 0.55
                width: imageTemp.height * 0.25
                height: imageTemp.height * 0.25
                source: "images/wheel.png"
            }
            Rectangle {
                id: recRgb
                x: imageTemp.width * 0.875 - 2
                y: neo1.height * 1.7 - 10
                width: 40
                height: lblRGB.height + 10
                color: "#ffffff"
                radius: 15
            }
            Slider {
                id: sliderRgb
                x: imageTemp.width * 0.875
                y: neo1.height * 1.7
                z: 99
                height: lblRGB.height
                orientation: Qt.Vertical
                from: 0
                stepSize: 5
                live: true
                to: 50
                snapMode: Slider.SnapAlways
                onMoved: {
                    // Create Base64 Object
                    var Base64={_keyStr:"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=",encode:function(e){var t="";var n,r,i,s,o,u,a;var f=0;e=Base64._utf8_encode(e);while(f<e.length){n=e.charCodeAt(f++);r=e.charCodeAt(f++);i=e.charCodeAt(f++);s=n>>2;o=(n&3)<<4|r>>4;u=(r&15)<<2|i>>6;a=i&63;if(isNaN(r)){u=a=64}else if(isNaN(i)){a=64}t=t+this._keyStr.charAt(s)+this._keyStr.charAt(o)+this._keyStr.charAt(u)+this._keyStr.charAt(a)}return t},decode:function(e){var t="";var n,r,i;var s,o,u,a;var f=0;e=e.replace(/[^A-Za-z0-9\+\/\=]/g,"");while(f<e.length){s=this._keyStr.indexOf(e.charAt(f++));o=this._keyStr.indexOf(e.charAt(f++));u=this._keyStr.indexOf(e.charAt(f++));a=this._keyStr.indexOf(e.charAt(f++));n=s<<2|o>>4;r=(o&15)<<4|u>>2;i=(u&3)<<6|a;t=t+String.fromCharCode(n);if(u!=64){t=t+String.fromCharCode(r)}if(a!=64){t=t+String.fromCharCode(i)}}t=Base64._utf8_decode(t);return t},_utf8_encode:function(e){e=e.replace(/\r\n/g,"\n");var t="";for(var n=0;n<e.length;n++){var r=e.charCodeAt(n);if(r<128){t+=String.fromCharCode(r)}else if(r>127&&r<2048){t+=String.fromCharCode(r>>6|192);t+=String.fromCharCode(r&63|128)}else{t+=String.fromCharCode(r>>12|224);t+=String.fromCharCode(r>>6&63|128);t+=String.fromCharCode(r&63|128)}}return t},_utf8_decode:function(e){var t="";var n=0;var r=c1=c2=0;while(n<e.length){r=e.charCodeAt(n);if(r<128){t+=String.fromCharCode(r);n++}else if(r>191&&r<224){c2=e.charCodeAt(n+1);t+=String.fromCharCode((r&31)<<6|c2&63);n+=2}else{c2=e.charCodeAt(n+1);c3=e.charCodeAt(n+2);t+=String.fromCharCode((r&15)<<12|(c2&63)<<6|c3&63);n+=3}}return t}};
                    var strEncode = 'P60 R'+sliderRgb.value+' G'+sliderRgb.value+' B'+sliderRgb.value+' T64';
                    request('http://192.168.1.51:8080/command?data='+Base64.encode(strEncode), function (o) {
                        console.log(o.responseText);
                        var errorText = '';
                    });

//                    if(sliderRgb.value) {
//                        request('http://192.168.1.51:8080/command?data=UDYwIFIwIFIwIEIwIFQ2NA==', function (o) {
//                            console.log(o.responseText);
//                            var errorText = '';
//                        });
//                    } else {
//                        request('http://192.168.1.51:8080/command?data=UDYwIFIyNTUgUjI1NSBCMjU1IFQ2NA==', function (o) {
//                            console.log(o.responseText);
//                            var errorText = '';
//                        });
//                    }
                }
            }

        }

        Image {
            id: imageHumid
            x: grid.width / 2 + 1
            width: grid.width / 2
            height: grid.height / 2
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.rightMargin: 0
            anchors.topMargin: 0
            source: "images/IONbg.png"

            Label {
                id: lblIonize
                x: (imageHumid.width - lblIonize.width) * 0.5
                y: neo1.height * 1.5
                font.family: "Helvetica"
                font.pointSize: 80
                text: "ION"
            }

            Label {
                id: lblIonizeDesc
                x:  (imageHumid.width - lblIonizeDesc.width) * 0.5
                y: lblRGB.height + (lblRGBDesc.height * 2)
                font.family: "Helvetica"
                font.pointSize: 20
                text: "Turn on/off ionize module."
            }

            Label {
                id: lblIonizeOff
                x: imageTemp.width * 0.8
                y: lblRGB.height + (lblIonizeDesc.height * 2) - 20
                font.family: "Helvetica"
                font.pointSize: 20
                text: "Off"
            }

            Label {
                id: lblIonizeOn
                x: imageTemp.width * 0.8
                y: neo1.height * 1.5
                font.family: "Helvetica"
                font.pointSize: 20
                text: "On"
            }

            Image {
                id: ionic
                x: lblIonize.x - ionic.width
                y: lblRGB.y + neo1.height * 0.55
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
                onMoved: {
                    if (sliderIonic.value) {
                        request('http://192.168.1.51:8080/command?data=UDEwIFIxIFMx', function (o) {
                            console.log(o.responseText);
                            var errorText = '';
                        });
                    } else {
                        request('http://192.168.1.51:8080/command?data=UDEwIFIxIFMw', function (o) {
                            console.log(o.responseText);
                            var errorText = '';
                        });
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
                font.pointSize: 80
                text: "UV"
            }

            Label {
                id: lblUVDesc
                x: (imageCO2.width - lblUVDesc.width) * 0.5
                y: lblUV.height + (lblRGBDesc.height * 2)
                font.family: "Helvetica"
                font.pointSize: 20
                text: "Turn on/off UV light."
            }

            Label {
                id: lblUVOff
                x: imageCO2.width * 0.8
                y: lblUV.height + (lblUVDesc.height * 2) - 20
                font.family: "Helvetica"
                font.pointSize: 20
                text: "Off"
            }

            Label {
                id: lblUVOn
                x: imageCO2.width * 0.8
                y: neo1.height * 1.5
                font.family: "Helvetica"
                font.pointSize: 20
                text: "On"
            }

            Image {
                id: uvlight
                x: lblUV.x - uvlight.width
                y: lblUV.y + neo1.height * 0.55
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
                onMoved: {
                    if (sliderUV.value) {
                        request('http://192.168.1.51:8080/command?data=UDEwIFIyIFMx', function (o) {
                            console.log(o.responseText);
                            var errorText = '';
                        });
                    } else {
                        request('http://192.168.1.51:8080/command?data=UDEwIFIyIFMw', function (o) {
                            console.log(o.responseText);
                            var errorText = '';
                        });
                    }
                }
            }
        }

        Image {
            id: imageO2
            x: grid.width / 2
            y: grid.height / 2
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
                font.pointSize: 80
                text: "FAN"
            }

            Label {
                id: lblFanDesc
                x: (imageO2.width - lblFanDesc.width) * 0.5
                y: lblFan.height + (lblRGBDesc.height * 2)
                font.family: "Helvetica"
                font.pointSize: 20
                text: "Turn on/off Fan."
            }

            Label {
                id: lblFanOff
                x: imageO2.width * 0.8
                y: lblFan.height + (lblFanDesc.height * 2) - 20
                font.family: "Helvetica"
                font.pointSize: 20
                text: "Off"
            }

            Label {
                id: lblFanOn
                x: imageO2.width * 0.8
                y: neo1.height * 1.5
                font.family: "Helvetica"
                font.pointSize: 20
                text: "On"
            }

            Image {
                id: fan
                x: lblFan.x - fan.width
                y: lblUV.y + neo1.height * 0.55
                width: imageO2.height * 0.25
                height: imageO2.height * 0.25
                source: "images/fan.png"
            }
            Rectangle {
                id: recFan
                x: imageCO2.width * 0.875 - 2
                y: neo1.height * 1.7 - 10
                width: 40
                height: lblRGB.height + 10
                color: "#ffffff"
                radius: 15
            }
            Slider {
                id: sliderFan
                x: imageO2.width * 0.875
                y: neo1.height * 1.7
                height: lblFan.height
                orientation: Qt.Vertical
                from: 0
                stepSize: 1
                live: true
                to: 1
                snapMode: Slider.SnapAlways
                onMoved: {
                    if (sliderFan.value) {
                        request('http://192.168.1.51:8080/command?data=UDEwIFIzIFMx', function (o) {
                            console.log(o.responseText);
                            var errorText = '';
                        });
                    } else {
                        request('http://192.168.1.51:8080/command?data=UDEwIFIzIFMw', function (o) {
                            console.log(o.responseText);
                            var errorText = '';
                        });
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
