import QtQuick 2.0
import QtQuick.Window 2.0
import "Charts.js" as Chart
import "QMLChartData.js" as ChartsData


//function randomScalingFactor() {
//        return Math.random().toFixed(1);
//}
Rectangle
 {
     width: 800
     height: 480
    Item {
//        width: 400
//        height: 400
//        anchors.fill: parent
        Chart{

//            anchors.centerIn: parent
//            anchors {
////                left: parent.horizontalCenter
////                top: parent.verticalCenter
////                right: parent.right
////                bottom: parent.bottom
//            }
            chartType: 'line'

            chartData: { return {
                    labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
                    datasets: [{
                            label: 'Filled',
                            fill: true,
                            backgroundColor: 'rgba(192,222,255,0.3)',
                            borderColor: 'rgba(128,192,255,255)',
                            data: [
                                ChartsData.randomScalingFactor(),
                                ChartsData.randomScalingFactor(),
                                ChartsData.randomScalingFactor(),
                                ChartsData.randomScalingFactor(),
                                ChartsData.randomScalingFactor(),
                                ChartsData.randomScalingFactor(),
                                ChartsData.randomScalingFactor()
                            ],
                        }, {
                            label: 'Dashed',
                            fill: false,
                            backgroundColor: 'rgba(0,0,0,0)',
                            borderColor: '#009900',
                            borderDash: [5, 5],
                            data: [
                               ChartsData.randomScalingFactor(),
                                ChartsData.randomScalingFactor(),
                                ChartsData.randomScalingFactor(),
                                ChartsData.randomScalingFactor(),
                                ChartsData.randomScalingFactor(),
                                ChartsData.randomScalingFactor(),
                                ChartsData.randomScalingFactor()
                            ],
                        }, {
                            label: 'Filled',
                            backgroundColor: 'rgba(0,0,0,0)',
                            borderColor: '#990000',
                            data: [
                                ChartsData.randomScalingFactor(),
                                ChartsData.randomScalingFactor(),
                                ChartsData.randomScalingFactor(),
                                ChartsData.randomScalingFactor(),
                                ChartsData.randomScalingFactor(),
                                ChartsData.randomScalingFactor(),
                                ChartsData.randomScalingFactor()
                            ],
                            fill: false,
                        }]
                }
            }

            chartOptions: {return {
                    maintainAspectRatio: false,
                    responsive: true,
                    title: {
                        display: true,
                        text: 'Chart.js Line Chart'
                    },
                    tooltips: {
                        mode: 'index',
                        intersect: false,
                    },
                    hover: {
                        mode: 'nearest',
                        intersect: true
                    },
                    scales: {
                        xAxes: [{
                                display: true,
                                scaleLabel: {
                                    display: true,
                                    labelString: 'Month'
                                }
                            }],
                        yAxes: [{
                                display: true,
                                scaleLabel: {
                                    display: true,
                                    labelString: 'Value'
                                }
                            }]
                    }
                }
            }
        }

    }

}
