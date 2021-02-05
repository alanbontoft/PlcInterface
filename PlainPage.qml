import QtQuick 2.0
import QtQuick.Controls 2.0

Item {

    property string pageColor
    property string buttonText

    property int modelIndex

    /*Rectangle {
        color: pageColor
        anchors.fill: parent
    }*/

    Button {
        id: button
        anchors.centerIn: parent
        text: buttonText

        onClicked: {
            TheDataList.data[modelIndex].increment()
        }
    }

    Label {
        anchors.top: button.bottom
        anchors.left: button.left
        text: TheDataList.data[modelIndex].salary
    }

}
