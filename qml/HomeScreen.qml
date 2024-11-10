import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    color: "#1E1E1E"
    property StackView stackView

    Column {
        anchors.fill: parent
        spacing: parent.height * 0.10
        Item {
            width: parent.width
            height: parent.height * 0.10
        }
        Button {
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width * 0.25
            height: parent.height * 0.10
            text: "Abrir Arquivo"
            background: Rectangle {
                        color: "#EC6608"
                        radius: 20
            }
            contentItem: Text {
                text: parent.text
                color: "white"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: 40
                font.bold: true
            }
            onClicked: stackView.push(fileLoaderScreenComponent)
        }
        Button {
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width * 0.25
            height: parent.height * 0.10
            text: "Enviar Comando"
            background: Rectangle {
                        color: "#EC6608"
                        radius: 20
            }
            contentItem: Text {
                text: parent.text
                color: "white"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: 40
                font.bold: true
            }
            onClicked: stackView.push(ipcSreenComponent)
        }
        Button {
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width * 0.25
            height: parent.height * 0.10
            text: "Sair"
            background: Rectangle {
                        color: "#EC6608"
                        radius: 20
            }
            contentItem: Text {
                text: parent.text
                color: "white"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: 40
                font.bold: true
            }
            onClicked: stackView.push(ipcSreenComponent)
        }
    }
    Component {
        id: fileLoaderScreenComponent
        FileLoaderScreen {
            stack: stackView
        }
    }
    Component {
        id: ipcSreenComponent
        IpcScreen {
            stack: stackView
        }
    }

}
