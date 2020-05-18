import QtQuick 2.12
import QtQuick.Window 2.3
import QtQuick.Controls 2.1
import QtMultimedia 5.12
import QtGraphicalEffects 1.13
import "JSONData.js" as AudioInfo

ApplicationWindow {
    id: window
    visible: true
    width: 640
    height: 480
    visibility: "FullScreen"
    title: qsTr("Audio Player")
    background:Item {
        id: bg

        Image {
            id:bgImg
            source: AudioInfo.audioData[songIndex].imgsrc
            width: window.width
            height: window.height
            smooth: true
            visible: false
        }
        FastBlur{
            anchors.fill: bgImg
            source: bgImg
            radius:100
        }
    }
    property bool isPaused: false
    property int horizontalSpace : screen.height/10
    property int progressValue: 0
    property int songIndex: 0
    Item{
        x:0
        y:0
        anchors.fill: parent

        Text {
            id: huidige
            x:150
            y:100
            color: "white"
            text: qsTr("Huidige")
            font.pixelSize:window.height/20
            font.bold: true
            font.family: "Clockopia"
        }
        Image{
            x:window.width-300
            y:100
            source: "image/spotify.png"
            width:200
            height: 100
        }

        Column{
            x:0
            y:window.height/10
            topPadding: window.height/10
            width:window.width
            height: window.height
            spacing: window.height/34
            /*Rectangle{

            id:titlerect
            color: "transparent"
            width:window.width*/
            Text{
                id:songtitle
                x: 66
                //anchors.fill: titlerect
                anchors.horizontalCenter:parent.horizontalCenter
                font.pixelSize: window.height/25
                font.bold:true
                text:AudioInfo.audioData[songIndex].title
                color: "white"
            }
            //}
            Image {
                id: songimage
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width/3.2
                height: parent.height/2.5
                fillMode: Image.PreserveAspectFit
                source: AudioInfo.audioData[songIndex].imgsrc
            }

            Text {
                id: subtitle
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: window.height/35
                font.bold:true
                color: "white"
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

                ButtonIcons{
                    id:previous
                    imagesrc: "image/previous.png"
                    MouseArea{
                        anchors.fill: previous
                        onClicked: {
                            previous.bWidth = 2;
                            play.bWidth = 0;
                            next.bWidth = 0;
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
                ButtonIcons{
                    id:play
                    imagesrc:"image/pause.png"
                    MouseArea{
                        anchors.fill: play
                        onClicked:{
                            play.bWidth = 2;
                            next.bWidth = 0;
                            previous.bWidth=0;
                            if(!isPaused){
                                audio.pause();
                                play.imagesrc ="image/play.png"

                            }
                            else{
                                audio.play();
                                play.imagesrc ="image/pause.png"
                            }
                            isPaused=!isPaused;
                        }
                    }
                }
                ButtonIcons{
                    id:next
                    imagesrc:"image/next.png"

                    MouseArea{

                        anchors.fill: next
                        onClicked: {
                            next.bWidth = 2;
                            play.bWidth = 0 ;
                            previous.bWidth=0;
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

                Image{

                    id:icon
                    source: "image/song_icon.png"
                    width: 50
                    height: 50
                }
            }
            /*PropertyAnimation {
            target: titlerect
            property: "x"
            from:-window.width/1.2
            to:window.width
            duration: 8000
            loops: Animation.Infinite
            running: true
        }*/
        }


        focus: true
        Keys.onLeftPressed:{
            previous.bWidth = 2;
            play.bWidth = 0;
            next.bWidth = 0;
            (songIndex== 0) ? songIndex=2 : songIndex--;
            progressValue=0;
            audio.stop()

            audio.source =AudioInfo.audioData[songIndex].song;
            if(!isPaused){
                audio.play();
            }
        }
        Keys.onRightPressed: {
            next.bWidth = 2;
            play.bWidth = 0 ;
            previous.bWidth=0;
            (songIndex== 2) ? songIndex=0 : songIndex++;
            progressValue=0;
            audio.stop()

            audio.source =AudioInfo.audioData[songIndex].song;
            if(!isPaused){
                audio.play();
            }
        }
        Keys.onReturnPressed:  {
            console.log("Enter pressed")
            play.bWidth = 2;
            next.bWidth = 0;
            previous.bWidth=0;
            if(!isPaused){
                audio.pause();
                play.imagesrc ="image/play.png"

            }
            else{
                audio.play();
                play.imagesrc ="image/pause.png"
            }
            isPaused=!isPaused;
        }
        Keys.onEscapePressed: Qt.quit();
    }
}
