import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Dialogs 1.3

Rectangle {
    color: "#1E1E1E"
    property StackView stack

    Column {
        id: layoutColumn
        anchors.fill: parent
        spacing: parent.height * 0.05
        Item {
            width: parent.width
            height: parent.height * 0.001
        }
        Row {
            width: parent.width * 0.9
            height: parent.height * 0.10
            anchors.horizontalCenter: parent.horizontalCenter
            Button {
                width: parent.width * 0.1667
                height: parent.height * 0.5
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
            Button {
                id: openFileButton
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width * 0.1667
                height: parent.height * 0.5
                text: "Abrir Arquivo"
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
                onClicked: fileDialog.open()
            }

        }

        ScrollView {
            id: view
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width * 0.9
            height: parent.height * 0.7
            clip: true
            TextArea {
                id: textArea
                placeholderTextColor: "white"
                placeholderText: ""
                readOnly: true
                clip: true
                wrapMode: TextEdit.WrapAnywhere
                background: Rectangle {
                    radius: 20
                    color: "#303030"
                }
            }
        }
    }
    FileDialog{
        id: fileDialog
        folder: fileLoader.getHomePath()
        nameFilters: ["Text Files (*.txt)", "All Files (*)"]
        onAccepted: {
            fileLoader.openFile(fileDialog.fileUrl)
            textArea.placeholderText = fileLoader.getFileContent()
        }
    }
}
