/*
 * QML Material - An application framework implementing Material Design.
 * Copyright (C) 2015 Michael Spencer <sonrisesoftware@gmail.com>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as
 * published by the Free Software Foundation, either version 2.1 of the
 * License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.0
import QtQuick.Controls.Styles 1.3
import Material 0.1

ButtonStyle {

    background: View {
        radius: units.dp(2)

        elevation: control.hasOwnProperty("elevation") 
                ? control.elevation : 1
        backgroundColor: control.hasOwnProperty("backgroundColor") 
                ? control.backgroundColor
                : elevation > 0 ? "white" : "transparent"

        tintColor: control.pressed ||
                   (control.focus && !button.elevation) ||
                   (control.hovered && !button.elevation) ?
                   Qt.rgba(0,0,0, control.pressed ? 0.1 : 0.05) : "transparent"

        Ink {
            id: mouseArea
            
            anchors.fill: parent
            
            Connections {
                target: control.__behavior
                onPressed: mouseArea.onPressed(mouse)
                onCanceled: mouseArea.onCanceled()
                onReleased: mouseArea.onReleased(mouse)
            }
        }
    }
    label: Item {
        implicitHeight: Math.max(units.dp(36), label.height + units.dp(16))
        implicitWidth: Math.max(units.dp(64), label.width + units.dp(16))

        Label {
            id: label
            anchors.centerIn: parent
            text: control.text
            style: "button"
            color: control.hasOwnProperty("textColor")
                    ? control.textColor : Theme.light.textColor
        }
    }
}