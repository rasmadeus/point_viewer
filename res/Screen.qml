import QtQuick 2.9
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.11
import "qrc:/res"

Rectangle {
    property double leftEyeProgress: 0.0;
    property double rightEyeProgress: 0.0;
    property double xEye: 0.0;
    property double yEye: 0.0;

    gradient: Gradient {
        GradientStop { position: 1.0; color: "#fff"; }
        GradientStop { position: 0.0; color: "#ccf"; }
    }

    RowLayout {
        property int offset: 8;
        spacing: offset;
        anchors.fill: parent;
        anchors.margins: offset;

        Progress {
            progress: leftEyeProgress;
            Layout.alignment: Qt.AlignCenter;
            Layout.fillHeight: true;
        }

        Rectangle {
            Layout.fillWidth: true;
            Layout.fillHeight: true;

            gradient: Gradient {
                GradientStop { position: 0.0; color: "#ccf"; }
                GradientStop { position: 1.0; color: "#fff"; }
            }

            Rectangle {
                id: gaze;
                x: parent.x + parent.width * xEye  - width * 0.5;
                y: parent.y + parent.height * yEye - height * 0.5;
                width: Math.min(parent.width, parent.height) * 0.08;
                height: width;
                radius: width * 0.5;
                color: "#f00";

                Behavior on x {
                    NumberAnimation {
                        duration: 500
                        easing.type: Easing.Linear
                    }
                }

                Behavior on y {
                    NumberAnimation {
                        duration: 500
                        easing.type: Easing.Linear
                    }
                }
            }
        }

        Progress {
            progress: rightEyeProgress;
            Layout.alignment: Qt.AlignCenter;
            Layout.fillHeight: true;
        }
    }

    ColumnLayout {
        anchors.centerIn: parent;
        spacing: 8;

        Text {
            Layout.alignment: Qt.AlignLeft | Qt.AlignHCenter;
            text: qsTr("<b>Left eye accuracy:</b> %1%").arg(Math.round(100.0 * leftEyeProgress));
            color: "darkblue";
        }

        Text {
            Layout.alignment: Qt.AlignLeft | Qt.AlignHCenter;
            text: qsTr("<b>Right eye accuracy:</b> %1%").arg(Math.round(100.0 * rightEyeProgress));
            color: "darkblue";
        }

        Text {
            Layout.alignment: Qt.AlignLeft | Qt.AlignHCenter;
            text: qsTr("<b>Gaze point:</b> [%1; %2]").arg(xEye.toFixed(3)).arg(yEye.toFixed(3));
            color: "darkblue";
        }
    }

    Text {
        anchors.horizontalCenter: parent.horizontalCenter;
        anchors.top: parent.top;

        color: "darkblue";
    }
}
