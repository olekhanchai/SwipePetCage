import QtQuick 2.11
import QtQuick.Controls 2.2
import QtCharts 2.3

Page {
    width: screenWidth
    height: screenHight

    Grid {
        id: grid
        x: 0
        y: 0
        width: screenWidth
        height: screenHight * 0.85

        Image {
            id: imageTemp
            width: grid.width * 0.5
            height: grid.height * 0.5
            anchors.left: parent.left
            anchors.top: parent.top
            source: "images/temperature.png"
            anchors.leftMargin: 0
            anchors.topMargin: 0
            sourceSize.height: grid.height * 0.5
            sourceSize.width: grid.width * 0.5
            layer.textureMirroring: ShaderEffectSource.NoMirroring
            fillMode: Image.Stretch

            Image {
                id: imageTempBar
                x: imageTemp.width * 0.25
                y: imageTemp.height * 0
                width: imageTemp.width * 0.68
                height: imageTemp.height * 1
                source: "images/orangebar.png"
                sourceSize.height: imageTemp.height * 1
                sourceSize.width: imageTemp.width * 0.68
                fillMode: Image.PreserveAspectFit
            }

            Image {
                id: imageTempCircle
                x: imageTemp.width * 0.15
                y: imageTemp.height * 0.15
                width: imageTemp.height * 0.7
                height: imageTemp.height * 0.7
                source: "images/red.png"
                fillMode: Image.PreserveAspectFit
                Image {
                    id: imageTempIcon
                    x: imageTempCircle.width * 0.5 - (imageTemp.height * 0.25) / 2
                    y: imageTempCircle.height * 0.5 - (imageTemp.height * 0.25) / 2
                    width: imageTemp.height * 0.25
                    height: imageTemp.height * 0.25
                    source: "images/temp.png"
                    fillMode: Image.PreserveAspectFit
                }
            }
            Text {
                id: textTemp
                x: imageTemp.width * 0.5
                y: imageTemp.height * 0.5 - (imageTemp.height * 0.1) / 2
                text: qsTr("--.-- C")
                font.pixelSize: imageTemp.height * 0.1
            }
        }

        Image {
            id: imageHumid
            x: grid.width / 2 + 1
            width: grid.width / 2
            height: grid.height / 2
            anchors.right: parent.right
            anchors.top: parent.top
            source: "images/humidity.jpg"
            anchors.rightMargin: 0
            anchors.topMargin: 0
            sourceSize.height: grid.height * 0.5
            sourceSize.width: grid.width * 0.5
            fillMode: Image.Stretch

            Image {
                id: imageHumidBar
                x: imageHumid.width * 0.25
                y: imageHumid.height * 0
                width: imageHumid.width * 0.68
                height: imageHumid.height * 1
                source: "images/bluebar.png"
                autoTransform: true
                sourceSize.height: 184
                sourceSize.width: 267
                fillMode: Image.PreserveAspectFit
            }

            Image {
                id: imageHumidCircle
                x: imageHumid.width * 0.15
                y: imageHumid.height * 0.15
                width: imageHumid.height * 0.7
                height: imageHumid.height * 0.7
                source: "images/blue.png"
                fillMode: Image.PreserveAspectFit

                Image {
                    id: imageHumidIcon
                    x: imageHumidCircle.width * 0.5 - (imageHumid.height * 0.25) / 2
                    y: imageHumidCircle.height * 0.5 - (imageHumid.height * 0.25) / 2
                    width: imageHumid.height * 0.25
                    height: imageHumid.height * 0.25
                    source: "images/humid.png"
                    fillMode: Image.PreserveAspectFit
                }
            }
            Text {
                id: textHumid
                x: imageHumid.width * 0.5
                y: imageHumid.height * 0.5 - (imageHumid.height * 0.1) / 2
                text: qsTr("--.-- %RH")
            font.pixelSize: imageHumid.height * 0.1
            }
        }

        Image {
            id: imageCO2
            y: 0
            width: grid.width / 2
            height: grid.height / 2
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            source: "images/carbondioxide.png"
            anchors.bottomMargin: 0
            anchors.leftMargin: 0
            sourceSize.height: grid.height / 2
            sourceSize.width: grid.width / 2
            fillMode: Image.Stretch

            Image {
                id: imageCO2Bar
                x: imageCO2.width * 0.25
                y: imageCO2.height * 0
                width: imageCO2.width * 0.68
                height: imageCO2.height * 1
                source: "images/graybar.png"
                fillMode: Image.PreserveAspectFit
            }

            Image {
                id: imageCO2Circle
                x: imageCO2.width * 0.15
                y: imageCO2.height * 0.15
                width: imageCO2.height * 0.7
                height: imageCO2.height * 0.7
                source: "images/gray.png"
                fillMode: Image.PreserveAspectFit

                Image {
                    id: imageCO2Icon
                    x: imageCO2Circle.width * 0.5 - (imageCO2.height * 0.25) / 2
                    y: imageCO2Circle.height * 0.5 - (imageCO2.height * 0.25) / 2
                    width: imageCO2.height * 0.25
                    height: imageCO2.height * 0.25
                    source: "images/co2.png"
                    fillMode: Image.PreserveAspectFit
                }
            }
            Text {
                id: textCO2
                x: imageCO2.width * 0.5
                y: imageCO2.height * 0.5 - (imageCO2.height * 0.1) / 2
                text: qsTr("--.-- PPM")
                font.pixelSize: imageCO2.height * 0.1
            }
        }

        Image {
            id: imageO2
            x: grid.width / 2 + 1
            y: grid.height / 2
            width: grid.width / 2
            height: grid.height / 2
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            source: "images/oxigen.jpg"
            anchors.rightMargin: 0
            anchors.bottomMargin: 0
            sourceSize.height: 200
            sourceSize.width: 400
            layer.textureMirroring: ShaderEffectSource.NoMirroring
            fillMode: Image.Stretch

            Image {
                id: imageO2Bar
                x: imageO2.width * 0.25
                y: imageO2.height * 0
                width: imageO2.width * 0.68
                height: imageO2.height * 1
                source: "images/greenbar.png"
                fillMode: Image.PreserveAspectFit
            }

            Image {
                id: imageO2Circle
                x: imageO2.width * 0.15
                y: imageO2.height * 0.15
                width: imageO2.height * 0.7
                height: imageO2.height * 0.7
                source: "images/green.png"
                fillMode: Image.PreserveAspectFit
                Image {
                    id: imageO2Icon
                    x: imageO2Circle.width * 0.5 - (imageO2.height * 0.25) / 2
                    y: imageO2Circle.height * 0.5 - (imageO2.height * 0.25) / 2
                    width: imageO2.height * 0.25
                    height: imageO2.height * 0.25
                    source: "images/o2.png"
                    fillMode: Image.PreserveAspectFit
                }
            }
            Text {
                id: textO2
                x: imageO2.width * 0.5
                y: imageO2.height * 0.5 - (imageO2.height * 0.1) / 2
                text: qsTr("--.-- %")
                font.pixelSize: imageO2.height * 0.1
            }
        }
    }

    Timer {
       interval: 5000
       running: true
       repeat: true
       onTriggered: {
            request('http://192.168.1.46:8080/command?data=UDUw', function (o) {
            console.log(o.responseText);
            var errorText = '';
            // log the json response
            if(o.responseText.includes("error")) {
                var d = o.responseText.split(";");
                var err = d[0].split(":");
                errorText = err[err.length-1];
                imageO2Circle.source = "images/error.png"
                textO2.text = "00.00%";
                lblStatus.text = errorText;
            }
           });
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

/*##^##
Designer {
    D{i:0;uuid:"55cb16279f346ca89409cfbef6ab40b4"}D{i:3;uuid:"2b39002ff17d28d9861db3a6883191a6"}
D{i:5;uuid:"be769c7408d9229a0c0bbbb91c5413c5"}D{i:4;uuid:"cf3347bc5193ce210083023b4dd48614"}
D{i:6;uuid:"c63c93b56a91d55b92f5a6ead0f16d11"}D{i:2;uuid:"bcb5e68b050713f9f07b891a404d51b0"}
D{i:8;uuid:"87730241d671160e67dbd48fe1a32024"}D{i:10;uuid:"5402b9f9d35f904919a0ab1391fd8bca"}
D{i:9;uuid:"866b53be602854d1368978ea2f9042e0"}D{i:11;uuid:"729b925a5d2c106b4d6cbee0320d34cb"}
D{i:7;uuid:"a64d6058ef851494e504788754e482c0"}D{i:13;uuid:"8d24f69e4ea60515efbcb318c7d042ed"}
D{i:15;uuid:"08b769d36491bf81c10891a70465b2ec"}D{i:14;uuid:"141592e2f7616a211ad6e1682e456c2d"}
D{i:16;uuid:"c36e4579840549f755ee9fe9c2d1f14d"}D{i:12;uuid:"5737b2d76718cf2e8380a78aa878946e"}
D{i:18;uuid:"612e1efe3ebd4c6b53a4ef6bf8311dc0"}D{i:20;uuid:"792ca89082dccb14cd209cbdbf72d859"}
D{i:19;uuid:"eff7ada1959d4b37f8e9e1ac81cd4266"}D{i:21;uuid:"db781750fba087ba369389295210e38e"}
D{i:17;uuid:"683cfec07d81cb58aa49e1951f6b0bee"}D{i:1;uuid:"022e7ce602e1985984f785adf9fa2112"}
}
##^##*/
