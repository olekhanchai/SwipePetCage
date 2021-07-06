import QtQuick 2.11
import QtQuick.Controls 2.2
import QtCharts 2.3
import QtWebView 1.1

Page {
    id: history
    x: 0
    y: 0
    width: screenWidth
    height: screenHight * 0.75

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
        x: 150
        y: 50
        width: 320
        height: 230
        url: "http://192.168.1.49:4747/video";
    }

}
