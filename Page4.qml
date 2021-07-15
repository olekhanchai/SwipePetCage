import QtQuick 2.11
import QtQuick.Controls 2.2
import QtCharts 2.3
import QtWebView 1.1
import Qt.labs.folderlistmodel 2.2

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

    WebView {
        id: webView
        x: 20
        y: rectangleTemp.height + rectangleTemp.y + 20
        width: history.width * 0.5 - 20
        height: history.height - statusBar.height - 20
        url: "http://192.168.1.47/html";
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
            folder: "file:///C:/Qt/"
            nameFilters: ["*.qml"]
        }

        Component {
            id: fileDelegate
            Item {
                width: 300; height: 65
                Row {
                    Image {
                        id: thumpNail
                        width: 60
                        height: 60
                        source: "images/rgb.jpg"
                        fillMode: Image.Stretch
                    }
                    Text {
                        text: history.vdoMode?' <b> Video DateTime : </b> ' + fileName:' <b> Image DateTime : </b> ' + fileName
                        leftPadding: 20
                        font.pointSize: 13
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
        width:100
        height:100
        x: history.width * 0.645 - lblContrast.width * 0.5 - 50
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
    }

    Label {
        id: lblContrast
        text: qsTr("Contrast")
        x: history.width * 0.775 - lblContrast.width * 0.5 + 40
        y: sliderBrightness.y - 30
        visible: history.settingVis
    }

    RoundButton {
        id: btnSnapShot
        width:100
        height:100
        x: history.width * 0.775 - lblContrast.width * 0.5 - 50
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
    }

    Label {
        id: lblSaturation
        text: qsTr("Saturation")
        x: history.width * 0.895 - lblContrast.width * 0.5 + 40
        y: sliderBrightness.y - 30
        visible: history.settingVis
    }

    RoundButton {
        id: btnRecVdo
        width:100
        height:100
        x: history.width * 0.895 - lblContrast.width * 0.5 - 50
        y: sliderSaturation.y + sliderSaturation.height + 30
        text: qsTr("Settings")
        onClicked: {
            history.settingVis = true;
            history.listVis = false;
        }
    }
}
