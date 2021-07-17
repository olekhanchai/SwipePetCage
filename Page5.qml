import QtQuick 2.11
import QtQuick.Controls 2.2
import QtCharts 2.3

Page {
    id: settings
    x: 0
    y: 0
    width: screenWidth
    height: screenHight * 0.75

    Image {
        id: imageGear
        x: 20
        y: 0.028 * settings.height
        width: settings.height * 0.1047
        height: settings.height * 0.1047
        source: "images/gear.png"
        sourceSize.height: 50
        sourceSize.width: 50
        fillMode: Image.PreserveAspectFit
    }

    Rectangle {
        id: rectangleTemp
        x: 0
        y: imageGear.y + imageGear.height
        width: settings.width - (1 * imageGear.width) + (imageGear.width / 2)
        height: settings.height * 0.0084
        color: "#4040fa"
    }

    Text {
        id: txtSettings
        x: (settings.width - txtSettings.width) * 0.5
        y: settings.height * 0.0083
        height: settings.height * 0.1
        text: qsTr("System Settings")
        font.pixelSize: settings.height * 0.075
    }

    Rectangle {
        id: recTemp
        x: 20
        y: imageGear.y + imageGear.height + 20
        width: parent.width * 0.25 - 20
        height: parent.height * 0.8
        color: "#CF6BBE"

        Image {
            id: imgTemp
            x: 50
            y: recTemp.height * 0.5 - imgTemp.height * 0.5
            width:  imageGear.width * 1.6
            height: imageGear.width * 1.6
            source: "images/temp.png"
            fillMode: Image.PreserveAspectFit
        }

        Text {
            id: lblUpperTemp
            x: recTemp.width * 0.5 - 20
            y: 20
            width: 69
            height: 30
            text: qsTr("UpperLimit")
            font.pixelSize: 30
        }

        Text {
            id: txtUpperTemp
            x: imgTemp.width + imgTemp.x + imgTemp.width * 0.8 - 20
            y: 60
            text: Math.round(rangeSliderTemp.second.value * 100)>=10?Math.round(rangeSliderTemp.second.value * 100):"0"+Math.round(rangeSliderTemp.second.value * 100)
            font.pixelSize: 40
        }

        RangeSlider {
            id: rangeSliderTemp
            x:  imgTemp.width + imgTemp.x + imgTemp.width * 0.8 - 20
            y:  120
            second.value: 0.75
            first.value: 0.25
            orientation: Qt.Vertical
        }

        Text {
            id: lblLowerTemp
            x: recTemp.width * 0.5 - 20
            y: recTemp.height - lblLowerTemp.height - 20
            width: 69
            height: 30
            text: qsTr("LowerLimit")
            font.pixelSize: 30
        }

        Text {
            id: txtLowerTemp
            x: imgTemp.width + imgTemp.x + imgTemp.width * 0.8 - 20
            y: recTemp.height - lblLowerTemp.height - txtLowerTemp.height - 20
            text: Math.round(rangeSliderTemp.first.value * 100)>=10?Math.round(rangeSliderTemp.first.value * 100):"0"+Math.round(rangeSliderTemp.first.value * 100)
            font.pixelSize: 40
        }
    }
    Rectangle {
        id: recHumid
        x: recTemp.width + 30
        y: imageGear.y + imageGear.height + 20
        width: parent.width * 0.25 - 20
        height: parent.height * 0.8
        color: "#99D9AA"

        Image {
            id: imgHumid
            x: 50
            y: recHumid.height * 0.5 - imgHumid.height * 0.5
            width:  imageGear.width * 1.6
            height: imageGear.width * 1.6
            source: "images/humidIcon.png"
            fillMode: Image.PreserveAspectFit
        }

        Text {
            id: lblUpperHumid
            x: recHumid.width * 0.5 - 20
            y: 20
            width: 69
            height: 30
            text: qsTr("UpperLimit")
            font.pixelSize: 30
        }

        Text {
            id: txtUpperHumid
            x: imgTemp.width + imgTemp.x + imgTemp.width * 0.8 - 20
            y: 60
            text: Math.round(rangeSliderHumid.second.value * 100)>=10?Math.round(rangeSliderHumid.second.value * 100):"0"+Math.round(rangeSliderHumid.second.value * 100)
            font.pixelSize: 40
        }

        RangeSlider {
            id: rangeSliderHumid
            x:  imgTemp.width + imgTemp.x + imgTemp.width * 0.8 - 20
            y:  120
            second.value: 0.75
            first.value: 0.25
            orientation: Qt.Vertical
        }

        Text {
            id: lblLowerHumid
            x: recHumid.width * 0.5 - 20
            y: recTemp.height - lblLowerTemp.height - 20
            width: 69
            height: 30
            text: qsTr("LowerLimit")
            font.pixelSize: 30
        }

        Text {
            id: txtLowerHumid
            x: imgTemp.width + imgTemp.x + imgTemp.width * 0.8 - 20
            y: recTemp.height - lblLowerTemp.height - txtLowerTemp.height - 20
            text: Math.round(rangeSliderHumid.first.value * 100)>=10?Math.round(rangeSliderHumid.first.value * 100):"0"+Math.round(rangeSliderHumid.first.value * 100)
            font.pixelSize: 40
        }
    }

    Rectangle {
        id: recCo2
        x: screenWidth * 0.5
        y: imageGear.y + imageGear.height + 20
        width: parent.width * 0.25 - 20
        height: parent.height * 0.8
        color: "#C8C8C8"

        Image {
            id: imgCo2
            x: 50
            y: recCo2.height * 0.5 - imgCo2.height * 0.5
            width:  imageGear.width * 1.6
            height: imageGear.width * 1.6
            source: "images/co2.png"
            fillMode: Image.PreserveAspectFit
        }

        Text {
            id: lblUpperCo2
            x: recCo2.width * 0.5 - 20
            y: 20
            width: 69
            height: 30
            text: qsTr("UpperLimit")
            font.pixelSize: 30
        }

        Text {
            id: txtUpperCo2
            x: imgTemp.width + imgTemp.x + imgTemp.width * 0.8 - 20
            y: 60
            text: Math.round(rangeSliderCo2.second.value * 100)>=10?Math.round(rangeSliderCo2.second.value * 100):"0"+Math.round(rangeSliderCo2.second.value * 100)
            font.pixelSize: 40
        }

        RangeSlider {
            id: rangeSliderCo2
            x:  imgTemp.width + imgTemp.x + imgTemp.width * 0.8 - 20
            y:  120
            second.value: 0.75
            first.value: 0.25
            orientation: Qt.Vertical
        }

        Text {
            id: lblLowerCo2
            x: recCo2.width * 0.5 - 20
            y: recTemp.height - lblLowerTemp.height - 20
            width: 69
            height: 30
            text: qsTr("LowerLimit")
            font.pixelSize: 30
        }

        Text {
            id: txtLowerCo2
            x: imgTemp.width + imgTemp.x + imgTemp.width * 0.8 - 20
            y: recTemp.height - lblLowerTemp.height - txtLowerTemp.height - 20
            text: Math.round(rangeSliderCo2.first.value * 100)>=10?Math.round(rangeSliderCo2.first.value * 100):"0"+Math.round(rangeSliderCo2.first.value * 100)
            font.pixelSize: 40
        }
    }

    Rectangle {
        id: recO2
        x: screenWidth * 0.5 + recCo2.width + 10
        y: imageGear.y + imageGear.height + 20
        width: parent.width * 0.25 - 20
        height: parent.height * 0.8
        color: "#00FF64"

        Image {
            id: imgO2
            x: 50
            y: recO2.height * 0.5 - imgO2.height * 0.5
            width:  imageGear.width * 1.6
            height: imageGear.width * 1.6
            source: "images/o2.png"
            fillMode: Image.PreserveAspectFit
        }

        Text {
            id: lblUpperO2
            x: recO2.width * 0.5 - 20
            y: 20
            width: 69
            height: 30
            text: qsTr("UpperLimit")
            font.pixelSize: 30
        }

        Text {
            id: txtUpperO2
            x: imgTemp.width + imgTemp.x + imgTemp.width * 0.8 - 20
            y: 60
            text: Math.round(rangeSliderO2.second.value * 100)>=10?Math.round(rangeSliderO2.second.value * 100):"0"+Math.round(rangeSliderO2.second.value * 100)
            font.pixelSize: 40
        }

        RangeSlider {
            id: rangeSliderO2
            x:  imgTemp.width + imgTemp.x + imgTemp.width * 0.8 - 20
            y:  120
            second.value: 0.75
            first.value: 0.25
            orientation: Qt.Vertical
        }

        Text {
            id: lblLowerO2
            x: recO2.width * 0.5 - 20
            y: recTemp.height - lblLowerTemp.height - 20
            width: 69
            height: 30
            text: qsTr("LowerLimit")
            font.pixelSize: 30
        }

        Text {
            id: txtLowerO2
            x: imgTemp.width + imgTemp.x + imgTemp.width * 0.8 - 20
            y: recTemp.height - lblLowerTemp.height - txtLowerTemp.height - 20
            text: Math.round(rangeSliderO2.first.value * 100)>=10?Math.round(rangeSliderO2.first.value * 100):"0"+Math.round(rangeSliderO2.first.value * 100)
            font.pixelSize: 40
        }
    }

}
