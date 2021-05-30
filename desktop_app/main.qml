import QtQuick 2.15
import QtQuick.Window 2.13
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.11
import QtGraphicalEffects 1.0
import "QMLChartData.js" as ChartsData
import "QChartJsTypes.js" as ChartTypes

Window {
    id: root
    maximumWidth: 1350
    minimumHeight: 670
    minimumWidth: 1350
    maximumHeight: 670

    width: 1350
    height: 670
    visible: true

    title: "Air Quality Dashboard"

    property int chart_width: 1045;
    property int chart_height: 313;
    property int chart_spacing: 20;
    property int text_height: 80;
    property int row_height: 8;




    Row {
        id: row
        x: 54
        y: 512
        width: root.width - row.spacing
        height: parent.height / 5.5
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 36
        spacing: parent.width / 25

        TargetGasGaugeForm {
            id: cO
            unit: "ppm"
            targetGasName: "CO"
            targetGaz.maxValue: 500
            targetGaz.dialWidth: 6
            value: 0 //feeder.value + 40

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    console.log("co")
                }
            }

        }

        TargetGasGaugeForm {
            id: cH2O
            unit: "mg/m3"
            targetGasName: "cH2O"
            targetGaz.maxValue: 6.250
            targetGaz.dialWidth: 6
            value: 0 //feeder.value + 50
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    console.log("ch2o")
                }
            }
        }

        TargetGasGaugeForm {
            id: cO2
            unit: "ppm"
            targetGasName: "cO2"
            targetGaz.maxValue: 5000 //5000
            targetGaz.dialWidth: 6
            value: 0 //feeder.value + 90

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    console.log("co2")
                }
            }
        }

        TargetGasGaugeForm {
            id: humidity
            unit: "%PH"
            targetGasName: "humidity"
            targetGaz.maxValue: 100
            targetGaz.dialWidth: 6
            value: 0 //feeder.value
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    console.log("humidity")
                }
            }
        }

        TargetGasGaugeForm {
            id: nO2
            unit: "ppm"
            targetGasName: "nO2"
            targetGaz.maxValue: 10  // set the min value to 0.1
            targetGaz.minValue: 0.1
            targetGaz.dialWidth: 6
            value: 0 //feeder.value - 1
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    console.log("no2")
                }
            }
        }

        TargetGasGaugeForm {
            id: tVOC
            unit: "grades"
            targetGasName: "TVOC"
            targetGaz.maxValue: 3
            targetGaz.dialWidth: 6
            value: 0 //feeder.value + 4

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    console.log("TVOC")
                }
            }
        }

        TargetGasGaugeForm {
            id: o3
            unit: "ppm"
            targetGasName: "o3"
            targetGaz.maxValue: 10
            targetGaz.dialWidth: 6
            value: 0 //feeder.value
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    console.log("o3")
                }
            }

        }

        TargetGasGaugeForm {
            id: pM_2_5
            unit: "μg/m3"
            targetGasName: "PM2.5"
            targetGaz.maxValue: 1000
            targetGaz.dialWidth: 6
            value: 0 //feeder.value + 20
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    console.log("pm2.5")
                }
            }
        }
    }

    Row {
        id: row_temp
        x: 17
        y: 63
        width: 1316
        height: 406
        spacing: 23
        padding: 9

        Temperature {
            id: temperature
            value: 0

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    console.log("Temprature")
                }
            }

        }

        QChartJs {
               id: chart_line
               width: chart_width
               height: chart_height
               chartType: ChartTypes.QChartJSTypes.LINE
               chartData: ChartsData.ChartLineData
               animation: true
               chartAnimationEasing: Easing.InOutElastic;
               chartAnimationDuration: 2000;


           }
    }

    Component.onCompleted: {

            var gases = air.gases

            console.log(gases)


            // set gas values
            temperature.value = gases[9]
            cO.value = gases[1] * 100
            cH2O.value = gases[0] * 10
            cO2.value = gases[2] - 3000
            humidity.value = gases[3]
            nO2.value = gases[4]
            o3.value = gases[5]
            pM_2_5.value = gases[9]
            tVOC.value = gases[11]

        console.log('\ntemperature: ' + temperature.value + '\nco:' + cO.value + '\ncho2: ' + cH2O.value, '\nco2: ' + cO2.value + '\nHumidity: '+  humidity.value + '\nno2: ' +  nO2.value + '\no3: ' + o3.value + '\npm2.5: ' + pM_2_5.value)

    }


}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.66}
}
##^##*/
