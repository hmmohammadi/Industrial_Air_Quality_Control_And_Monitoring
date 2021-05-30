#!/bin/usr/env python3

from PyQt5.QtCore import QObject
from PyQt5.QtCore import pyqtSignal, pyqtSlot, pyqtProperty
from .gas import Gas
from .stats import Stats

class Air(QObject):
    def __init__(self):
        QObject.__init__(self)
        self.gas = Gas()
        self.gas.update()

        self.stats = Stats(20)
        
    
    ############## Signals ##################
    sgas = pyqtSignal(list)
    stemps = pyqtSignal(list)
    scho2s = pyqtSignal(list)
    scos = pyqtSignal(list)
    shums = pyqtSignal(list)
    sco2s = pyqtSignal(list)
    sno2s = pyqtSignal(list)
    spm1_0s = pyqtSignal(list)
    spm2_5s = pyqtSignal(list)
    stimes = pyqtSignal(list)



    ########### getters & setters ############

    def setGas(self):
        data = self.gas.gaslist
        self.sgas.emit(self.gas.gaslist)
    
    def getGas(self):
        return self.gas.gaslist
    

    def setTemps(self):
        self.stemps.emit(self.stats.tempreture)
        pass

    def getTemps(self):
        return self.stats.tempreture
        pass

    
    def setCho2s(self):
        self.scho2s.emit(self.stats.cho2)
        pass

    def getCho2s(self):
        return self.stats.tempreture
        pass

    
    def setCos(self):
        self.scos.emit(self.stats.co)
        pass
    
    def getCos(self):
        return self.stats.co
        pass

    def setHums(self):
        self.shums.emit(self.stats.humidity)
        pass

    def getHums(self):
        return self.stats.humidity
        pass

    def setCo2s(self):
        self.sco2s.emit(self.stats.co2)
        pass

    def getCo2s(self):
        return self.stats.co2
        pass

    def setNo2s(self):
        self.sno2s.emit(self.stats.no2)
        pass

    def getNo2s(self):
        return self.stats.no2
        pass

    def setPm1_0s(self):
        self.spm1_0s.emit(self.stats.pm1_0)
        pass

    def getPm1_0s(self):
        return self.stats.pm1_0
        pass

    def setPm2_5s(self):
        self.spm2_5s.emit(self.stats.pm2_5)
        pass

    def getPm2_5s(self):
        return self.stats.pm2_5
        pass

    def setTimes(self):
        self.stimes.emit(self.stats.time)
        pass

    def getTimes(self):
        return self.stats.time
        pass

    ################# Slots ##################
    @pyqtSlot()
    def updateGas(self):
        self.gas.update()
        self.setGas(self.gas.gaslist)
    
    @pyqtSlot()
    def updateTemps(self):
        self.stats.pullStats(20)
        self.setTemps(self.stats.tempreture)


    ############# Property ###################
    
    gases = pyqtProperty(list, getGas, notify=sgas)
    temps = pyqtProperty(list, getTemps, notify=stemps)






if __name__=="__main__":
    pass
