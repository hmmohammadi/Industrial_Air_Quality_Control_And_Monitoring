import QtQuick 2.4
//import "."
import QtQuick 2.15
import QtQuick.Controls 2.12
import QtCharts 2.3

Item {
    width: 640
    height: 480

    property color tickLabelColor: "#90989d"


    property color tickLabelTransparent: "#0090989d" // transparent version of greyDark1
    property int transitionDuration: 1000
    property bool enableBehaviors: true
    property int displayedData: 0 // switches in the middle of a transition animation

    ////////////////////////////////////////////////////////////////////////////////

    SequentialAnimation {
        id: toYear
        ParallelAnimation {
            ScriptAction {
                script: {
                    resetBarValues()
                    axisX.labelsColor = tickLabelTransparent
                    axisY.labelsColor = tickLabelTransparent
                }
            }
            PauseAnimation {
                duration: transitionDuration
            }
        }
        ScriptAction {
            script: {
                enableBehaviors = false
                displayedData = 1
                axisY.min = 10
                axisY.max = 100
                resetBarValues()
                enableBehaviors = true
            }
        }
        ParallelAnimation {
            ScriptAction {
                script: {
                    bsv1.value = 70
                    bsv2.value = 50
                    bsv3.value = 55
                    bsv4.value = 57
                    bsv5.value = 35
                    bsv6.value = 15
                    axisX.labelsColor = tickLabelColor
                    axisY.labelsColor = tickLabelColor
                }
            }
            PauseAnimation {
                duration: transitionDuration
            }
        }
    }

    SequentialAnimation {
        id: toMonth
        ParallelAnimation {
            ScriptAction {
                script: {
                    resetBarValues()
                    axisX.labelsColor = tickLabelTransparent
                    axisY.labelsColor = tickLabelTransparent
                }
            }
            PauseAnimation {
                duration: transitionDuration
            }
        }
        ScriptAction {
            script: {
                enableBehaviors = false
                displayedData = 0
                axisY.min = 1
                axisY.max = 4
                resetBarValues()
                enableBehaviors = true
            }
        }
        ParallelAnimation {
            ScriptAction {
                script: {
                    bsv1.value = 2.6
                    bsv2.value = 2.1
                    bsv3.value = 1.5
                    bsv4.value = 1.7
                    bsv5.value = 1.95
                    bsv6.value = 1.55
                    axisX.labelsColor = tickLabelColor
                    axisY.labelsColor = tickLabelColor
                }
            }
            PauseAnimation {
                duration: transitionDuration
            }
        }
    }

    ////////////////////////////////////////////////////////////////////////////////

    BackgroundForm {
        ChartView {
            id: bar
            anchors.fill: parent

            //                        margins.left: Theme.statsViewChartLeftMargin
            //                        margins.right: Theme.statsViewChartRightMargin
            //                        margins.bottom: Theme.statsViewChartBottomMargin
            //                        margins.top: Theme.statsViewChartTopMargin

            backgroundColor: "#f2f4f5"
            BarSeries {
                name: "BarSeries"

                axisX: BarCategoryAxis {
                    id: axisX
                    gridVisible: false
                    lineVisible: false
                    labelsFont.pixelSize: 20
                    labelsColor: tickLabelColor
                    Behavior on labelsColor { ColorAnimation { duration: transitionDuration } }

                    //                                                    BarCategoryValue { value: displayedData ? qsTr("Jan") : qsTr("05/11") }
                    //                                                    BarCategoryValue { value: displayedData ? qsTr("Feb") : qsTr("05/12") }
                    //                                                    BarCategoryValue { value: displayedData ? qsTr("Mar") : qsTr("05/13") }
                    //                                                    BarCategoryValue { value: displayedData ? qsTr("Apr") : qsTr("05/14") }
                    //                                                    BarCategoryValue { value: displayedData ? qsTr("May") : qsTr("05/15") }
//                                                                        BarCategoryValue { value: displayedData ? qsTr("Jun") : qsTr("05/16") }
                }

                                axisY: ValueAxis {
                                             id: axisY
                                             min: 1.0
                                             max: 4.0
                                             tickCount: 4
                                             gridLineColor: "#dedfe0"
                                             lineVisible: false
                                             labelsFont.pixelSize: 20
                                             labelsColor: tickLabelColor
                                             labelFormat: "%d kWh"
                                             Behavior on labelsColor { ColorAnimation { duration: transitionDuration } }
                                         }



                BarSet {
                    values: [2, 2, 3]
                    label: "Set1"
                    Behavior on values { enabled: enableBehaviors; NumberAnimation { duration: transitionDuration } }

                }

                BarSet {
                    values: [5, 1, 2]
                    label: "Set2"
                    Behavior on values { enabled: enableBehaviors; NumberAnimation { duration: transitionDuration } }

                }

                BarSet {
                    values: [3, 5, 8]
                    label: "Set3"
                    Behavior on values { enabled: enableBehaviors; NumberAnimation { duration: transitionDuration } }

                }
            }
        }
    }
}
