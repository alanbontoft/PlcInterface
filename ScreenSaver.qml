import QtQuick 2.0
import QtQuick.Controls 2.5

Page {

    id: root
    anchors.fill: parent

    property int margin: 50
    property int targetWidth
    property int targetHeight

    Image {
        id: logo
        x: margin; y: margin
        source: Qt.resolvedUrl("qrc:/images/green_logo_trans.png")
        height: 100
        fillMode: Image.PreserveAspectFit
    }

    SequentialAnimation {
        id: sequAnim
        loops: Animation.Infinite
        running: true

        readonly property int _left_x: root.margin
        readonly property int _right_x: targetWidth - logo.width - root.margin
        readonly property int _top_y: root.margin
        readonly property int _bottom_y: targetHeight - logo.height - root.margin
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
