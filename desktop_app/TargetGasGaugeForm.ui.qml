import QtQuick 2.4

Item {
    width: 110
    height: 110
    property alias targetGaz: targetGaz

    property real value: 180
    property string unit: "ppm"
    property string targetGasName: "CO"

    //property int min: value
    Arcc {
        id: targetGaz
        anchors.fill: parent
        maxValue: 300
        minValue: 0
        dialWidth: 8
        value: parent.value
        //        progressColor: "#6ca5eb"
        spanAngle: spanAngle
        dialType: RadialBarShape.DialType.FullDial
        backgroundColor: "#ffffff"
        penStyle: Qt.RoundCap
        dialColor: "#eaf2fa"
        startAngle: 180

        Text {
            id: val_txt
            width: 58
            height: 20
            color: "#5f3fbb"
            text: value
            font.weight: Font.Light
            font.family: "Tahoma"
            styleColor: "#5f3fbb"
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 16
            anchors.verticalCenterOffset: 71
            anchors.horizontalCenterOffset: -26
            minimumPixelSize: 12
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Text {
            id: unittxt
            width: 34
            height: 20
            text: unit
            font.pixelSize: 14
            horizontalAlignment: Text.AlignHCenter
            anchors.verticalCenterOffset: 71
            anchors.horizontalCenterOffset: 24
            styleColor: "#3b4045"
            font.capitalization: Font.MixedCase
            style: Text.Normal
            font.family: "Tahoma"
            font.weight: Font.Light
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
        }
        Text {
            id: targetGastxt
            x: 24
            y: 45
            width: 63
            height: 20
            text: targetGasName
            font.pixelSize: 15
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            //            anchors.verticalCenterOffset: 0
            //            anchors.horizontalCenterOffset: 0
            styleColor: "#3b4045"
            font.capitalization: Font.AllUppercase
            style: Text.Normal
            font.family: "Tahoma"
            font.weight: Font.Light
            //            anchors.verticalCenter: parent.verticalCenter
            //            anchors.horizontalCenter: parent.horizontalCenter
            //            anchors.fill: parent
        }
    }
}
