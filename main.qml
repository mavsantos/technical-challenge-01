import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import './qml'

Window {
    width: 1280
    height: 800
    visible: true
    title: qsTr("Techinical Challenge 01")

    StackView {
        id: stack
        initialItem: homeScreenComponent
        anchors.fill: parent
    }
    Component {
        id: homeScreenComponent
        HomeScreen {
            stackView: stack
        }
    }
}
