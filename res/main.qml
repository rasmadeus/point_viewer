import QtQuick 2.9
import QtQuick.Window 2.2
import "qrc:/res"

Window {
    function randomInt(max) {
        return Math.floor(Math.random() * Math.floor(max));
    }

    visible: true
    width: 640
    height: 480

    Screen {
        id: screen;
        anchors.fill: parent;
    }

    Timer {
        id: fakeSource;
        interval: 200; running: true; repeat: true;
        onTriggered: {
            screen.xEye = Math.random();
            screen.yEye = Math.random();
            screen.leftEyeProgress = Math.random();
            screen.rightEyeProgress = Math.random();
        }
    }
}
