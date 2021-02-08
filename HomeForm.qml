import QtQuick 2.12
import QtQuick.Controls 2.5

Page {
    width: 600
    height: 400

    title: qsTr("Home")

    Image {
        anchors.centerIn: parent
        source: Qt.resolvedUrl("qrc:/images/green_logo_trans.png")
        height: 150
        fillMode: Image.PreserveAspectFit
    }
}
