import QtQuick 2.11
import QtQuick.Controls 2.2
import Qt.labs.settings 1.1

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
        color: "#FF6400"

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
            x: recTemp.x + 10
            y: 20
            width: 69
            height: 30
            text: qsTr("UpperLimit")
            font.pixelSize: 15
        }

        Text {
            id: txtUpperTemp
            x:  recTemp.x + 40
            y: 60
            text: Math.round(rangeSliderTemp.second.value * 100)>=10?Math.round(rangeSliderTemp.second.value * 100):"0"+Math.round(rangeSliderTemp.second.value * 100)
            font.pixelSize: 20
        }

        RangeSlider {
            id: rangeSliderTemp
            x:  imgTemp.width + imgTemp.x + imgTemp.width * 0.8 - 20
            y:  20
            second.value: 0.75
            first.value: 0.25
            orientation: Qt.Vertical

            Settings {
                id: settingRangeTemp
                fileName: "Settings.dat"
                category: "Controls"
                //property alias rangeTempUpperVal: rangeSliderTemp.second.value
                //property alias rangeTempLowerVal: rangeSliderTemp.first.value
            }

            Connections {
                target: first
                onValueChanged: settingRangeTemp.sync()
            }

            Connections {
                target: second
                onValueChanged: settingRangeTemp.sync()
            }
        }

        Text {
            id: lblLowerTemp
            x: recTemp.x + 10
            y: recTemp.height - lblLowerTemp.height - 20
            width: 69
            height: 30
            text: qsTr("LowerLimit")
            font.pixelSize: 15
        }

        Text {
            id: txtLowerTemp
            x: recTemp.x + 40
            y: recTemp.height - lblLowerTemp.height - txtLowerTemp.height - 20
            text: Math.round(rangeSliderTemp.first.value * 100)>=10?Math.round(rangeSliderTemp.first.value * 100):"0"+Math.round(rangeSliderTemp.first.value * 100)
            font.pixelSize: 20
        }
    }
    Rectangle {
        id: recHumid
        x: recTemp.width + 30
        y: imageGear.y + imageGear.height + 20
        width: parent.width * 0.25 - 20
        height: parent.height * 0.8
        color: "#008D96"

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
            x: recTemp.x + 10
            y: 20
            width: 69
            height: 30
            text: qsTr("UpperLimit")
            font.pixelSize: 15
        }

        Text {
            id: txtUpperHumid
            x: recTemp.x + 40
            y: 60
            text: Math.round(rangeSliderHumid.second.value * 100)>=10?Math.round(rangeSliderHumid.second.value * 100):"0"+Math.round(rangeSliderHumid.second.value * 100)
            font.pixelSize: 20
        }

        RangeSlider {
            id: rangeSliderHumid
            x:  imgTemp.width + imgTemp.x + imgTemp.width * 0.8 - 20
            y:  20
            second.value: 0.75
            first.value: 0.25
            orientation: Qt.Vertical

            Settings {
                id: settingRangeHumid
                fileName: "Settings.dat"
                category: "Controls"
                //property alias rangeHumidUpperVal: rangeSliderHumid.second.value
                //property alias rangeHumidLowerVal: rangeSliderHumid.first.value
            }

        }

        Text {
            id: lblLowerHumid
            x: recTemp.x + 10
            y: recTemp.height - lblLowerTemp.height - 20
            width: 69
            height: 30
            text: qsTr("LowerLimit")
            font.pixelSize: 15
        }

        Text {
            id: txtLowerHumid
            x: recTemp.x + 40
            y: recTemp.height - lblLowerTemp.height - txtLowerTemp.height - 20
            text: Math.round(rangeSliderHumid.first.value * 100)>=10?Math.round(rangeSliderHumid.first.value * 100):"0"+Math.round(rangeSliderHumid.first.value * 100)
            font.pixelSize: 20
        }
    }

    Rectangle {
        id: recCo2
        x: screenWidth * 0.5
        y: imageGear.y + imageGear.height + 20
        width: parent.width * 0.25 - 20
        height: parent.height * 0.8
        color: "#646464"

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
            x: recTemp.x + 10
            y: 20
            width: 69
            height: 30
            text: qsTr("UpperLimit")
            font.pixelSize: 15
        }

        Text {
            id: txtUpperCo2
            x: recTemp.x + 40
            y: 60
            text: Math.round(rangeSliderCo2.second.value * 100)>=10?Math.round(rangeSliderCo2.second.value * 100):"0"+Math.round(rangeSliderCo2.second.value * 100)
            font.pixelSize: 20
        }

        RangeSlider {
            id: rangeSliderCo2
            x:  imgTemp.width + imgTemp.x + imgTemp.width * 0.8 - 20
            y:  20
            second.value: 0.75
            first.value: 0.25
            orientation: Qt.Vertical

            Settings {
                id: settingRangeCo2
                fileName: "Settings.dat"
                category: "Controls"

                //property alias rangeCo2UpperVal: rangeSliderCo2.second.value
                //property alias rangeCo2LowerVal: rangeSliderCo2.first.value
            }

        }

        Text {
            id: lblLowerCo2
            x: recTemp.x + 10
            y: recTemp.height - lblLowerTemp.height - 20
            width: 69
            height: 30
            text: qsTr("LowerLimit")
            font.pixelSize: 15
        }

        Text {
            id: txtLowerCo2
            x: recTemp.x + 40
            y: recTemp.height - lblLowerTemp.height - txtLowerTemp.height - 20
            text: Math.round(rangeSliderCo2.first.value * 100)>=10?Math.round(rangeSliderCo2.first.value * 100):"0"+Math.round(rangeSliderCo2.first.value * 100)
            font.pixelSize: 20
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
            x: recTemp.x + 10
            y: 20
            width: 69
            height: 30
            text: qsTr("UpperLimit")
            font.pixelSize: 15
        }

        Text {
            id: txtUpperO2
            x: recTemp.x + 40
            y: 60
            text: Math.round(rangeSliderO2.second.value * 100)>=10?Math.round(rangeSliderO2.second.value * 100):"0"+Math.round(rangeSliderO2.second.value * 100)
            font.pixelSize: 20
        }

        RangeSlider {
            id: rangeSliderO2
            x:  imgTemp.width + imgTemp.x + imgTemp.width * 0.8 - 20
            y:  20
            second.value: 0.75
            first.value: 0.25
            orientation: Qt.Vertical

            Settings {
                id: settingRangeO2
                fileName: "Settings.dat"
                category: "Controls"
                //property alias rangeO2UpperVal: rangeSliderO2.second.value
                //roperty alias rangeO2LowerVal: rangeSliderO2.first.value
            }
        }

        Text {
            id: lblLowerO2
            x: recTemp.x + 10
            y: recTemp.height - lblLowerTemp.height - 20
            width: 69
            height: 30
            text: qsTr("LowerLimit")
            font.pixelSize: 15
        }

        Text {
            id: txtLowerO2
            x: recTemp.x + 40
            y: recTemp.height - lblLowerTemp.height - txtLowerTemp.height - 20
            text: Math.round(rangeSliderO2.first.value * 100)>=10?Math.round(rangeSliderO2.first.value * 100):"0"+Math.round(rangeSliderO2.first.value * 100)
            font.pixelSize: 20
        }
    }

}
