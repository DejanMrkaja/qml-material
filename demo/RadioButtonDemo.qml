import QtQuick 2.0
import QtQuick.Layouts 1.1
import Material 0.1

ColumnLayout {

    Repeater {
        model: 2

        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.minimumHeight: grid.height + units.dp(80)
            Layout.minimumWidth: grid.width + units.dp(80)
            color: index == 0 ? "#EEE" : "#333"

            GridLayout {
                id: grid
                anchors.centerIn: parent
                rowSpacing: units.dp(20)
                columnSpacing: units.dp(20)
                columns: 3

                // Empty filler
                Item { width: 1; height: 1 }

                Label {
                    Layout.alignment : Qt.AlignHCenter
                    text: "Normal"
                    color: index == 0 ? Theme.light.textColor : Theme.dark.textColor
                }

                Label {
                    Layout.alignment : Qt.AlignHCenter
                    text: "Disabled"
                    color: index == 0 ? Theme.light.textColor : Theme.dark.textColor
                }

                Label {
                    text: "On"
                    color: index == 0 ? Theme.light.textColor : Theme.dark.textColor
                }

                RadioButton {
                    checked: true
                    text: "Selected"
                    darkBackground: index == 1
                }

                RadioButton {
                    checked: true
                    enabled: false
                    text: "Disabled"
                    darkBackground: index == 1
                }

                Label {
                    text: "Off"
                    color: index == 0 ? Theme.light.textColor : Theme.dark.textColor
                }

                RadioButton {
                    text: "Selected"
                    darkBackground: index == 1
                }

                RadioButton {
                    enabled: false
                    text: "Disabled"
                    darkBackground: index == 1
                }
            }
        }
    }
}
