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
        height: screenHight * 0.85

        Image {
            id: imageTemp
            width: grid.width * 0.5
            height: grid.height * 0.5
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.topMargin: 0
            source: "images/RGBbg.png"
            fillMode: Image.Stretch
            Button {
                id: neo1
                x: 0
                y: 0
                width: imageTemp.width / 3
                height: imageTemp.height / 6
                background: Rectangle {
                        color: "#6068D5"
                }
            }
            Button {
                id: neo2
                x: neo1.width
                y: 0
                width: imageTemp.width / 3
                height: imageTemp.height / 6
                background: Rectangle {
                        color: "#D357DE"
                }
            }
            Button {
                id: neo3
                x: neo2.width + neo2.x
                y: 0
                width: imageTemp.width / 3
                height: imageTemp.height / 6
                background: Rectangle {
                        color: "#CDF73E"
                }
            }
            Button {
                id: neo7
                x: 0
                y: imageTemp.height - neo1.height
                width: imageTemp.width / 3
                height: imageTemp.height / 6
                background: Rectangle {
                        color: "#0DFFFF"
                }
            }
            Button {
                id: neo8
                x: neo7.width
                y: imageTemp.height - neo1.height
                width: imageTemp.width / 3
                height: imageTemp.height / 6
                background: Rectangle {
                        color: "#FDFDFD"
                }
            }
            Button {
                id: neo9
                x: neo8.width + neo8.x
                y: imageTemp.height - neo1.height
                width: imageTemp.width / 3
                height: imageTemp.height / 6
                background: Rectangle {
                        color: "#F54B4B"
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
                x: imageTemp.width * 0.8
                y: lblRGB.height + (lblRGBDesc.height * 2)
                font.family: "Helvetica"
                font.pointSize: 20
                text: "Off"
            }

            Label {
                id: lblRgbOn
                x: imageTemp.width * 0.8
                y: neo1.height * 1.5
                font.family: "Helvetica"
                font.pointSize: 20
                text: "On"
            }

            Image {
                id: wheelColor
                x: lblRGB.x - wheelColor.width
                y: lblRGB.y + neo1.height * 0.55
                width: imageTemp.height * 0.25
                height: imageTemp.height * 0.25
                source: "images/wheel.png"
            }

            Slider {
                id: sliderRgb
                x: imageTemp.width * 0.875
                y: neo1.height * 1.7
                height: lblRGB.height
                orientation: Qt.Vertical
                from: 0
                stepSize: 1
                live: true
                to: 255
                snapMode: Slider.SnapAlways
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
                y: lblRGB.height + (lblIonizeDesc.height * 2)
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
                y: lblUV.height + (lblUVDesc.height * 2)
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
                y: lblFan.height + (lblFanDesc.height * 2)
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
            }
        }
    }
}
