import QtQuick 2.12
import QtQuick.Controls 2.5

ApplicationWindow {
    id: window
    width: 640
    height: 480
    visible: true
    // visibility: "Fullscreen"
    title: qsTr("Stack")

    header: ToolBar {
        contentHeight: toolButton.implicitHeight

        ToolButton {
            id: toolButton
            text: stackView.depth > 1 ? "\u25C0" : "\u2630"
            font.pixelSize: Qt.application.font.pixelSize * 1.6
            onClicked: {

                console.debug("Stack depth: " + stackView.depth)
                if (stackView.depth > 1) {
                    stackView.pop()
                } else {
                    drawer.open()
                }
            }
        }

        Label {
            text: stackView.currentItem.title
            anchors.centerIn: parent
        }
    }

    Drawer {
        id: drawer
        width: window.width * 0.66
        height: window.height

        Column {
            anchors.fill: parent

            ItemDelegate {
                text: qsTr("Page 1")
                width: parent.width
                onClicked: {
                    stackView.push("Page1Form.qml")
                    // stackView.push(page1)
                    drawer.close()
                }
            }
            ItemDelegate {
                text: qsTr("Page 2")
                width: parent.width
                onClicked: {
                    stackView.push("Page2Form.qml")
                    // stackView.push(page2)
                    drawer.close()
                }
            }

            ItemDelegate {
                text: qsTr("Set")
                width: parent.width
                onClicked: {
                    TheDataList.size = dataSize.text
                    stackView.push("Page1Form.qml")
                    drawer.close()
                }
            }

            Rectangle {
                height: 50
                width: 100
                color: "lightblue"

                TextEdit {
                    id: dataSize
                    text: "1"
                    anchors.fill: parent
                    font.pixelSize: 20
                    horizontalAlignment: TextEdit.AlignHCenter
                    verticalAlignment: TextEdit.AlignVCenter
                }
            }






        }
    }

    StackView {
        id: stackView
        // initialItem: "HomeForm.qml"
        initialItem: "ScreenSaver.qml"
        anchors.fill: parent
    }
}

