import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0


Grid{
    id: grid
    // anchors.fill: parent
    // anchors.margins: 0
    columns: 4

    Repeater {
        model: 8

        Item {
            id: cell
            width: grid.width / 4
            height: grid.height / 2

            Rectangle {
                height: 40
                width: 100
                anchors.centerIn: cell
                border.color: "teal"

                border.width: 2
                color: "grey"
                radius: 4
                smooth: true

                Label{
                    id: reading
                    text: ((index + 1) * 12.3).toFixed(2)
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    //font.family: "Courier"
                    font.pointSize: 20
                    color: "black"
                    anchors.centerIn: parent
                }

                Label{
                    anchors.horizontalCenter: reading.horizontalCenter
                    anchors.bottom: reading.top
                    anchors.margins: 20
                    font.pointSize: 20
                    text: index + 1
                }
            }
        }
    }
}





/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
