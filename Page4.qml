import QtQuick 2.11
import QtQuick.Controls 2.2
import QtCharts 2.3
import QtMultimedia 5.0

Page {
    id: history
    width: 800
    height: 480 * 0.85

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

    Camera {
        id: camera

        imageProcessing.whiteBalanceMode: CameraImageProcessing.WhiteBalanceFlash

        exposure {
            exposureCompensation: -1.0
            exposureMode: Camera.ExposurePortrait
        }

        flash.mode: Camera.FlashRedEyeReduction

        imageCapture {
            onImageCaptured: {
                photoPreview.source = preview  // Show the preview in an Image
            }
        }
    }

    VideoOutput {
        source: camera
        anchors.bottomMargin: 10
        anchors.rightMargin: 10
        anchors.leftMargin: 10
        anchors.topMargin: 65
        anchors.fill: parent
        focus : visible // to receive focus and capture key events when visible
    }

    Image {
        id: photoPreview
    }
}
