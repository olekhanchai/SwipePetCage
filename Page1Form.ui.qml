import QtQuick 2.11
import QtQuick.Controls 2.2

Page {
    width: screenWidth
    height: screenHight - (screenHight / 6)

    Grid {
        id: grid
        x: 0
        y: 0
        width: screenWidth
        height: screenHight - (screenHight / 6)
        Image {
            id: imageTemp
            width: grid.width / 2
            height: grid.height / 2
            anchors.left: parent.left
            anchors.top: parent.top
            source: "images/temperature.png"
            layer.textureMirroring: ShaderEffectSource.NoMirroring
            Image {
                id: imageTempBar
                x: 101
                y: 9
                width: 267
                height: 184
                source: "images/orangebar.png"
                Text {
                    id: textTemp
                    x: 159
                    y: 55
                    text: qsTr("--.-- °C")
                    font.pixelSize: 18
                }

                Text {
                    id: textTemp1
                    x: 75
                    y: 55
                    text: qsTr("Lower : ")
                    font.pixelSize: 18
                }

                Text {
                    id: textTemp2
                    x: 159
                    y: 98
                    text: qsTr("--.-- °C")
                    font.pixelSize: 18
                }

                Text {
                    id: textTemp3
                    x: 75
                    y: 98
                    text: qsTr("Upper : ")
                    font.pixelSize: 18
                }
                fillMode: Image.PreserveAspectFit
            }

            Image {
                id: imageTempCircle
                x: 31
                y: 33
                width: 156
                height: 135
                source: "images/red.png"
                Image {
                    id: imageTempIcon
                    x: 53
                    y: 45
                    width: 49
                    height: 45
                    source: "images/temp.png"
                    fillMode: Image.PreserveAspectFit
                }
                fillMode: Image.PreserveAspectFit
            }

            Text {
                id: textTemp4
                x: 77
                y: 8
                text: qsTr("Temperature Alert Trigger Settings")
                font.pixelSize: 18
            }
            anchors.leftMargin: 0
            sourceSize.height: 200
            sourceSize.width: 400
            anchors.topMargin: 0
            fillMode: Image.Stretch
        }

        Image {
            id: imageHumid
            x: grid.width / 2 + 1
            width: grid.width / 2
            height: grid.height / 2
            anchors.right: parent.right
            anchors.top: parent.top
            source: "images/humidity.jpg"
            layer.textureMirroring: ShaderEffectSource.NoMirroring
            Image {
                id: imageHumidBar
                x: 101
                y: 9
                width: 267
                height: 184
                source: "images/bluebar.png"
                Text {
                    id: textHumid
                    x: 145
                    y: 60
                    text: qsTr("--.-- %RH")
                    font.pixelSize: 18
                }

                Text {
                    id: textHumid1
                    x: 145
                    y: 94
                    text: qsTr("--.-- %RH")
                    font.pixelSize: 18
                }

                Text {
                    id: textTemp8
                    x: 74
                    y: 94
                    text: qsTr("Upper : ")
                    font.pixelSize: 18
                }

                Text {
                    id: textTemp9
                    x: 74
                    y: 60
                    text: qsTr("Lower : ")
                    font.pixelSize: 18
                }
                fillMode: Image.PreserveAspectFit
            }

            Image {
                id: imageHumidCircle
                x: 31
                y: 33
                width: 156
                height: 135
                source: "images/blue.png"
                Image {
                    id: imageHumidIcon
                    x: 56
                    y: 43
                    width: 45
                    height: 39
                    source: "images/humid.png"
                    fillMode: Image.PreserveAspectFit
                }

                Image {
                    id: setgear3
                    x: 13
                    y: 0
                    width: 131
                    height: 127
                    source: "images/setgear.png"
                    fillMode: Image.PreserveAspectFit
                }
                fillMode: Image.PreserveAspectFit
            }

            Text {
                id: textTemp7
                x: 101
                y: 8
                text: qsTr("Humidity Alert Trigger Settings")
                font.pixelSize: 18
            }
            sourceSize.height: 200
            anchors.rightMargin: 0
            sourceSize.width: 400
            anchors.topMargin: 0
            fillMode: Image.Stretch
        }

        Image {
            id: imageCO2
            y: 0
            width: grid.width / 2
            height: grid.height / 2
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            source: "images/carbondioxide.png"
            layer.textureMirroring: ShaderEffectSource.NoMirroring
            Image {
                id: imageCO2Bar
                x: 101
                y: 9
                width: 267
                height: 184
                source: "images/graybar.png"
                Text {
                    id: textCO2
                    x: 156
                    y: 55
                    text: qsTr("--.-- PPM")
                    font.pixelSize: 18
                }

                Text {
                    id: textCO3
                    x: 156
                    y: 97
                    text: qsTr("--.-- PPM")
                    font.pixelSize: 18
                }

                Text {
                    id: textTemp12
                    x: 75
                    y: 55
                    text: qsTr("Lower : ")
                    font.pixelSize: 18
                }

                Text {
                    id: textTemp13
                    x: 75
                    y: 98
                    text: qsTr("Upper : ")
                    font.pixelSize: 18
                }
                fillMode: Image.PreserveAspectFit
            }

            Image {
                id: imageCO2Circle
                x: 31
                y: 33
                width: 156
                height: 135
                source: "images/gray.png"
                Image {
                    id: imageCO2Icon
                    x: 55
                    y: 46
                    width: 47
                    height: 43
                    source: "images/co2.png"
                    fillMode: Image.PreserveAspectFit
                }

                Image {
                    id: setgear1
                    x: 13
                    y: 4
                    width: 131
                    height: 127
                    source: "images/setgear.png"
                    fillMode: Image.PreserveAspectFit
                }
                fillMode: Image.PreserveAspectFit
            }

            Text {
                id: textTemp5
                x: 75
                y: 8
                text: qsTr("Carbondioxide Alert Trigger Settings")
                font.pixelSize: 18
            }
            anchors.leftMargin: 0
            sourceSize.height: 200
            sourceSize.width: 400
            anchors.bottomMargin: 0
            fillMode: Image.Stretch
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
            layer.textureMirroring: ShaderEffectSource.NoMirroring
            Image {
                id: imageO2Bar
                x: 101
                y: 9
                width: 267
                height: 184
                source: "images/greenbar.png"
                Text {
                    id: textO2
                    x: 167
                    y: 60
                    text: qsTr("--.-- %")
                    font.pixelSize: 18
                }

                Text {
                    id: textTemp10
                    x: 74
                    y: 94
                    text: qsTr("Upper : ")
                    font.pixelSize: 18
                }

                Text {
                    id: textTemp11
                    x: 74
                    y: 60
                    text: qsTr("Lower : ")
                    font.pixelSize: 18
                }

                Text {
                    id: textO3
                    x: 167
                    y: 94
                    text: qsTr("--.-- %")
                    font.pixelSize: 18
                }
                fillMode: Image.PreserveAspectFit
            }

            Image {
                id: imageO2Circle
                x: 31
                y: 33
                width: 156
                height: 135
                source: "images/green.png"
                Image {
                    id: imageO2Icon
                    x: 56
                    y: 54
                    width: 56
                    height: 43
                    source: "images/o2.png"
                    fillMode: Image.PreserveAspectFit
                }

                Image {
                    id: setgear2
                    x: 17
                    y: 4
                    width: 131
                    height: 127
                    source: "images/setgear.png"
                    fillMode: Image.PreserveAspectFit
                }
                fillMode: Image.PreserveAspectFit
            }

            Text {
                id: textTemp6
                x: 101
                y: 8
                text: qsTr("Oxygen Alert Trigger Settings")
                font.pixelSize: 18
            }
            sourceSize.height: 200
            anchors.rightMargin: 0
            sourceSize.width: 400
            anchors.bottomMargin: 0
            fillMode: Image.Stretch
        }
    }

    Image {
        id: setgear
        x: 42
        y: 36
        width: 131
        height: 127
        source: "images/setgear.png"
        fillMode: Image.PreserveAspectFit
    }
}
