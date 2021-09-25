import QtQuick 2.11
import QtQuick.Controls 2.2
import QtCharts 2.3
import Qt.labs.folderlistmodel 2.2
import Qt.labs.settings 1.1
import QtMultimedia 5.11

Page {
    id: history
    x: 0
    y: 0
    width: screenWidth
    height: screenHight * 0.75
    property bool settingVis: false
    property bool listVis: true
    property bool vdoMode: true

    Image {
        id: imageTemp
        x: 20
        y: 0.028 * history.height
        width: history.height * 0.1047
        height: history.height * 0.1047
        source: "images/camera.png"
        sourceSize.height: 50
        sourceSize.width: 50
        fillMode: Image.PreserveAspectFit
    }


    Rectangle {
        id: rectangleTemp
        x: 0
        y: imageTemp.y + imageTemp.height
        width: history.width - (1 * imageTemp.width) + (imageTemp.width / 2)
        height: history.height * 0.0084
        color: "#fa40fa"
    }

    Text {
        id: text1
        x: (history.width - text1.width) * 0.5
        y: history.height * 0.0083
        height: history.height * 0.1
        text: qsTr("Realtime Camera")
        font.pixelSize: history.height * 0.075
    }

    ListView {
        id: listFileItems
        x: history.width * 0.52 - lblInfared.width * 0.5 + 40
        y: imageTemp.y + imageTemp.height + 50
        width: parent.width * 0.4
        height: parent.height * 0.4
        visible: history.listVis

        FolderListModel {
            id: folderModel
            folder: "file:///home/pi/Videos/"
            nameFilters: ["*.mp4"]
        }

        Component {
            id: fileDelegate
            Item {
                width: 300; height: 45
                Row {
                    Image {
                        id: thumpNail
                        width: 30
                        height: 30
                        source: "images/rgb.jpg"
                        fillMode: Image.Stretch
                    }
                    Text {
                        text: history.vdoMode?' <b> </b> ' + fileName:' <b> </b> ' + fileName
                        leftPadding: 20
                        font.pointSize: 8
                        verticalAlignment: Text.AlignVCenter
                    }
                }
            }
        }

        model: folderModel
        delegate: fileDelegate
    }

    Slider {
        id: sliderInfaRed
        x: history.width * 0.5 + 50
        y: history.height * 0.3
        height: history.height * 0.4
        orientation: Qt.Vertical
        from: 0
        stepSize: 1
        live: true
        to: 100
        snapMode: Slider.SnapAlways
        visible: history.settingVis

        Settings {
            id: settingFan
            fileName: "Settings.dat"
            category: "Controls"
            property alias infaredVal: sliderInfaRed.value
        }

        onMoved: {
            settingFan.sync();
        }
    }

    Label {
        id: lblInfared
        text: qsTr("Infared")
        x: history.width * 0.52 - lblInfared.width * 0.5 + 40
        y: sliderBrightness.y - 30
        visible: history.settingVis
    }

    Slider {
        id: sliderBrightness
        x: history.width * 0.625 + 50
        y: history.height * 0.3
        height: history.height * 0.4
        orientation: Qt.Vertical
        from: 0
        stepSize: 1
        live: true
        to: 100
        snapMode: Slider.SnapAlways
        visible: history.settingVis

        Settings {
            id: settingBrightness
            fileName: "Settings.dat"
            category: "Controls"
            property alias brightnessVal: sliderBrightness.value
        }

        onMoved: {
            settingBrightness.sync();
        }

    }

    Label {
        id: lblBrightness
        text: qsTr("Brightness")
        x: history.width * 0.645 - lblBrightness.width * 0.5 + 40
        y: sliderBrightness.y - 30
        visible: history.settingVis
    }

    RoundButton {
        id: btnStreaming
        width:80
        height:80
        x: history.width * 0.645 - lblContrast.width * 0.5 - 20
        y: sliderSaturation.y + sliderSaturation.height + 30
        text: qsTr("Video")
        onClicked: {
            history.settingVis = false;
            history.listVis = true;
            history.vdoMode = true;
        }
    }

    Slider {
        id: sliderContrast
        x: history.width * 0.75 + 50
        y: history.height * 0.3
        z:100
        height: history.height * 0.4
        orientation: Qt.Vertical
        from: 0
        stepSize: 1
        live: true
        to: 100
        snapMode: Slider.SnapAlways
        visible: history.settingVis

        Settings {
            id: settingContrast
            fileName: "Settings.dat"
            category: "Controls"
            property alias contrastVal: sliderContrast.value
        }

        onMoved: {
            settingContrast.sync();
        }

    }

    Label {
        id: lblContrast
        text: qsTr("Contrast")
        x: history.width * 0.775 - lblContrast.width * 0.5 + 35
        y: sliderBrightness.y - 30
        visible: history.settingVis
    }

    RoundButton {
        id: btnSnapShot
        width: 80
        height:80
        x: history.width * 0.775 - lblContrast.width * 0.5 - 20
        y: sliderSaturation.y + sliderSaturation.height + 30
        text: qsTr("Images")
        onClicked: {
            history.settingVis = false;
            history.listVis = true;
            history.vdoMode = false;
        }
    }

    Slider {
        id: sliderSaturation
        x: history.width * 0.875 + 50
        y: history.height * 0.3
        height: history.height * 0.4
        orientation: Qt.Vertical
        from: 0
        stepSize: 1
        live: true
        to: 100
        snapMode: Slider.SnapAlways
        visible: history.settingVis

        Settings {
            id: settingSaturation
            fileName: "Settings.dat"
            category: "Controls"
            property alias saturationVal: sliderSaturation.value
        }

        onMoved: {
            settingSaturation.sync();
        }

    }

    Label {
        id: lblSaturation
        text: qsTr("Saturation")
        x: history.width * 0.895 - lblContrast.width * 0.5 + 15
        y: sliderBrightness.y - 30
        visible: history.settingVis
    }

    RoundButton {
        id: btnRecVdo
        width:80
        height:80
        x: history.width * 0.895 - lblContrast.width * 0.5 - 20
        y: sliderSaturation.y + sliderSaturation.height + 30
        text: qsTr("Settings")
        onClicked: {
            history.settingVis = true;
            history.listVis = false;
        }
    }

    Rectangle {
        x: 100
        y: 100
        z: 200
        width: 400
        height: 300
        color: "#FF0000"

        MediaPlayer {
            id: player
            source: "file:///home/pi/Videos/BigBunny.mp4"
            autoPlay: true
            autoLoad: true
            loops: 10
        }

        VideoOutput {
         source: player
         anchors.fill: parent
        }

    }

}
