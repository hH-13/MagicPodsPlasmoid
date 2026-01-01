import QtQuick
import org.kde.ksvg as KSvg
import org.kde.plasma.core as PlasmaCore
import org.kde.plasma.components as PlasmaComponents
import org.kde.kirigami as Kirigami

Row {
    id: batteryRow
    property string title: ""
    property int battery: 0          // 0-100
    property bool isCharging: false
    property int status: 2           // 0/1: hide

    spacing: Kirigami.Units.mediumSpacing
    visible: status !== 0 && status !== 1
    opacity: status === 3 ? 0.5 : 1
    height: Math.max(batteryIcon.height, textCol.implicitHeight)

    Item {
        id: batteryIcon
        width: 20
        height: 32
        y: (batteryRow.height - height) / 2
        readonly property real scaleX: width / 16
        readonly property real scaleY: height / 28

        KSvg.Svg {
            id: batterySvg
            imagePath: Qt.resolvedUrl("../icons/battery.svg")
        }

        Rectangle {
            id: batteryFillRect
            x: 3 * batteryIcon.scaleX
            width: 10 * batteryIcon.scaleX
            height: 20 * batteryIcon.scaleY * Math.max(0, Math.min(100, batteryRow.battery)) / 100
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 3 * batteryIcon.scaleY
            color: "#59BF40"
        }

        KSvg.SvgItem {
            id: batteryCharging
            anchors.centerIn: parent
            svg: batterySvg
            elementId: "charging"
            visible: batteryRow.isCharging
        }

        KSvg.SvgItem {
            id: batteryOutline
            anchors.fill: parent
            svg: batterySvg
            elementId: "outline"
        }
    }

    Column {
        id: textCol
        spacing: -4
        y: (batteryRow.height - implicitHeight) / 2

        PlasmaComponents.Label {
            text: batteryRow.title
            opacity: 0.8
        }

        PlasmaComponents.Label {
            text: batteryRow.battery + "%"
            font.bold: true
            font.pointSize: Kirigami.Theme.defaultFont.pointSize * 1.2
        }
    }
}
