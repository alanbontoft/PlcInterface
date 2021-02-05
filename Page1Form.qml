import QtQuick 2.12
import QtQuick.Controls 2.5

Page {

    title: qsTr("Page 1")

    anchors.fill: parent

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        Repeater{
            model: TheDataList.size
            PlainPage {
                id: page1
                modelIndex: index
                height: swipeView.height
                width: swipeView.width
                pageColor: "red"
                buttonText: "Page " + index
                visible: true
            }

        }

    }
/*
    PageIndicator {
        currentIndex: swipeView.currentIndex
        count: swipeView.count
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }
 */
    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex

        Repeater{
            model: TheDataList.size
            TabButton {
                text: qsTr("Page " + (index + 1))
            }
        }
    }

}
