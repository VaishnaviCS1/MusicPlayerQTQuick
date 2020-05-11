import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.13
import QtMultimedia 5.12
import "JSONData.js" as AudioInfo

Window {
    id: window
    visible: true
    width: 640
    height: 480
    opacity: 0.9
    title: qsTr("Audio Player")
    property bool isPaused: false
    property int horizontalSpace : screen.height/10
    property int progressValue: 0
    property int songIndex: 0
    Rectangle{
        gradient: Gradient {
            GradientStop {
                position: 0
                color: "#85caf2"
            }
            GradientStop {
                position: 0.236
                color: "#bd85f6"
            }
        }
        anchors.fill: parent

        Column{
            x:0
            y:window.height/10
            topPadding: window.height/10
            width:window.width
            height: window.height
            spacing: window.height/34
            Rectangle{
                id:titlerect
                color: "transparent"
                width:window.width
                Text{
                    id:songtitle
                    x: 66
                    anchors.fill: titlerect
                    anchors.horizontalCenter:parent.horizontalCenter
                    font.pixelSize: window.height/18
                    font.bold:true
                    text:AudioInfo.audioData[songIndex].title
                }
            }
            Image {
                id: songimage
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width/3
                height: parent.height/2
                fillMode: Image.PreserveAspectFit
                source: AudioInfo.audioData[songIndex].imgsrc
            }

            Text {
                id: subtitle
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: window.height/25
                font.bold:true
                text: AudioInfo.audioData[songIndex].subtitle
            }
            CustomProgressBar{id:custProgressBar}
            Audio{
                id:audio
                source: AudioInfo.audioData[songIndex].song
                autoLoad: true
                autoPlay: true
                volume: 1.0
            }
            Row{
                spacing:window.width/6
                width:window.width
                leftPadding: window.width/4
                Image{
                    id:previous
                    width:window.width/24
                    height: window.height/14
                    source: "image/previous.png"
                    MouseArea{
                        anchors.fill: previous
                        onClicked: {
                            (songIndex== 0) ? songIndex=2 : songIndex--;
                            progressValue=0;
                            audio.stop()

                            audio.source =AudioInfo.audioData[songIndex].song;
                            if(!isPaused){
                                audio.play();
                            }
                        }
                    }
                }
                Image{
                    id:play
                    width:window.width/24
                    height: window.height/14
                    source: "image/pause.png"

                    MouseArea{
                        anchors.fill: play
                        onClicked:{
                            if(!isPaused){
                                audio.pause(); play.source ="image/play.png"

                            }
                            else{
                                audio.play();
                                play.source ="image/pause.png"
                            }
                            isPaused=!isPaused;
                        }
                    }
                }
                Image{
                    id:next
                    width:window.width/24
                    height: window.height/14
                    source: "image/next.png"
                    MouseArea{
                        anchors.fill: next
                        onClicked: {
                            (songIndex== 2) ? songIndex=0 : songIndex++;
                            progressValue=0;
                            audio.stop()

                            audio.source =AudioInfo.audioData[songIndex].song;
                            if(!isPaused){
                                audio.play();
                            }
                        }
                    }
                }
            }
        }
        PropertyAnimation {
            target: titlerect
            property: "x"
            from:-window.width/1.2
            to:window.width
            duration: 6000
            loops: Animation.Infinite
            running: true
        }
    }

}
