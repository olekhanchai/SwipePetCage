import QtQuick 2.11
import QtQuick.Controls 2.2
import QtCharts 2.3

Page {
    width: screenWidth
    height: screenHight

    Grid {
        id: grid
        x: 0
        y: 0
        width: screenWidth
        height: screenHight * 0.75

        Image {
            id: imageTemp
            width: grid.width * 0.5
            height: grid.height * 0.5
            anchors.left: parent.left
            anchors.top: parent.top
            source: "images/temperature.png"
            anchors.leftMargin: 0
            anchors.topMargin: 0
            sourceSize.height: grid.height * 0.5
            sourceSize.width: grid.width * 0.5
            layer.textureMirroring: ShaderEffectSource.NoMirroring
            fillMode: Image.Stretch

            Image {
                id: imageGearTemp
                x: 45
                y: imageTemp.height - 75
                z: 99
                width: 50
                height: 50
                source: "images/gear.png"
                sourceSize.height: 50
                sourceSize.width: 50
                fillMode: Image.PreserveAspectFit

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if (redGear.visible) {
                            redGear.visible = false;
                            redUp.visible = false;
                            redDown.visible = false;
                        } else {
                            redGear.visible = true;
                            redUp.visible = true;
                            redDown.visible = true;
                        }
                    }
                }

            }

            Image {
                id: imageTempBar
                x: imageTemp.width * 0.25 + 20
                y: imageTemp.height * 0
                width: imageTemp.width * 0.58
                height: imageTemp.height * 1
                source: "images/orangebar.png"
                sourceSize.height: imageTemp.height * 1
                sourceSize.width: imageTemp.width * 0.68
                fillMode: Image.PreserveAspectFit
            }

            Image {
                id: imageTempCircle
                x: imageTemp.width * 0.15
                y: imageTemp.height * 0.15
                width: imageTemp.height * 0.7
                height: imageTemp.height * 0.7
                source: "images/red.png"
                fillMode: Image.PreserveAspectFit
                Image {
                    id: imageTempIcon
                    x: imageTempCircle.width * 0.5 - imageTempIcon.width + (imageTempIcon.width / 2)
                    y: imageTempCircle.height * 0.5 - (imageTemp.height * 0.24) / 2
                    width: imageTemp.width * 0.06
                    height: imageTemp.height * 0.2
                    source: "images/temp.png"
                }
            }

            Text {
                id: textTemp
                x: imageTemp.width * 0.5
                y: imageTemp.height * 0.5 - (imageTemp.height * 0.1) / 2
                text: qsTr("--.-- °C")
                font.pixelSize: imageTemp.height * 0.1
            }

            Image {
                id: redGear
                x: imageTemp.width * 0.15
                y: imageTemp.height * 0.15
                width: imageTemp.height * 0.7
                height: imageTemp.height * 0.7
                source: "images/setgear.png"
                visible: false
            }

            Image {
                id: redUp
                x: imageTemp.width * 0.5 + redUp.width * 0.5
                y: imageTemp.height * 0.5 - redUp.height - (redUp.height * 0.5)
                width: imageTemp.height * 0.25
                height: imageTemp.height * 0.25
                source: "images/redup.png"
                sourceSize.height: imageTemp.height * 0.25
                sourceSize.width: imageTemp.height * 0.25
                visible: false
                MouseArea {
                    anchors.fill: parent
                    onPressed: {
                        redUp.source = "file:///" + applicationDirPath + "/images/reduppush.png"
                        redUp.sourceSize.width = imageTemp.width * 0.68;
                        redUp.sourceSize.height = imageTemp.height;
                        redUp.width = imageTemp.height * 0.25;
                        redUp.height = imageTemp.height * 0.25;
                        redUp.x = imageTemp.width * 0.5 + redUp.width * 0.5;
                        redUp.y = imageTemp.height * 0.5 - redUp.height - (redUp.height * 0.5);
                        targetTemp.text = (parseInt(targetTemp.text)+1)
                        textTemp.text = "  " + targetTemp.text + " °C"
                    }
                    onReleased: {
                        redUp.source = "file:///" + applicationDirPath + "/images/redup.png"
                        redUp.sourceSize.width = imageTemp.width * 0.68;
                        redUp.sourceSize.height = imageTemp.height;
                        redUp.width = imageTemp.height * 0.25
                        redUp.height = imageTemp.height * 0.25
                        redUp.x = imageTemp.width * 0.5 + redUp.width * 0.5;
                        redUp.y = imageTemp.height * 0.5 - redUp.height - (redUp.height * 0.5);
                    }
                }
            }

            Image {
                id: redDown
                x: imageTemp.width * 0.5 + redDown.width * 0.5
                y: imageTemp.height * 0.5 + (redDown.height * 0.5)
                width: imageTemp.height * 0.25
                height: imageTemp.height * 0.25
                source: "images/reddown.png"
                sourceSize.height: imageTemp.height * 0.25
                sourceSize.width: imageTemp.height * 0.25
                visible: false
                MouseArea {
                    anchors.fill: parent
                    onPressed: {
                        redDown.source = "file:///" + applicationDirPath + "/images/reddownpush.png"
                        redDown.sourceSize.width = imageCO2.height * 0.25;
                        redDown.sourceSize.height = imageCO2.height * 0.25;
                        redDown.width = imageCO2.height * 0.25;
                        redDown.height = imageCO2.height * 0.25;
                        redDown.x = imageCO2.width * 0.5 + redDown.width * 0.5;
                        redDown.y = imageCO2.height * 0.5 + (redDown.height * 0.5);
                        targetTemp.text = (parseInt(targetTemp.text)-1)
                        textTemp.text = "  " + targetTemp.text + " °C"
                    }
                    onReleased: {
                        redDown.source = "file:///" + applicationDirPath + "/images/reddown.png"
                        redDown.sourceSize.width = imageCO2.height * 0.25;
                        redDown.sourceSize.height = imageCO2.height * 0.25;
                        redDown.width = imageCO2.height * 0.25;
                        redDown.height = imageCO2.height * 0.25;
                        redDown.x = imageCO2.width * 0.5 + redDown.width * 0.5;
                        redDown.y = imageCO2.height * 0.5 + (redDown.height * 0.5);
                    }
                }
            }

        }

        Image {
            id: imageHumid
            x: grid.width / 2 + 1
            width: grid.width / 2
            height: grid.height / 2
            anchors.right: parent.right
            anchors.top: parent.top
            source: "images/humidity.jpg"
            anchors.rightMargin: 0
            anchors.topMargin: 0
            sourceSize.height: grid.height * 0.5
            sourceSize.width: grid.width * 0.5
            fillMode: Image.Stretch

            Image {
                id: imageHumidBar
                x: imageHumid.width * 0.25 + 20
                y: imageHumid.height * 0
                width: imageHumid.width * 0.58
                height: imageHumid.height * 1
                source: "images/bluebar.png"
                autoTransform: true
                sourceSize.height: 184
                sourceSize.width: 267
                fillMode: Image.PreserveAspectFit
            }

            Image {
                id: imageHumidCircle
                x: imageHumid.width * 0.15
                y: imageHumid.height * 0.15
                width: imageHumid.height * 0.7
                height: imageHumid.height * 0.7
                source: "images/blue.png"
                fillMode: Image.PreserveAspectFit

                Image {
                    id: imageHumidIcon
                    x: imageHumidCircle.width * 0.5 - (imageHumid.height * 0.25) / 2
                    y: imageHumidCircle.height * 0.5 - (imageHumid.height * 0.25) / 2
                    width: imageHumid.height * 0.25
                    height: imageHumid.height * 0.25
                    source: "images/humid.png"
//                    MouseArea {
//                        anchors.fill: parent
//                        onClicked: {
//                            if (blueGear.visible) {
//                                blueGear.visible = false;
//                                blueUp.visible = false;
//                                blueDown.visible = false;
//                            } else {
//                                blueGear.visible = true;
//                                blueUp.visible = true;
//                                blueDown.visible = true;
//                            }
//                        }
//                    }
                }
            }

            Text {
                id: textHumid
                x: imageHumid.width * 0.5
                y: imageHumid.height * 0.5 - (imageHumid.height * 0.1) / 2
                text: qsTr("--.-- %RH")
            font.pixelSize: imageHumid.height * 0.1
            }

            Image {
                id: blueGear
                x: imageHumid.width * 0.15
                y: imageHumid.height * 0.15
                width: imageHumid.height * 0.7
                height: imageHumid.height * 0.7
                source: "images/setgear.png"
                visible: false
            }

            Image {
                id: blueUp
                x: imageHumid.width * 0.5 + blueUp.width * 0.5
                y: imageHumid.height * 0.5 - blueUp.height - (blueUp.height * 0.5)
                width: imageHumid.height * 0.25
                height: imageHumid.height * 0.25
                source: "images/blueup.png"
                sourceSize.height: imageHumid.height * 0.25
                sourceSize.width: imageHumid.height * 0.25
                visible: false
//                MouseArea {
//                    anchors.fill: parent
//                    onPressed: {
//                        blueUp.source = "file:///" + applicationDirPath + "/images/blueuppush.png"
//                        blueUp.sourceSize.width = imageCO2.width * 0.68;
//                        blueUp.sourceSize.height = imageCO2.height;
//                        blueUp.width = imageCO2.height * 0.25;
//                        blueUp.height = imageCO2.height * 0.25;
//                        blueUp.x = imageCO2.width * 0.5 + blueUp.width * 0.5;
//                        blueUp.y = imageCO2.height * 0.5 - blueUp.height - (blueUp.height * 0.5);
//                        targetHumid.text = (parseInt(targetHumid.text)+1)
//                        textHumid.text = "  " + targetHumid.text + " %RH"
//                    }
//                    onReleased: {
//                        blueUp.source = "file:///" + applicationDirPath + "/images/blueup.png"
//                        blueUp.sourceSize.width = imageCO2.width * 0.68;
//                        blueUp.sourceSize.height = imageCO2.height;
//                        blueUp.width = imageCO2.height * 0.25
//                        blueUp.height = imageCO2.height * 0.25
//                        blueUp.x = imageCO2.width * 0.5 + blueUp.width * 0.5;
//                        blueUp.y = imageCO2.height * 0.5 - blueUp.height - (blueUp.height * 0.5);
//                    }
//                }
            }

            Image {
                id: blueDown
                x: imageHumid.width * 0.5 + blueDown.width * 0.5
                y: imageHumid.height * 0.5 + (blueDown.height * 0.5)
                width: imageHumid.height * 0.25
                height: imageHumid.height * 0.25
                source: "images/bluedown.png"
                sourceSize.height:imageHumid.height * 0.25
                sourceSize.width: imageHumid.height * 0.25
                visible: false
//                MouseArea {
//                    anchors.fill: parent
//                    onPressed: {
//                        blueDown.source = "file:///" + applicationDirPath + "/images/bluedownpush.png"
//                        blueDown.sourceSize.width = imageCO2.height * 0.25;
//                        blueDown.sourceSize.height = imageCO2.height * 0.25;
//                        blueDown.width = imageCO2.height * 0.25;
//                        blueDown.height = imageCO2.height * 0.25;
//                        blueDown.x = imageCO2.width * 0.5 + blueDown.width * 0.5;
//                        blueDown.y = imageCO2.height * 0.5 + (blueDown.height * 0.5);
//                        targetHumid.text = (parseInt(targetHumid.text)-1)
//                        textHumid.text = "  " + targetHumid.text + " %RH"
//                    }
//                    onReleased: {
//                        blueDown.source = "file:///" + applicationDirPath + "/images/bluedown.png"
//                        blueDown.sourceSize.width = imageCO2.height * 0.25;
//                        blueDown.sourceSize.height = imageCO2.height * 0.25;
//                        blueDown.width = imageCO2.height * 0.25;
//                        blueDown.height = imageCO2.height * 0.25;
//                        blueDown.x = imageCO2.width * 0.5 + blueDown.width * 0.5;
//                        blueDown.y = imageCO2.height * 0.5 + (blueDown.height * 0.5);
//                    }
//                }
            }

        }

        Image {
            id: imageCO2
            y: 0
            width: grid.width / 2
            height: grid.height / 2
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            source: "images/carbondioxide.png"
            anchors.bottomMargin: 0
            anchors.leftMargin: 0
            sourceSize.height: grid.height / 2
            sourceSize.width: grid.width / 2
            fillMode: Image.Stretch

            Image {
                id: imageCO2Bar
                x: imageCO2.width * 0.25 + 20
                y: imageCO2.height * 0
                width: imageCO2.width * 0.58
                height: imageCO2.height * 1
                source: "images/graybar.png"
                fillMode: Image.PreserveAspectFit
            }

            Image {
                id: imageCO2Circle
                x: imageCO2.width * 0.15
                y: imageCO2.height * 0.15
                width: imageCO2.height * 0.7
                height: imageCO2.height * 0.7
                source: "images/gray.png"
                fillMode: Image.PreserveAspectFit

                Image {
                    id: imageCO2Icon
                    x: imageCO2Circle.width * 0.5 - (imageCO2.height * 0.25) / 2
                    y: imageCO2Circle.height * 0.5 - (imageCO2.height * 0.25) / 2
                    width: imageCO2.height * 0.25
                    height: imageCO2.height * 0.25
                    source: "images/co2.png"
//                    MouseArea {
//                        anchors.fill: parent
//                        onClicked: {
//                            if (greyGear.visible) {
//                                greyGear.visible = false;
//                                grayUp.visible = false;
//                                grayDown.visible = false;
//                            } else {
//                                greyGear.visible = true;
//                                grayUp.visible = true;
//                                grayDown.visible = true;
//                            }
//                        }
//                    }
                }
            }

            Text {
                id: textCO2
                x: imageCO2.width * 0.5
                y: imageCO2.height * 0.5 - (imageCO2.height * 0.1) / 2
                text: qsTr("--.-- PPM")
                font.pixelSize: imageCO2.height * 0.1
            }

            Image {
                id: greyGear
                x: imageCO2.width * 0.15
                y: imageCO2.height * 0.15
                width: imageCO2.height * 0.7
                height: imageCO2.height * 0.7
                source: "images/setgear.png"
                visible: false
            }

            Image {
                id: grayUp
                x: imageCO2.width * 0.5 + grayUp.width * 0.5
                y: imageCO2.height * 0.5 - grayUp.height - (grayUp.height * 0.5)
                width: imageCO2.height * 0.25
                height: imageCO2.height * 0.25
                source: "images/greyup.png"
                sourceSize.height: imageCO2.height * 0.25
                sourceSize.width: imageCO2.height * 0.25
                visible: false
//                MouseArea {
//                    anchors.fill: parent
//                    onPressed: {
//                        grayUp.source = "file:///" + applicationDirPath + "/images/greyuppush.png"
//                        grayUp.sourceSize.width = imageCO2.width * 0.68;
//                        grayUp.sourceSize.height = imageCO2.height;
//                        grayUp.width = imageCO2.height * 0.25;
//                        grayUp.height = imageCO2.height * 0.25;
//                        grayUp.x = imageCO2.width * 0.5 + grayUp.width * 0.5;
//                        grayUp.y = imageCO2.height * 0.5 - grayUp.height - (grayUp.height * 0.5);
//                        targetCO2.text = (parseInt(targetCO2.text)+1)
//                        textCO2.text = "  " + targetCO2.text + " PPM"
//                    }
//                    onReleased: {
//                        grayUp.source = "file:///" + applicationDirPath + "/images/greyup.png"
//                        grayUp.sourceSize.width = imageCO2.width * 0.68;
//                        grayUp.sourceSize.height = imageCO2.height;
//                        grayUp.width = imageCO2.height * 0.25
//                        grayUp.height = imageCO2.height * 0.25
//                        grayUp.x = imageCO2.width * 0.5 + grayUp.width * 0.5;
//                        grayUp.y = imageCO2.height * 0.5 - grayUp.height - (grayUp.height * 0.5);
//                    }
//                }
            }

            Image {
                id: grayDown
                x: imageCO2.width * 0.5 + grayDown.width * 0.5
                y: imageCO2.height * 0.5 + (grayDown.height * 0.5)
                width: imageCO2.height * 0.25
                height: imageCO2.height * 0.25
                source: "images/greydown.png"
                sourceSize.height: imageCO2.height * 0.25
                sourceSize.width: imageCO2.height * 0.25
                visible: false
//                MouseArea {
//                    anchors.fill: parent
//                    onPressed: {
//                        grayDown.source = "file:///" + applicationDirPath + "/images/greydownpush.png"
//                        grayDown.sourceSize.width = imageCO2.height * 0.25;
//                        grayDown.sourceSize.height = imageCO2.height * 0.25;
//                        grayDown.width = imageCO2.height * 0.25;
//                        grayDown.height = imageCO2.height * 0.25;
//                        grayDown.x = imageCO2.width * 0.5 + grayDown.width * 0.5;
//                        grayDown.y = imageCO2.height * 0.5 + (grayDown.height * 0.5);
//                        targetCO2.text = (parseInt(targetCO2.text)-1)
//                        textCO2.text = "  " + targetCO2.text + " PPM"
//                    }
//                    onReleased: {
//                        grayDown.source = "file:///" + applicationDirPath + "/images/greydown.png"
//                        grayDown.sourceSize.width = imageCO2.height * 0.25;
//                        grayDown.sourceSize.height = imageCO2.height * 0.25;
//                        grayDown.width = imageCO2.height * 0.25;
//                        grayDown.height = imageCO2.height * 0.25;
//                        grayDown.x = imageCO2.width * 0.5 + grayDown.width * 0.5;
//                        grayDown.y = imageCO2.height * 0.5 + (grayDown.height * 0.5);
//                    }
//                }
            }

        }

        Image {
            id: imageO2
            x: grid.width / 2 + 1
            y: grid.height / 2
            width: grid.width / 2
            height: grid.height / 2
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            source: "images/oxigen.jpg"
            anchors.rightMargin: 0
            anchors.bottomMargin: 0
            sourceSize.height: 200
            sourceSize.width: 400
            layer.textureMirroring: ShaderEffectSource.NoMirroring
            fillMode: Image.Stretch

            Image {
                id: imageO2Bar
                x: imageO2.width * 0.25 + 20
                y: imageO2.height * 0
                width: imageO2.width * 0.58
                height: imageO2.height * 1
                source: "images/greenbar.png"
                fillMode: Image.PreserveAspectFit
            }

            Image {
                id: imageO2Circle
                x: imageO2.width * 0.15
                y: imageO2.height * 0.15
                width: imageO2.height * 0.7
                height: imageO2.height * 0.7
                source: "images/green.png"
                fillMode: Image.PreserveAspectFit
                Image {
                    id: imageO2Icon
                    x: imageO2Circle.width * 0.5 - (imageO2.height * 0.25) / 2
                    y: imageO2Circle.height * 0.5 - (imageO2.height * 0.25) / 2
                    width: imageO2.height * 0.25
                    height: imageO2.height * 0.25
                    source: "images/o2.png"
//                    MouseArea {
//                        anchors.fill: parent
//                        onClicked: {
//                            if (greenGear.visible) {
//                                greenGear.visible = false;
//                                greenUp.visible = false;
//                                greenDown.visible = false;
//                            } else {
//                                greenGear.visible = true;
//                                greenUp.visible = true;
//                                greenDown.visible = true;
//                            }
//                        }
//                    }
                }
            }
            Text {
                id: textO2
                x: imageO2.width * 0.5
                y: imageO2.height * 0.5 - (imageO2.height * 0.1) / 2
                text: qsTr("--.-- %")
                font.pixelSize: imageO2.height * 0.1
            }

            Image {
                id: greenGear
                x: imageO2.width * 0.15
                y: imageO2.height * 0.15
                width: imageO2.height * 0.7
                height: imageO2.height * 0.7
                source: "images/setgear.png"
                visible: false
            }

            Image {
                id: greenUp
                x: imageO2.width * 0.5 + greenUp.width * 0.5
                y: imageO2.height * 0.5 - greenUp.height - (greenUp.height * 0.5)
                width: imageO2.height * 0.25
                height: imageO2.height * 0.25
                source: "images/greenup.png"
                sourceSize.height: imageO2.height
                sourceSize.width: imageO2.height
                visible: false
//                MouseArea {
//                    anchors.fill: parent
//                    onPressed: {
//                        greenUp.source = "file:///" + applicationDirPath + "/images/greenuppush.png"
//                        greenUp.sourceSize.width = imageO2.width * 0.68;
//                        greenUp.sourceSize.height = imageO2.height;
//                        greenUp.width = imageO2.height * 0.25;
//                        greenUp.height = imageO2.height * 0.25;
//                        greenUp.x = imageO2.width * 0.5 + greenUp.width * 0.5;
//                        greenUp.y = imageO2.height * 0.5 - greenUp.height - (greenUp.height * 0.5);
//                        targetO2.text = (parseInt(targetO2.text)+1)
//                        textO2.text = "  " + targetO2.text + " %"
//                    }
//                    onReleased: {
//                        greenUp.source = "file:///" + applicationDirPath + "/images/greenup.png"
//                        greenUp.sourceSize.width = imageO2.width * 0.68;
//                        greenUp.sourceSize.height = imageO2.height;
//                        greenUp.width = imageO2.height * 0.25
//                        greenUp.height = imageO2.height * 0.25
//                        greenUp.x = imageO2.width * 0.5 + greenUp.width * 0.5;
//                        greenUp.y = imageO2.height * 0.5 - greenUp.height - (greenUp.height * 0.5);
//                    }
//                }
            }

            Image {
                id: greenDown
                x: imageO2.width * 0.5 + greenDown.width * 0.5
                y: imageO2.height * 0.5 + (greenDown.height * 0.5)
                width: imageO2.height * 0.25
                height: imageO2.height * 0.25
                source: "images/greendown.png"
                sourceSize.height: imageO2.height
                sourceSize.width: imageO2.height
                visible: false
//                MouseArea {
//                    anchors.fill: parent
//                    onPressed: {
//                        greenDown.source = "file:///" + applicationDirPath + "/images/greendownpush.png"
//                        greenDown.sourceSize.width = imageO2.width * 0.68;
//                        greenDown.sourceSize.height = imageO2.height;
//                        greenDown.width = imageO2.height * 0.25;
//                        greenDown.height = imageO2.height * 0.25;
//                        greenDown.x = imageO2.width * 0.5 + greenDown.width * 0.5;
//                        greenDown.y = imageO2.height * 0.5 + (greenDown.height * 0.5);
//                        targetO2.text = (parseInt(targetO2.text)-1)
//                        textO2.text = "  " + targetO2.text + " %"
//                    }
//                    onReleased: {
//                        greenDown.source = "file:///" + applicationDirPath + "/images/greendown.png"
//                        greenDown.sourceSize.width = imageO2.width * 0.68;
//                        greenDown.sourceSize.height = imageO2.height;
//                        greenDown.width = imageO2.height * 0.25
//                        greenDown.height = imageO2.height * 0.25
//                        greenDown.x = imageO2.width * 0.5 + greenDown.width * 0.5;
//                        greenDown.y = imageO2.height * 0.5 + (greenDown.height * 0.5);
//                    }
//                }
            }

        }
    }

    Text {
        id: targetTemp
        visible: false
        text: "30"
    }

    Text {
        id: targetHumid
        visible: false
        text: "60"
    }

    Text {
        id: targetCO2
        visible: false
        text: "400"
    }

    Text {
        id: targetO2
        visible: false
        text: "80"
    }

    Timer {
       interval: 5000
       running: true
       repeat: true
       onTriggered: {
            request('http://' + ipAddress + '/command.php?data=P40', function (o) {
            console.log(o.responseText);
            var errorText = '';
            if(o.responseText.includes("ok")) {
                var buff = o.responseText.split(";");
                var vals = buff[0].split(" ");
                var co2 = vals[0].split(":")
                var temp = vals[1].split(":");
                var humid = vals[2].split(":");
                imageCO2Circle.source = "images/gray.png"
                textCO2.text = co2[1] + " PPM";
                curCo2Value.text = co2[1];
                imageTempCircle.source = "images/red.png"
                textTemp.text = temp[1] + " °C";
                curTempValue.text = temp[1];
                imageHumidCircle.source = "images/blue.png"
                textHumid.text = humid[1] + " %RH";
                curHumidValue.text = humid[1];

                //Check for Alarm
                if (parseInt(textTemp.text) < rangeSliderTemp.first.value) {
                    console.log("this is upper alarm");

                }
                if (parseInt(textTemp.text) > rangeSliderTemp.second.value) {
                    console.log("this is upper alarm");
                }
            }

           });

           request('http://' + ipAddress + '/command.php?data=P50', function (o) {
           console.log(o.responseText);
           var errorText = '';
           if(o.responseText.includes("ok")) {
               var buff = o.responseText.split(";");
               var vals = buff[0].split(" ");
               var V = vals[0].split(":")
               var O2 = vals[1].split(":");
               imageO2Circle.source = "images/green.png"
               textO2.text = O2[1] + " %";
               curO2Value.text = O2[1];
           }
          });
       }
    }
    // this function is included locally, but you can also include separately via a header definition
    function request(url, callback) {
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = (function(myxhr) {
            return function() {
                callback(myxhr);
            }
        })(xhr);
        xhr.open('GET', url, true);
        xhr.send('');
    }
}
