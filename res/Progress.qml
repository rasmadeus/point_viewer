import QtQuick 2.0

Rectangle {
    property double progress: 0.0;
    width: 20;

    Rectangle {
        id: rightEye;
        anchors.left: parent.left;
        anchors.right: parent.right;
        anchors.bottom: parent.bottom;
        height: (progress > 0.0 ? progress : 0.05) * parent.height;

        gradient: Gradient {
            GradientStop { position: 1.0; color: "#fff"; }
            GradientStop { position: 0.0; color: "#00f"; }
        }

        Behavior on height {
            NumberAnimation {
                duration: 500
                easing.type: Easing.Linear
            }
        }
    }
}
