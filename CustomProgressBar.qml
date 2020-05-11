import QtQuick 2.13
import QtQuick.Controls 2.12
import "JSONData.js" as AudioInfo

Rectangle {
    color: "transparent"
    width:parent.width
    height: 20
    ProgressBar {
        id: progressBar
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: play.top
        width: parent.width/1.2
        height: 18
        value:0
        from:0
        to:AudioInfo.getIntervel(AudioInfo.audioData[songIndex].duration)
    }

    Text {
        id: currentTime
        x: parent.width/25
        y: 2
        text: AudioInfo.getTimeFromIntervel(progressValue)
        font.pixelSize: 12

    }

    Text {
        id: totaldDuration
        x: progressBar.width + parent.width/11
        y: 2
        text: AudioInfo.audioData[songIndex].duration
        font.pixelSize: 12
    }
    Timer {
        interval: 1000; running: true; repeat: true
        onTriggered: {
            if(!isPaused){
                progressValue++;
                progressBar.value = progressValue+1;
            }
        }
    }
    /* Making of scrollable ProgressBar
    MouseArea{
        anchors.fill: progressBar

    }*/
}
