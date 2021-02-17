import QtQuick 2.11
import QtQuick.Controls 2.4

Page {
    width: 800
    height: 400

    Grid {
        id: grid
        x: 0
        y: 0
        width: 800
        height: 400

        Image {
            id: imageTemp
            width: grid.width / 2
            height: grid.height / 2
            anchors.left: parent.left
            anchors.top: parent.top
            source: "images/temperature.png"
            anchors.leftMargin: 0
            anchors.topMargin: 0
            sourceSize.height: 200
            sourceSize.width: 400
            layer.textureMirroring: ShaderEffectSource.NoMirroring
            fillMode: Image.Stretch

            Image {
                id: imageTempBar
                x: 101
                y: 9
                width: 267
                height: 184
                source: "images/orangebar.png"
                fillMode: Image.PreserveAspectFit

                Text {
                    id: textTemp
                    x: 105
                    y: 81
                    text: qsTr("--.-- °C")
                    font.pixelSize: 18
                }
            }

            Image {
                id: imageTempCircle
                x: 31
                y: 33
                width: 156
                height: 135
                source: "images/red.png"
                fillMode: Image.PreserveAspectFit

                Image {
                    id: imageTempIcon
                    x: 54
                    y: 45
                    width: 49
                    height: 45
                    source: "images/temp.png"
                    fillMode: Image.PreserveAspectFit
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
            source: "images/humidity.jpg"
            anchors.rightMargin: 0
            anchors.topMargin: 0
            sourceSize.height: 200
            sourceSize.width: 400
            layer.textureMirroring: ShaderEffectSource.NoMirroring
            fillMode: Image.Stretch

            Image {
                id: imageHumidBar
                x: 101
                y: 9
                width: 267
                height: 184
                source: "images/bluebar.png"
                fillMode: Image.PreserveAspectFit

                Text {
                    id: textHumid
                    x: 94
                    y: 81
                    text: qsTr("--.-- %RH")
                    font.pixelSize: 18
                }
            }

            Image {
                id: imageHumidCircle
                x: 31
                y: 33
                width: 156
                height: 135
                source: "images/blue.png"
                fillMode: Image.PreserveAspectFit

                Image {
                    id: imageHumidIcon
                    x: 56
                    y: 43
                    width: 45
                    height: 39
                    source: "images/humid.png"
                    fillMode: Image.PreserveAspectFit
                }
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
            sourceSize.height: 200
            sourceSize.width: 400
            layer.textureMirroring: ShaderEffectSource.NoMirroring
            fillMode: Image.Stretch

            Image {
                id: imageCO2Bar
                x: 101
                y: 9
                width: 267
                height: 184
                source: "images/graybar.png"
                fillMode: Image.PreserveAspectFit
                Text {
                    id: textCO2
                    x: 97
                    y: 81
                    text: qsTr("--.-- PPM")
                    font.pixelSize: 18
                }
            }

            Image {
                id: imageCO2Circle
                x: 31
                y: 33
                width: 156
                height: 135
                source: "images/gray.png"
                fillMode: Image.PreserveAspectFit

                Image {
                    id: imageCO2Icon
                    x: 55
                    y: 46
                    width: 47
                    height: 43
                    source: "images/co2.png"
                    fillMode: Image.PreserveAspectFit
                }
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
                x: 101
                y: 9
                width: 267
                height: 184
                source: "images/greenbar.png"
                fillMode: Image.PreserveAspectFit
                Text {
                    id: textO2
                    x: 105
                    y: 81
                    text: qsTr("--.-- %")
                    font.pixelSize: 18
                }
            }

            Image {
                id: imageO2Circle
                x: 31
                y: 33
                width: 156
                height: 135
                source: "images/green.png"
                fillMode: Image.PreserveAspectFit
                Image {
                    id: imageO2Icon
                    x: 56
                    y: 54
                    width: 56
                    height: 43
                    source: "images/o2.png"
                    fillMode: Image.PreserveAspectFit
                }
            }
        }
    }
}
