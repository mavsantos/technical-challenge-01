import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    id: ipcScreen
    color: "#1E1E1E"

    property StackView stack

    Column {
        id: layoutColumn
        anchors.fill: parent
        spacing: parent.height * 0.025
        Item {
            width: parent.width
            height: parent.height * 0.025
        }
        Button {
            width: parent.width * 0.1667
            height: parent.height * 0.05
            anchors.left: view.left
            text: "Voltar"
            background: Rectangle {
                color: "#444444"
                radius: 20
            }
            contentItem: Text {
                text: parent.text
                color: "white"
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 20
                font.bold: true
            }
            onClicked: stack.pop(null)
        }
        Text {
            text: "Tópico:"
            color: "white"
            font.pixelSize: 18
            horizontalAlignment: Text.AlignHCenter
            anchors.left: topicArea.left
        }
        TextArea {
            id: topicArea
            width: parent.width * 0.9
            height: parent.height * 0.05
            anchors.horizontalCenter: parent.horizontalCenter
            placeholderText: "Digite aqui o tópico da mensagem..."
            color: "white"
            background: Rectangle {
                radius: 20
                color: "#303030"
            }
        }
        Text {
            text: "Conteúdo:"
            color: "white"
            font.pixelSize: 18
            horizontalAlignment: Text.AlignHCenter
            anchors.left: topicArea.left
        }
        ScrollView {
            id: view
            width: parent.width * 0.9
            height: parent.height * 0.6
            anchors.horizontalCenter: parent.horizontalCenter
            clip: true
            TextArea {
                id: textArea
                anchors.fill: parent
                placeholderText: "Digite aqui o conteúdo da mensagem..."
                color: "white"
                wrapMode: TextEdit.WrapAnywhere
                background: Rectangle {
                    radius: 20
                    color: "#303030"
                }
            }
        }
        Button {
            id: sendIpcMessage
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width * 0.15
            height: parent.height * 0.05
            text: "Enviar"
            background: Rectangle {
                        color: "#EC6608"
                        radius: 20
            }
            contentItem: Text {
                text: parent.text
                color: "white"
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 20
                font.bold: true
            }
            onClicked: ipcInterface.sendMessage(topicArea.text, textArea.text)
        }

    }
}
