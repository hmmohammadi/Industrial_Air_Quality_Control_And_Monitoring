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
                    console.log(air.cos)
                    chart_temp.visible = false
                    chart_co.visible = true
                    chart_co2.visible = false
                    chart_pm10.visible = false
                    chart_hum.visible = false
                    chart_pm25.visible = false
                    chart_o3.visible = false
                    chart_no2.visible = false
                    chart_cho2.visible = false
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
                    console.log(air.cho2s)
                    chart_temp.visible = false
                    chart_co.visible = false
                    chart_co2.visible = false
                    chart_pm10.visible = false
                    chart_hum.visible = false
                    chart_pm25.visible = false
                    chart_o3.visible = false
                    chart_no2.visible = false
                    chart_cho2.visible = true
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
                    console.log(air.co2s)
                    chart_temp.visible = false
                    chart_co.visible = false
                    chart_co2.visible = true
                    chart_pm10.visible = false
                    chart_hum.visible = false
                    chart_pm25.visible = false
                    chart_o3.visible = false
                    chart_no2.visible = false
                    chart_cho2.visible = false
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
                    console.log(air.hums)
                    chart_temp.visible = false
                    chart_co.visible = false
                    chart_co2.visible = false
                    chart_pm10.visible = false
                    chart_hum.visible = true
                    chart_pm25.visible = false
                    chart_o3.visible = false
                    chart_no2.visible = false
                    chart_cho2.visible = false
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
                    console.log(air.no2s)
                    chart_temp.visible = false
                    chart_co.visible = false
                    chart_co2.visible = false
                    chart_pm10.visible = false
                    chart_hum.visible = false
                    chart_pm25.visible = false
                    chart_o3.visible = false
                    chart_no2.visible = true
                    chart_cho2.visible = false
                }
            }
        }

        TargetGasGaugeForm {
            id: pm1_0
            unit: "grades"
            targetGasName: "PM1_0"
            targetGaz.maxValue: 500
            targetGaz.dialWidth: 6
            value: 0 //feeder.value + 4

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    console.log(air.pm10s)
                    //                    chart_line.chartData = ChartsData.pm10ChartData
                    chart_temp.visible = false
                    chart_co.visible = false
                    chart_co2.visible = false
                    chart_pm10.visible = true
                    chart_hum.visible = false
                    chart_pm25.visible = false
                    chart_o3.visible = false
                    chart_no2.visible = false
                    chart_cho2.visible = false
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
                    console.log(air.o3s)
                    chart_temp.visible = false
                    chart_co.visible = false
                    chart_co2.visible = false
                    chart_pm10.visible = false
                    chart_hum.visible = false
                    chart_pm25.visible = false
                    chart_o3.visible = true
                    chart_no2.visible = false
                    chart_cho2.visible = false
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

                    chart_temp.visible = false
                    chart_co.visible = false
                    chart_co2.visible = false
                    chart_pm10.visible = false
                    chart_hum.visible = false
                    chart_pm25.visible = true
                    chart_o3.visible = false
                    chart_no2.visible = false
                    chart_cho2.visible = false


                    //                    console.log(air.pm25s)
                    //                    chart_line.chartData = ChartsData.show("pm25s")
                    //                    chart_line.chartData = air.
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
                    //                    console.log("Temprature")
                    chart_temp.visible = true
                    chart_co.visible = false
                    chart_co2.visible = false
                    chart_pm10.visible = false
                    chart_hum.visible = false
                    chart_pm25.visible = false
                    chart_o3.visible = false
                    chart_no2.visible = false
                    chart_cho2.visible = false
                }
            }

        }
        ///////////////////////////////  Charts ///////////////////////////////////////////
        QChartJs {
            id: chart_temp
            width: chart_width
            visible: true
            height: chart_height
            chartType: ChartTypes.QChartJSTypes.LINE
            chartData: ChartsData.tempChartData
            animation: true
            //               chartOptions: ChartsData.Options
            chartAnimationEasing: Easing.InOutElastic;
            chartAnimationDuration: 2000;
        }

        QChartJs {
            id: chart_pm10
            width: chart_width
            visible: false
            height: chart_height
            chartType: ChartTypes.QChartJSTypes.LINE
            chartData: ChartsData.pm10ChartData
            animation: true
            //               chartOptions: ChartsData.Options
            chartAnimationEasing: Easing.InOutElastic;
            chartAnimationDuration: 2000;
        }

        QChartJs {
            id: chart_pm25
            width: chart_width
            visible: false
            height: chart_height
            chartType: ChartTypes.QChartJSTypes.LINE
            chartData: ChartsData.pm25ChartData
            animation: true
            //               chartOptions: ChartsData.Options
            chartAnimationEasing: Easing.InOutElastic;
            chartAnimationDuration: 2000;
        }
        QChartJs {
            id: chart_cho2
            width: chart_width
            visible: false
            height: chart_height
            chartType: ChartTypes.QChartJSTypes.LINE
            chartData: ChartsData.cho2ChartData
            animation: true
            chartAnimationEasing: Easing.InOutElastic;
            chartAnimationDuration: 2000;
        }


        QChartJs {
            id: chart_co
            width: chart_width
            visible: false
            height: chart_height
            chartType: ChartTypes.QChartJSTypes.LINE
            chartData: ChartsData.coChartData
            animation: true
            chartAnimationEasing: Easing.InOutElastic;
            chartAnimationDuration: 2000;
        }

        QChartJs {
            id: chart_co2
            width: chart_width
            visible: false
            height: chart_height
            chartType: ChartTypes.QChartJSTypes.LINE
            chartData: ChartsData.co2ChartData
            animation: true
            chartAnimationEasing: Easing.InOutElastic;
            chartAnimationDuration: 2000;
        }

        QChartJs {
            id: chart_hum
            width: chart_width
            visible: false
            height: chart_height
            chartType: ChartTypes.QChartJSTypes.LINE
            chartData: ChartsData.humChartData
            animation: true
            chartAnimationEasing: Easing.InOutElastic;
            chartAnimationDuration: 2000;
        }

        QChartJs {
            id: chart_o3
            width: chart_width
            visible: false
            height: chart_height
            chartType: ChartTypes.QChartJSTypes.LINE
            chartData: ChartsData.o3ChartData
            animation: true
            chartAnimationEasing: Easing.InOutElastic;
            chartAnimationDuration: 2000;
        }

        QChartJs {
            id: chart_no2
            width: chart_width
            visible: false
            height: chart_height
            chartType: ChartTypes.QChartJSTypes.LINE
            chartData: ChartsData.no2ChartData
            animation: true
            chartAnimationEasing: Easing.InOutElastic;
            chartAnimationDuration: 2000;
        }


    }

    Component.onCompleted: {

        var gases = air.gases
        // set gas values
        temperature.value = gases[9]
        cO.value = gases[1] * 100
        cH2O.value = gases[0] * 10
        cO2.value = gases[2] - 3000
        humidity.value = gases[3]
        nO2.value = gases[4]
        o3.value = gases[5]
        pM_2_5.value = gases[9]
        pm1_0.value = gases[11]
    }


}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.66}
}
##^##*/
