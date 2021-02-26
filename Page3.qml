import QtQuick 2.11
import QtQuick.Controls 2.2
import QtCharts 2.3

Page {
    id: history
    width: screenWidth
    height: screenHight * 0.85

    Image {
        id: imageO2
        x: imageTemp.width + imageHumid.width + imageCO2.width
        y: 0.028 * history.height
        width: history.height * 0.1047
        height: history.height * 0.1047
        source: "images/green.png"
        sourceSize.height: 50
        sourceSize.width: 50
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: imageCO2
        x: imageTemp.width + imageHumid.width
        y: imageO2.y + history.height * 0.0084
        width: history.height * 0.1047
        height: history.height * 0.1047
        source: "images/gray.png"
        sourceSize.height: 50
        sourceSize.width: 50
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: imageHumid
        x: imageTemp.width
        y: imageCO2.y + history.height * 0.0084
        width: history.height * 0.1047
        height: history.height * 0.1047
        source: "images/blue.png"
        sourceSize.height: 0.1041 * history.height
        sourceSize.width: 0.1041 * history.height
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: imageTemp
        x: 0
        y: imageHumid.y + history.height * 0.0084
        width: history.height * 0.1047
        height: history.height * 0.1047
        source: "images/red.png"
        sourceSize.height: 50
        sourceSize.width: 50
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: imageTempIcon
        x: imageTemp.x + (imageTemp.width * 0.5) - history.height * 0.025
        y: imageTemp.y + (imageTemp.height * 0.5) - history.height * 0.025
        width: history.height * 0.05
        height: history.height * 0.05
        source: "images/temp.png"
        sourceSize.height: 20
        sourceSize.width: 20
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: imageHumidIcon
        x: imageHumid.x + (imageHumid.width * 0.5) - history.height * 0.025
        y: imageHumid.y + (imageHumid.height * 0.5) - history.height * 0.025
        width: history.height * 0.05
        height: history.height * 0.05
        source: "images/humid.png"
        sourceSize.height: 50
        sourceSize.width: 50
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: imageCO2Icon
        x: imageCO2.x + (imageCO2.width * 0.5) - history.height * 0.025
        y: imageCO2.y + (imageCO2.height * 0.5) - history.height * 0.025
        width: history.height * 0.05
        height: history.height * 0.05
        source: "images/co2.png"
        sourceSize.height: 50
        sourceSize.width: 50
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: imageO2Icon
        x: imageO2.x + (imageO2.width * 0.5) - history.height * 0.025
        y: imageO2.y + (imageO2.height * 0.5) - history.height * 0.025
        width: history.height * 0.05
        height: history.height * 0.05
        source: "images/o2.png"
        sourceSize.height: history.height * 0.1047
        sourceSize.width: history.height * 0.1047
        fillMode: Image.PreserveAspectFit
    }

    Rectangle {
        id: rectangleO2
        x: imageO2.x + imageO2.width * 0.5
        y: imageO2.y + imageO2.height
        width: history.width - (4 * imageTemp.width) + (imageTemp.width / 2)
        height: history.height * 0.0084
        color: "#05bf2f"
    }

    Rectangle {
        id: rectangleCO2
        x: imageCO2.x + imageCO2.width * 0.5
        y: imageCO2.y + imageCO2.height
        width: history.width - (3 * imageTemp.width) + (imageTemp.width / 2)
        height: history.height * 0.0084
        color: "#c2b4b4"
    }

    Rectangle {
        id: rectangleHumid
        x: imageHumid.x + imageHumid.width * 0.5
        y: imageHumid.y + imageHumid.height
        width: history.width - (2 * imageTemp.width) + (imageTemp.width / 2)
        height: history.height * 0.0084
        color: "#061a8f"
    }

    Rectangle {
        id: rectangleTemp
        x: imageTemp.x + imageTemp.width * 0.5
        y: imageTemp.y + imageTemp.height
        width: history.width - (1 * imageTemp.width) + (imageTemp.width / 2)
        height: history.height * 0.0084
        color: "#fa4040"
    }

    Text {
        id: text1
        x: (history.width - text1.width) * 0.5
        y: history.height * 0.0083
        height: history.height * 0.1
        text: qsTr("History Statistics")
        font.pixelSize: history.height * 0.075
    }

    ChartView {
        id: chart
        x: screenWidth * 0.05
        y: rectangleTemp.y
        width: history.width * 0.9
        height: history.height - imageTemp.height

        SplineSeries {
            id: spline
            name: "SplineSeries"
            XYPoint { x: 0; y: 0.0 }
            XYPoint { x: 1.1; y: 3.2 }
            XYPoint { x: 1.9; y: 2.4 }
            XYPoint { x: 2.1; y: 2.1 }
            XYPoint { x: 2.9; y: 2.6 }
            XYPoint { x: 3.4; y: 2.3 }
            XYPoint { x: 4.1; y: 3.1 }
        }

    }
}

/*##^##
Designer {
    D{i:0;uuid:"1d69952d55f588ad6134bf7f8062b8fb"}D{i:1;uuid:"97a9aff5b382edaa64772d057250cdb6"}
D{i:2;uuid:"46171d6c08b465ac809beded1d23d6cc"}D{i:3;uuid:"5bcbc0fe13f02ff6de1d9824e4ce3275"}
D{i:4;uuid:"625c474198ff5aae16fafbdd8cc73caf"}D{i:5;uuid:"be9d20288af8541ba0e9904a019861da"}
D{i:6;uuid:"0cb511da090e2221246e09bea2e72a30"}D{i:7;uuid:"39d183648632a1e5b5174023bad85c02"}
D{i:8;uuid:"acc9875ee0b2abd8b832ae1242f2de2f"}D{i:9;uuid:"6f403568c7797f90c996f55b15340d10"}
D{i:10;uuid:"13e5f3f1dfc981455ab4add861137291"}D{i:11;uuid:"8216e2dc724139e13083e2643c0224a2"}
D{i:12;uuid:"71e89080a9789ee3430a4ddf9999f7e4"}D{i:13;uuid:"1861885f7a080e6259ba03219b09291c"}
D{i:14;uuid:"f22ae98b3e1bca1005f134c4b7c5d46d"}
}
##^##*/
