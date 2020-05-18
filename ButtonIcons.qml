import QtQuick 2.13
import QtQuick.Controls 2.13
import QtQuick.Controls.Styles 1.4

Rectangle {
    width:window.width/24
    height: window.height/14
    property string imagesrc: ""
    property int bWidth: 0
    color: "transparent"
    Image{
        width:window.width/24
        height: window.height/14
        source: imagesrc
    }
    border.color: "white"
    border.width: bWidth
}
