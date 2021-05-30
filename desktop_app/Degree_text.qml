import QtQuick 2.0

Item {
    id: root
    width: 38
    height: 30


    property real wh: 13
    property real offset_txt: -9
    property real offset_unit: 13
    property string value: "54"
    property string unit_txt:  "°C"

    Item {
        id: rectangle
        anchors.fill: parent
//        color: "#ffffff"

        Text {
            id: val_txt
            width: 65
            height: 42
            color: "#11263c"
            text: value
            font.weight: Font.Thin
            font.family: "Tahoma"
            styleColor: "#7b8795"
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 36
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.verticalCenterOffset: 23
            anchors.horizontalCenterOffset: -32
            anchors.horizontalCenter: parent.horizontalCenter

        }

        Text {
            id: text1
            width: wh + 5
            height: wh + 2
            text: unit_txt
            font.pixelSize: wh
            anchors.verticalCenterOffset: 0
            anchors.horizontalCenterOffset: 22
            styleColor: "#62666a"
            font.capitalization: Font.MixedCase
            style: Text.Normal
            font.family: "Tahoma"
            font.weight: Font.Light
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }



}

/*##^##
Designer {
    D{i:0;formeditorZoom:1.66}
}
##^##*/
