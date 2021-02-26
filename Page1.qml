import QtQuick 2.11
import QtQuick.Controls 2.2
import QtQuick.VirtualKeyboard 2.1

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
            Rectangle {
                id: textTempUp
                x: imageTemp.width * 0.5
                y: imageTemp.height * 0.3
                width: 100
                height: imageTemp.height * 0.15
                color: textInputTempUp.activeFocus ? "white" : "lightgray"

                TextInput {
                    id: textInputTempUp
                    focus: true
                    anchors.fill: parent
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.verticalCenter: parent.verticalCenter
                    inputMethodHints: Qt.ImhDigitsOnly
                    font.pixelSize: imageTemp.height * 0.1
                    horizontalAlignment: Text.AlignRight
                    verticalAlignment: Text.AlignVCenter
                    inputMask: "99"
                }

            }

            Text {
                id: textTempUnitUp
                x: textTempUp.x + textTempUp.width
                y: imageTemp.height * 0.3
                text: qsTr(" °C")
                font.pixelSize: imageTemp.height * 0.1
            }

            Rectangle {
                id: textTempDown
                x: imageTemp.width * 0.5
                y: imageTemp.height * 0.55
                width: 100
                height: imageTemp.height * 0.15
                color: textInputTempDown.activeFocus ? "white" : "lightgray"

                TextInput {
                    id: textInputTempDown
                    focus: true
                    anchors.fill: parent
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.verticalCenter: parent.verticalCenter
                    inputMethodHints: Qt.ImhDigitsOnly
                    font.pixelSize: imageTemp.height * 0.1
                    horizontalAlignment: Text.AlignRight
                    verticalAlignment: Text.AlignVCenter
                    inputMask: "99"
                }

            }

            Text {
                id: textTempDownUnit
                x: textTempDown.x + textTempDown.width
                y: imageTemp.height * 0.55
                text: qsTr(" °C")
                font.pixelSize: imageTemp.height * 0.1
            }
            Image {
                id: setgearTemp
                x: imageTemp.width * 0.13
                y: imageTemp.height * 0.1
                width: imageTemp.height * 0.8
                height: imageTemp.height * 0.8
                source: "images/setgear.png"
                fillMode: Image.PreserveAspectFit
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
            Rectangle {
                id: textHumidUp
                x: imageHumid.width * 0.5
                y: imageHumid.height * 0.3
                width: 100
                height: imageHumid.height * 0.15
                color: textInputHumidUp.activeFocus ? "white" : "lightgray"

                TextInput {
                    id: textInputHumidUp
                    focus: true
                    anchors.fill: parent
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.verticalCenter: parent.verticalCenter
                    inputMethodHints: Qt.ImhDigitsOnly
                    font.pixelSize: imageHumid.height * 0.1
                    horizontalAlignment: Text.AlignRight
                    verticalAlignment: Text.AlignVCenter
                    inputMask: "99"
                }

            }

            Text {
                id: textHumidUnitUp
                x: textHumidUp.x + textHumidUp.width
                y: imageHumid.height * 0.3
                text: qsTr(" %RH")
                font.pixelSize: imageHumid.height * 0.1
            }

            Rectangle {
                id: textHumidDown
                x: imageHumid.width * 0.5
                y: imageHumid.height * 0.55
                width: 100
                height: imageHumid.height * 0.15
                color: textInputHumidDown.activeFocus ? "white" : "lightgray"

                TextInput {
                    id: textInputHumidDown
                    focus: true
                    anchors.fill: parent
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.verticalCenter: parent.verticalCenter
                    inputMethodHints: Qt.ImhDigitsOnly
                    font.pixelSize: imageHumid.height * 0.1
                    horizontalAlignment: Text.AlignRight
                    verticalAlignment: Text.AlignVCenter
                    inputMask: "99"
                }

            }

            Text {
                id: textHumidDownUnit
                x: textHumidDown.x + textHumidDown.width
                y: imageHumid.height * 0.55
                text: qsTr(" %RH")
                font.pixelSize: imageHumid.height * 0.1
            }
            Image {
                id: setgearHumid
                x: imageHumid.width * 0.13
                y: imageHumid.height * 0.1
                width: imageHumid.height * 0.8
                height: imageHumid.height * 0.8
                source: "images/setgear.png"
                fillMode: Image.PreserveAspectFit
            }
        }

        Image {
            id: imageCO2
            width: grid.width / 2
            height: grid.height / 2
            x: 0
            y: (inputPanel.active && (textInputCO2Down.activeFocus || textInputCO2Up.activeFocus)) ? 0 : grid.height / 2
            source: "images/carbondioxide.png"
            anchors.bottomMargin: 0
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
            Rectangle {
                id: textCO2Up
                x: imageCO2.width * 0.5
                y: imageCO2.height * 0.3
                width: 100
                height: imageCO2.height * 0.15
                color: textInputCO2Up.activeFocus ? "white" : "lightgray"

                TextInput {
                    id: textInputCO2Up
                    focus: true
                    anchors.fill: parent
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.verticalCenter: parent.verticalCenter
                    inputMethodHints: Qt.ImhDigitsOnly
                    font.pixelSize: imageCO2.height * 0.1
                    horizontalAlignment: Text.AlignRight
                    verticalAlignment: Text.AlignVCenter
                    inputMask: "9999"
                }

            }

            Text {
                id: textCO2UnitUp
                x: textCO2Up.x + textCO2Up.width
                y: imageCO2.height * 0.3
                text: qsTr(" PPM")
                font.pixelSize: imageCO2.height * 0.1
            }

            Rectangle {
                id: textCO2Down
                x: imageCO2.width * 0.5
                y: imageCO2.height * 0.55
                width: 100
                height: imageCO2.height * 0.15
                color: textInputCO2Down.activeFocus ? "white" : "lightgray"

                TextInput {
                    id: textInputCO2Down
                    focus: true
                    anchors.fill: parent
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.verticalCenter: parent.verticalCenter
                    inputMethodHints: Qt.ImhDigitsOnly
                    font.pixelSize: imageCO2.height * 0.1
                    horizontalAlignment: Text.AlignRight
                    verticalAlignment: Text.AlignVCenter
                    inputMask: "9999"
                }

            }

            Text {
                id: textCO2
                x: textCO2Down.x + textCO2Down.width
                y: imageO2.height * 0.55
                text: qsTr(" PPM")
                font.pixelSize: imageCO2.height * 0.1
            }
            Image {
                id: setgearCO2
                x: imageCO2.width * 0.13
                y: imageCO2.height * 0.1
                width: imageCO2.height * 0.8
                height: imageCO2.height * 0.8
                source: "images/setgear.png"
                fillMode: Image.PreserveAspectFit
            }
        }

        Image {
            id: imageO2
            x: grid.width / 2
            y: (inputPanel.active && (textInputO2Down.activeFocus || textInputO2Up.activeFocus)) ? 0 : grid.height / 2
            width: grid.width / 2
            height: grid.height / 2
            source: "images/oxigen.jpg"
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

            Rectangle {
                id: textO2Up
                x: imageO2.width * 0.5
                y: imageO2.height * 0.3
                width: 100
                height: imageO2.height * 0.15
                color: textInputO2Up.activeFocus ? "white" : "lightgray"

                TextInput {
                    id: textInputO2Up
                    focus: true
                    anchors.fill: parent
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.verticalCenter: parent.verticalCenter
                    inputMethodHints: Qt.ImhDigitsOnly
                    font.pixelSize: imageCO2.height * 0.1
                    horizontalAlignment: Text.AlignRight
                    verticalAlignment: Text.AlignVCenter
                    inputMask: "99"
                }

            }

            Text {
                id: textO2UnitUp
                x: textO2Up.x + textO2Up.width
                y: imageO2.height * 0.3
                text: qsTr(" %")
                font.pixelSize: imageO2.height * 0.1
            }

            Rectangle {
                id: textO2Down
                x: imageO2.width * 0.5
                y: imageO2.height * 0.55
                width: 100
                height: imageO2.height * 0.15
                color: textInputO2Down.activeFocus ? "white" : "lightgray"

                TextInput {
                    id: textInputO2Down
                    focus: true
                    anchors.fill: parent
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.verticalCenter: parent.verticalCenter
                    inputMethodHints: Qt.ImhDigitsOnly
                    font.pixelSize: imageO2.height * 0.1
                    horizontalAlignment: Text.AlignRight
                    verticalAlignment: Text.AlignVCenter
                    inputMask: "99"
                }

            }

            Text {
                id: textHumid
                x: textO2Down.x + textO2Down.width
                y: imageO2.height * 0.55
                text: qsTr(" %")
                font.pixelSize: imageO2.height * 0.1
            }

            Image {
                id: setgearO2
                x: imageO2.width * 0.13
                y: imageO2.height * 0.1
                width: imageO2.height * 0.8
                height: imageO2.height * 0.8
                source: "images/setgear.png"
                fillMode: Image.PreserveAspectFit
            }
        }
    }
}
