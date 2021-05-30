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

        self.stats = Stats(14)
        
    
    ############## Signals ##################
    sgas   = pyqtSignal(list)
    stemps = pyqtSignal(list)
    scho2s = pyqtSignal(list)
    scos   = pyqtSignal(list)
    shums  = pyqtSignal(list)
    sco2s  = pyqtSignal(list)
    sno2s  = pyqtSignal(list)
    spm1_0s= pyqtSignal(list)
    spm2_5s= pyqtSignal(list)
    stimes = pyqtSignal(list)
    so3s   = pyqtSignal(list)



    ########### getters & setters ############

    def setGas(self):
        data = self.gas.gaslist
        self.sgas.emit(self.gas.gaslist)
    
    def getGas(self):
        return self.gas.gaslist
    

    def setTemps(self):
        self.stemps.emit(self.stats.tempreture)
#        pass

    def getTemps(self):
        return self.stats.tempreture
#        pass

    
    def setCho2s(self):
        self.scho2s.emit(self.stats.cho2)
#        pass

    def getCho2s(self):
        return self.stats.tempreture
#        pass

    
    def setCos(self):
        self.scos.emit(self.stats.co)
#        pass
    
    def getCos(self):
        return self.stats.co
#        pass

    def setHums(self):
        self.shums.emit(self.stats.humidity)
#        pass

    def getHums(self):
        return self.stats.humidity
#        pass

    def setCo2s(self):
        self.sco2s.emit(self.stats.co2)
#        pass

    def getCo2s(self):
        return self.stats.co2
#        pass

    def setNo2s(self):
        self.sno2s.emit(self.stats.no2)
#        pass

    def getNo2s(self):
        return self.stats.no2
#        pass

    def setPm1_0s(self):
        self.spm1_0s.emit(self.stats.pm1_0)
#        pass

    def getPm1_0s(self):
        return self.stats.pm1_0
#        pass

    def setPm2_5s(self):
        self.spm2_5s.emit(self.stats.pm2_5)
#        pass

    def getPm2_5s(self):
        return self.stats.pm2_5
#        pass
    def setO3s(self):
        self.so3s.emit(self.stats.o3)
    #        pass

    def getO3s(self):
        return self.stats.o3
    #        pass

    def setTimes(self):
        self.stimes.emit(self.stats.time)
#        pass

    def getTimes(self):
        return self.stats.time
#        pass

    ################# Slots ##################
    @pyqtSlot()
    def updateGas(self):
        self.gas.update()
        self.setGas(self.gas.gaslist)
    
    @pyqtSlot()
    def updateTemps(self):
        self.stats.pullStats(20)
        self.setTemps(self.stats.tempreture)
    
    @pyqtSlot()
    def updateTimes(self):
        self.stats.pullStats(20)
        self.setTimes(self.stats.time)

    @pyqtSlot()
    def updateCho2s(self):
        self.stats.pullStats(20)
        self.setCho2s(self.stats.cho2)

    @pyqtSlot()
    def updateCos(self):
        self.stats.pullStats(20)
        self.setCos(self.stats.co)

    @pyqtSlot()
    def updateHums(self):
        self.stats.pullStats(20)
        self.setHums(self.stats.humidity)

    @pyqtSlot()
    def updateCo2s(self):
        self.stats.pullStats(20)
        self.setCo2s(self.stats.co2)

    @pyqtSlot()
    def updateNo2s(self):
        self.stats.pullStats(20)
        self.setNo2s(self.stats.no2)

    @pyqtSlot()
    def updatePm1_0s(self):
        self.stats.pullStats(20)
        self.setPm1_0s(self.stats.pm1_0)

    @pyqtSlot()
    def updatePm2_5s(self):
        self.stats.pullStats(20)
        self.setPm2_5s(self.stats.pm2_5)

    @pyqtSlot()
    def updateO3s(self):
        self.stats.pullStats(20)
        self.setO3s(self.stats.o3)

    ############# Property ###################
    
    gases = pyqtProperty(list, getGas, notify=sgas)
    temps = pyqtProperty(list, getTemps, notify=stemps)
    cho2s = pyqtProperty(list, getCho2s, notify=scho2s)
    cos   = pyqtProperty(list, getCos, notify=scos)
    hums  = pyqtProperty(list, getHums, notify=shums)
    co2s  = pyqtProperty(list, getCo2s, notify=sco2s)
    no2s  = pyqtProperty(list, getNo2s, notify=sno2s)
    pm10s = pyqtProperty(list, getPm1_0s, notify=spm1_0s)
    pm25s = pyqtProperty(list, getNo2s, notify=spm2_5s)
    o3s   =  pyqtProperty(list, getO3s, notify=so3s)
    times = pyqtProperty(list, getTimes, notify=stimes)





if __name__=="__main__":
    pass
