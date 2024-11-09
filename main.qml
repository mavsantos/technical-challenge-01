import QtQuick 2.15
import QtQuick.Window 2.15
import './qml'

Window {
    width: 1280
    height: 800
    visible: true
    title: qsTr("Hello World")
    FileLoaderScreen{
        anchors.fill: parent
    }
}
