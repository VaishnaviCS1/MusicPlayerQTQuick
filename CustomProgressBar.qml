import QtQuick 2.13
import QtQuick.Controls 2.12
import QtQuick.Controls.Styles 1.4
import "JSONData.js" as AudioInfo

Item {
    id: name
    width:parent.width
    height: 24
    ProgressBar {
                id: progressBar
                value: 0
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width/1.2
                height: 24
                from:0
                to:AudioInfo.getIntervel(AudioInfo.audioData[songIndex].duration)

                background: Rectangle {
                    anchors.fill: progressBar
                    color: "black"
                    border.color: "white"
                    border.width: 1
                }

               contentItem:Item {
                   implicitWidth: 200
                   implicitHeight: 22
                   anchors.verticalCenter: progressBar.verticalCenter
                   anchors.topMargin: 1
                   Rectangle {
                       width: progressValue * (progressBar.width/progressBar.to)
                       height: 22
                       radius: 2
                       color: "#7373fb"
                   }
               }
            }


    Text {
        id: currentTime
        x: parent.width/25
        y: 2
        text: AudioInfo.getTimeFromIntervel(progressValue)
        font.pixelSize: 20
        font.bold:true
        color: "white"
    }

    Text {
        id: reminingDuration
        x: progressBar.width + parent.width/11
        y: 2
        text:"-"+AudioInfo.getTimeFromIntervel( AudioInfo.getIntervel(AudioInfo.audioData[songIndex].duration)-progressValue)
        font.pixelSize: 20
        font.bold:true
        color: "white"
    }
    Timer {
        interval: 1000; running: true; repeat: true
        onTriggered: {

            if(!isPaused & progressValue!=progressBar.to){
                progressValue++;
                progressBar.value = progressValue+1;
            }
        }
    }
}
