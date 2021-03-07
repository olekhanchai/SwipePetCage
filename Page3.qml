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
        id: tempChart
        x: 0
        y: rectangleTemp.y
        z: 90

        width: rectangleTemp.width * 0.5
        height: (parent.height - rectangleO2.y) * 0.5

        SplineSeries {
            id: splineTemp
            name: "Temp ( °C )"
            color: "#fa4040"
            axisX: DateTimeAxis {
                format: "HH:mm:ss"
                tickCount: 10
            }
            axisY: ValueAxis {
                min: 30
                max: 31
                tickCount: 5
                labelFormat: "%.1f"
            }
        }
    }

    ChartView {
        id: humidChart
        x: rectangleTemp.width * 0.5
        y: rectangleTemp.y
        z: 90

        width: rectangleTemp.width * 0.5
        height: (parent.height - rectangleO2.y) * 0.5

        SplineSeries {
            id: splineHumid
            name: "Humid ( \%RH )"
            color: "#061a8f"
            axisY: ValueAxis {
                tickCount: 5
                max: 61
                min: 60
                labelFormat: "%d"
            }
            axisX: DateTimeAxis {
                tickCount: 10
                format: "HH:mm:ss"
            }
        }
    }

    ChartView {
        id: co2Chart
        x: 0
        y: tempChart.height + 80
        z: 99
        width: rectangleTemp.width * 0.5
        height: (parent.height - rectangleO2.y) * 0.5
        SplineSeries {
            id: splineCO2
            name: "CO2 ( ppm )"
            color: "#c2b4b4"
            axisY: ValueAxis {
                tickCount: 5
                max: 441
                min: 440
                labelFormat: "%d"
            }
            axisX: DateTimeAxis {
                tickCount: 10
                format: "HH:mm:ss"
            }
        }
    }

    ChartView {
        id: o2Chart
        x: rectangleTemp.width * 0.5
        y: humidChart.height + 80
        z: 99
        width: rectangleTemp.width * 0.5
        height: (parent.height - rectangleO2.y) * 0.5
        SplineSeries {
            id: splineO2
            name: "O2 ( \% )"
            color: "#05bf2f"
            axisY: ValueAxis {
                tickCount: 5
                max: 55
                min: 54
                labelFormat: "%d"
            }
            axisX: DateTimeAxis {
                tickCount: 10
                format: "HH:mm:ss"
            }
        }
    }

    Timer {
        interval: 1000
        running: true
        repeat: true
        function lastMin() {
            var my = new Date();
            my.setMinutes(my.getMinutes()-1);
            return(new Date(my));
        }

        onTriggered: {

            var plotYTemp = 25 + Math.random() * 10;
            var plotYO2 = 20 + Math.random() * 50;
            var plotYCO2 = 440 + Math.random() * 100;
            var plotYHumid = 60 + Math.random() * 20;

            var plotX = new Date();

            splineTemp.axisX.min = lastMin();
            splineTemp.axisX.max = new Date();
            if (plotYTemp * 1.1 > splineTemp.axisY.max) splineTemp.axisY.max = plotYTemp * 1.1;
            if (plotYTemp * 0.9 < splineTemp.axisY.min) splineTemp.axisY.min = plotYTemp * 0.9;
            splineTemp.append(plotX, plotYTemp);

            splineHumid.axisX.min = lastMin();
            splineHumid.axisX.max = new Date();
            if (plotYHumid * 1.1 > splineHumid.axisY.max) splineHumid.axisY.max = plotYHumid * 1.1;
            if (plotYHumid * 0.9 < splineHumid.axisY.min) splineHumid.axisY.min = plotYHumid * 0.9;
            splineHumid.append(plotX, plotYHumid);

            splineCO2.axisX.min = lastMin();
            splineCO2.axisX.max = new Date();
            if (plotYCO2 * 1.1 > splineCO2.axisY.max) splineCO2.axisY.max = plotYCO2 * 1.1;
            if (plotYCO2 * 0.9 < splineCO2.axisY.min) splineCO2.axisY.min = plotYCO2 * 0.9;
            splineCO2.append(plotX, plotYCO2);

            splineO2.axisX.min = lastMin();
            splineO2.axisX.max = new Date();
            if (plotYO2 * 1.1 > splineO2.axisY.max) splineO2.axisY.max = plotYO2 * 1.1;
            if (plotYO2 * 0.9 < splineO2.axisY.min) splineO2.axisY.min = plotYO2 * 0.9;
            splineO2.append(plotX, plotYO2);
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
