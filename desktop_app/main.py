import sys
import os

from PySide2.QtWidgets import QApplication  # <---- QtChart
from PySide2.QtGui import QGuiApplication
# from PySide2.QtQml import QQmlApplicationEngine
from PyQt5.QtQml import QQmlApplicationEngine

from scripts.airQualityManagementPlan import Air


if __name__ == "__main__":
    ## Create an QML app
    app = QApplication(sys.argv)
    engine = QQmlApplicationEngine()

    ##  Air 
    air = Air()
    engine.rootContext().setContextProperty("air", air)

    engine.load(os.path.join(os.path.dirname(__file__), "main.qml"))
    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec_())
