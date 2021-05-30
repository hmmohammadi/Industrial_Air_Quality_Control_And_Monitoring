pragma Singleton
import QtQuick 2.0

QtObject {
      property bool isBig: true
      property int screenWidth: 800
      property int screenHeight: 480
      property int topBarHeight: 84
      property int topBarFontSize: 32
      property int bottomBarHeight: 72
      property int bottomBarFontSize: 24
      property int dialogBarHeight: 62
      property int dialogLeftMargin: 30
      property int dialogRightMargin: 30
      property int dialogButtonHeight: 48

      property int thermoY: 18
      property int thermoHandleSize: 60
      property int tempControlOffset: 6
      property int roomButtonsY: 48

      property int wheelStatusTextSize: 18
      property int wheelTempTextSize: 80
      property int wheelTempUnitSize: 21
      property real wheelSize: 142.5
      property real wheelControlSize: 7

      property real roomButtonSize: 80
      property real roomButtonSpacing: 30
      property real roomButtonMargin: 81

      property int cardRoomFontSize: 30
      property int cardFloorFontSize: 16
      property int cardTemperatureTopMargin: 22
      property int cardTemperatureLeftMargin: 23
      property int cardSeparatorLeftMargin: 25
      property int cardSeparatorTopMargin: 178
      property int cardRoomColumnSpacing: 4
      property int cardRoomColumnTopMargin: 95
      property int cardRoomColumnLeftMargin: 23
      property int cardIndicatorSpacing: 11
      property int cardStateFontSize: 22

      property int powerSwitchWidth: 100
      property int powerSwitchHeight: 42
      property int powerSwitchRightMargin: 11
      property int powerSwitchTopMargin: 11

      property int cardWidth: 325
      property int cardHeight: 250
      property int cardCornerRadius: 12
      property int cardRowSpacing: 20
      property int cardRowOffset: 35
      property int cardRowIndicatorSpacing: 16
      property int cardRowIndicatorBottomMargin: 18

      property int roomViewTempWidth: 14 + 80
      property int roomViewTempHeight: 9 + 80

      property int scheduleViewListTextSize: 22
      property int scheduleViewListWidth: 208

      property int roomScheduleTopMargin: -4

      property int statsTopGradientSpacer: 10
      property int statsViewToggleTopMargin: 24
      property int statsViewChartLabelFontSize: 20
      property int statsViewChartLeftMargin: 110
      property int statsViewChartRightMargin: 50
      property int statsViewChartBottomMargin: 50
      property int statsViewChartTopMargin: 50
      property int statsViewButtonFontSize: 20
      property int statsViewButtonVCenter: 38
      property int statsViewButtonMonthHCenter: 80
      property int statsViewButtonYearHCenter: 216

      property int sliderLabelFontSize: 18
      property int sliderHandleLabelFontSize: 16
      property int sliderHandleSize: 54

      property int sliderSpacing: 24
      property int sliderLabelSpacing: 44
      property int sliderWidth: 472

      property color violet: "#6542e7";
      property color blue: "#3c94eb";
      property color greenDark: "#3acf93";
      property color greenLight: "#5ae0aa";
      property color greyLight1: "#f9fbfc";
      property color greyLight2: "#f6f8f9";
      property color pinkyRed: "#c6235a";
      property color greyLight3: "#f2f4f5";
      property color greyLight4: "#e8eaeb";
      property color greyMedium1: "#dedfe0";
      property color greyMedium2: "#d5dbe0";
      property color greyMedium3: "#c4c9cc";
      property color greyMedium4: "#b1b8bd";
      property color greyDark1: "#90989d";
      property color greyDark2: "#737b80";
      property color greyDark3: "#5c6366";
      property color greyDark4: "#3d464d";
      property color greyDark5: "#303233";
      property color white: "#ffffff";

}
