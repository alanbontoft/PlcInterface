import QtQuick 2.0
import QtQuick.Controls 2.5

Page {

    id: root
    anchors.fill: parent

    property int _margin: 10

    Image {
        id: logo
        x: _margin; y: _margin
        source: Qt.resolvedUrl("qrc:/images/green_logo_trans.png")
        height: 100
        fillMode: Image.PreserveAspectFit
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            /*console.log(root.width)
            console.log(logo.width)
            console.log(root.width - logo.width)
            console.log(logo.x)
            console.log(logo.y)*/

            console.log("Left X: " + sequAnim._left_x)
            console.log("Right X: " + sequAnim._right_x)
            console.log("Top Y: " + sequAnim._top_y)
            console.log("Bottom Y: " + sequAnim._bottom_y)
        }
    }

    SequentialAnimation {
        id: sequAnim
        loops: Animation.Infinite
        running: true

        // readonly property int _left_x: root._margin
        // readonly property int _right_x: root.width - logo.width - root._margin
        // readonly property int _top_y: root._margin
        // readonly property int _bottom_y: root.height - logo.height - root._margin
        readonly property int _left_x: 10
        readonly property int _right_x: 338
        readonly property int _top_y: 10
        readonly property int _bottom_y: 322
        readonly property int _duration: 3000

        ParallelAnimation {

            PropertyAnimation {
                target: logo
                property: "x"
                duration: sequAnim._duration
                easing.type: Easing.InOutQuad
                to: sequAnim._right_x
            }

            PropertyAnimation {
                target: logo
                property: "y"
                duration: sequAnim._duration
                easing.type: Easing.InOutQuad
                to: sequAnim._bottom_y
            }
        }


        PropertyAnimation {
            target: logo
            property: "y"
            duration: sequAnim._duration
            easing.type: Easing.InOutQuad
            to: sequAnim._top_y
        }


        ParallelAnimation {

            PropertyAnimation {
                target: logo
                property: "x"
                duration: sequAnim._duration
                easing.type: Easing.InOutQuad
                to: sequAnim._left_x
            }

            PropertyAnimation {
                target: logo
                property: "y"
                duration: sequAnim._duration
                easing.type: Easing.InOutQuad
                to: sequAnim._bottom_y
            }
        }

        PropertyAnimation {
            target: logo
            property: "y"
            duration: sequAnim._duration
            easing.type: Easing.InOutQuad
            to: sequAnim._top_y
        }
    }
}
