function randomScalingFactor() {
        return Math.random().toFixed(1);
}


function show(name) {

    if (name == "time"){
        var times = []
        for(var i=0; i < air.times.length; i++) {
            console.log(air.times[i].split("T")[1].split(".")[0])
            times.push(air.times[i].split("T")[1].split(".")[0])

        }

        return times
    }
   else if (name == "pm25s") {
        var pm25s = {
        labels: show('time'),
            datasets: [{
                fillColor : "rgba(220,220,220,0.2)",
                strokeColor : "rgba(220,220,220,1)",
                pointColor : "rgba(220,220,220,1)",
                pointStrokeColor : "#fff",
                pointHighlightFill : "#fff",
                pointHighlightStroke : "rgba(220,220,220,1)",
                data: air.pm25s

                }
             ]
        }

        return pm25s
    }


}

var moptions = {
    scales: {
        yAxes: [{
            display: true,
            ticks: {
                beginAtZero: true,
                min: 0,
                max: 10,
                stepSize: 1
            }
        }]
    }
};

var Options = {
//    scaleBeginAtZero: true,
//    scaleSteps: 0.01
//    scaleStartValue: 50,
//    scaleStepWidth: 1,
//    maxValue: 50

};

///////////////////// Chart Datas //////////////////////////
var tempChartData = {
    labels: show('time'),
    datasets: [{
        fillColor : "rgba(220,220,220,0.2)",
        strokeColor : "rgba(220,220,220,1)",
        pointColor : "rgba(220,220,220,1)",
        pointStrokeColor : "#fff",
        pointHighlightFill : "#fff",
        pointHighlightStroke : "rgba(220,220,220,1)",
        data: air.temps

        }
     ]
}

var co2ChartData = {
    labels: show('time'),
    datasets: [{
        fillColor : "rgb(165, 166, 246)",
        strokeColor : "rgb(116, 89, 217)",
        pointColor : "rgb(116, 89, 217)",
        pointStrokeColor : "#fff",
        pointHighlightFill : "#fff",
        pointHighlightStroke : "rgba(220,220,220,1)",
        data: air.co2s

        }
     ]
}

var pm25ChartData = {
    labels: show('time'),
    datasets: [{
        fillColor : "rgb(31, 141, 237)",
        strokeColor : "rgba(220,220,220,1)",
        pointColor : "rgba(220,220,220,1)",
        pointStrokeColor : "#fff",
        pointHighlightFill : "#fff",
        pointHighlightStroke : "rgba(220,220,220,1)",
        data: air.pm25s

        }
     ]
}

var o3ChartData = {
    labels: show('time'),
    datasets: [{
        fillColor : "rgb(226, 137, 242)",
        strokeColor : "rgba(220,220,220,1)",
        pointColor : "rgba(220,220,220,1)",
        pointStrokeColor : "#fff",
        pointHighlightFill : "#fff",
        pointHighlightStroke : "rgba(220,220,220,1)",
        data: air.o3s

        }
     ]
}
var pm10ChartData = {
    labels: show('time'),
    datasets: [{
        fillColor : "rgb(66, 133, 244)",
        strokeColor : "rgba(220,220,220,1)",
        pointColor : "rgba(220,220,220,1)",
        pointStrokeColor : "#fff",
        pointHighlightFill : "#fff",
        pointHighlightStroke : "rgba(220,220,220,1)",
        data: air.pm10s

        }
     ]
}

var no2ChartData = {
    labels: show('time'),
    datasets: [{
        fillColor : "rgb(133, 92, 248)",
        strokeColor : "rgba(220,220,220,1)",
        pointColor : "rgba(220,220,220,1)",
        pointStrokeColor : "#fff",
        pointHighlightFill : "#fff",
        pointHighlightStroke : "rgba(220,220,220,1)",
        data: air.no2s

        }
     ]
}

var humChartData = {
    labels: show('time'),
    datasets: [{
        fillColor : "rgb(96, 125, 139)",
        strokeColor : "rgba(220,220,220,1)",
        pointColor : "rgba(220,220,220,1)",
        pointStrokeColor : "#fff",
        pointHighlightFill : "#fff",
        pointHighlightStroke : "rgba(220,220,220,1)",
        data: air.hums

        }
     ]
}

var cho2ChartData = {
    labels: show('time'),
    datasets: [{
        fillColor : "rgb(38, 50, 56)",
        strokeColor : "rgba(220,220,220,1)",
        pointColor : "rgba(220,220,220,1)",
        pointStrokeColor : "#fff",
        pointHighlightFill : "#fff",
        pointHighlightStroke : "rgba(220,220,220,1)",
        data: air.cho2s

        }
     ]
}

var coChartData = {
    labels: show('time'),
    datasets: [{
        fillColor : "rgb(165, 166, 246)",
        strokeColor : "rgba(220,220,220,1)",
        pointColor : "rgba(220,220,220,1)",
        pointStrokeColor : "#fff",
        pointHighlightFill : "#fff",
        pointHighlightStroke : "rgba(220,220,220,1)",
        data: air.cos

        }
     ]
}

