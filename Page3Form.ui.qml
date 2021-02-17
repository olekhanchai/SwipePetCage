import QtQuick 2.11
import QtQuick.Controls 2.4
import QtCharts 2.15

Page {
    width: 800
    height: 400

    Rectangle {
        id: rectangle2
        x: 75
        y: 58
        width: 727
        height: 4
        color: "#061a8f"
    }

    Rectangle {
        id: rectangle3
        x: 163
        y: 50
        width: 637
        height: 4
        color: "#05bf2f"
    }

    Rectangle {
        id: rectangle1
        x: 118
        y: 54
        width: 682
        height: 4
        color: "#c2b4b4"
    }

    Image {
        id: image7
        x: 91
        y: 11
        width: 50
        height: 50
        source: "images/gray.png"
        sourceSize.height: 50
        sourceSize.width: 50
        fillMode: Image.PreserveAspectFit
    }

    Rectangle {
        id: rectangle
        x: 31
        y: 62
        width: 770
        height: 4
        color: "#fa4040"
    }

    Image {
        id: image1
        x: 0
        y: 19
        width: 50
        height: 50
        source: "images/red.png"
        sourceSize.height: 60
        sourceSize.width: 60
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: image2
        x: 13
        y: 31
        width: 25
        height: 25
        source: "images/temp.png"
        sourceSize.height: 35
        sourceSize.width: 35
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: image3
        x: 45
        y: 14
        width: 50
        height: 50
        source: "images/blue.png"
        sourceSize.height: 50
        sourceSize.width: 50
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: image4
        x: 60
        y: 29
        width: 20
        height: 20
        source: "images/humid.png"
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: image5
        x: 137
        y: 6
        width: 50
        height: 50
        source: "images/green.png"
        sourceSize.height: 50
        sourceSize.width: 50
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: image6
        x: 152
        y: 21
        width: 24
        height: 27
        source: "images/o2.png"
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: image8
        x: 107
        y: 28
        width: 20
        height: 20
        source: "images/co2.png"
        rotation: -1.117
        fillMode: Image.PreserveAspectFit
    }

    Text {
        id: text1
        x: 265
        y: 6
        width: 270
        height: 43
        text: qsTr("History Statistics")
        font.pixelSize: 36
    }
}
