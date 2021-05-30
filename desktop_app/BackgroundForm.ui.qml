import QtQuick 2.4

Rectangle {
    width: 640
    height: 480
    //    color: "#f3e7e9"
    gradient: Gradient {
        GradientStop {
            position: 0
            color: "#edebf5" //"#f3f4f4" //"#fafdfe" //"#f3e7e9"
        }

        GradientStop {
            position: 0.99
            color: "#edebf5" //"#fafdff" //"#e3eeff"
        }

        GradientStop {
            position: 1
            color: "#edebf5" //"#fafdff" //"#e3eeff"
        }
    }
}
