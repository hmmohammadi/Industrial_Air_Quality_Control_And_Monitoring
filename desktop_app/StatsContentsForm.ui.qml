import QtQuick 2.15
import QtQuick.Controls 2.12
import QtCharts 2.3

Item {
    width: 640
    height: 480

    ChartView {
        id: bar
        anchors.fill: parent

        //        anchors.fill: parent
        BarSeries {
            name: "BarSeries"
            BarSet {
                values: [2, 2, 3]
                label: "Set1"
            }

            BarSet {
                values: [5, 1, 2]
                label: "Set2"
            }

            BarSet {
                values: [3, 5, 8]
                label: "Set3"
            }
        }
    }
}
