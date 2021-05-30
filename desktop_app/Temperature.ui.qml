import QtQuick 2.4

//import QtQuick.Timeline 1.0
Item {
    width: 200
    height: 230

    property int value: 0
    property real currentframe: 30

    Arc {
        id: temprature
        anchors.fill: parent
        value: Math.round(parent.value)
        startAngle: -180
        spanAngle: 180
        minValue: -20
        maxValue: 65
        dialWidth: 8
        progressColor: "#6ca5eb"
        dialType: RadialBarShape.DialType.NoDial
        backgroundColor: "#ffffff"
        penStyle: Qt.RoundCap //Qt.FlatCap //Qt.RoundCap
        dialColor: "#eaf2fa"

        Degree_text {
            id: degree_text
            width: 128
            height: 64
            anchors.verticalCenterOffset: -19
            anchors.horizontalCenterOffset: 0
            value: Math.round(parent.value)
            offset_txt: -30
            offset_unit: 50
            wh: 50
            anchors.centerIn: parent
        }

        Image {
            id: gaugegaugeframesportcenter
            x: 0
            y: 0
            width: 200
            height: 222
            source: "assets/gauge-gauge-frame-sport-center.png"
            fillMode: Image.PreserveAspectFit
            visible: false
        }

        Text {
            id: unittxt
            width: 158
            height: 34
            color: "#3b4045"
            text: "Tempreture"
            font.pixelSize: 23
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.verticalCenterOffset: 123
            anchors.horizontalCenterOffset: 0
            styleColor: "#3b4045"
            font.capitalization: Font.MixedCase
            style: Text.Normal
            font.family: "Tahoma"
            font.weight: Font.Light
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

    //    Timeline {
    //        id: timeline
    //        currentFrame: currentframe
    //        endFrame: 65
    //        startFrame: -20
    //        enabled: true

    //        KeyframeGroup {
    //            target: temprature
    //            property: "value"
    //            Keyframe {
    //                frame: -20
    //                value: -20
    //            }

    //            Keyframe {
    //                frame: -15
    //                value: -15
    //            }

    //            Keyframe {
    //                frame: -10
    //                value: -10
    //            }

    //            Keyframe {
    //                frame: 0
    //                value: 0
    //            }

    //            Keyframe {
    //                frame: 15
    //                value: 15
    //            }

    //            Keyframe {
    //                frame: 20
    //                value: 20
    //            }

    //            Keyframe {
    //                frame: 25
    //                value: 25
    //            }

    //            Keyframe {
    //                frame: 30
    //                value: 30
    //            }

    //            Keyframe {
    //                frame: 40
    //                value: 40
    //            }

    //            Keyframe {
    //                frame: 45
    //                value: 45
    //            }

    //            Keyframe {
    //                frame: 50
    //                value: 50
    //            }

    //            Keyframe {
    //                frame: 59
    //                value: 59
    //            }

    //            Keyframe {
    //                frame: 65
    //                value: 65
    //            }
    //        }
    //        KeyframeGroup {
    //            target: temprature
    //            property: "progressColor"
    //            Keyframe {
    //                frame: -20
    //                value: "#4ccdfa"
    //            }

    //            Keyframe {
    //                frame: -15
    //                value: "#51cff0"
    //            }

    //            Keyframe {
    //                frame: -10
    //                value: "#4ccbfb"
    //            }

    //            Keyframe {
    //                frame: 0
    //                value: "#5dd7e1"
    //            }

    //            Keyframe {
    //                frame: 15
    //                value: "#61d9d8"
    //            }

    //            Keyframe {
    //                frame: 20
    //                value: "#6fe3be"
    //            }

    //            Keyframe {
    //                frame: 25
    //                value: "#83f09c"
    //            }

    //            Keyframe {
    //                frame: 30
    //                value: "#caf665"
    //            }

    //            Keyframe {
    //                frame: 40
    //                value: "#e0f486"
    //            }

    //            Keyframe {
    //                frame: 45
    //                value: "#f5d965"
    //            }

    //            Keyframe {
    //                frame: 50
    //                value: "#febe63"
    //            }

    //            Keyframe {
    //                frame: 59
    //                value: "#fe725e"
    //            }

    //            Keyframe {
    //                frame: 65
    //                value: "#ff585d"
    //            }
    //        }
    //    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
