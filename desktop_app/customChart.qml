import QtQuick 2.12
import QtQuick.Window 2.12
import "QMLChartData.js" as ChartsData
import "QChartJsTypes.js" as ChartTypes

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    property int chart_width: 1045;
    property int chart_height: 313;
    property int chart_spacing: 20;
    property int text_height: 80;
    property int row_height: 8;


    QChartJs {
           id: chart_line
           width: chart_width
           height: chart_height
           chartType: ChartTypes.QChartJSTypes.LINE
           chartData: ChartsData.ChartLineData
           animation: true
           chartAnimationEasing: Easing.InOutElastic;
           chartAnimationDuration: 2000;

//           onWidthChanged: {
//               console.log(chart_line.width + " " + chart_line.height)
//           }
       }
    onWidthChanged: {
        console.log(width + " " + height)
    }
}
