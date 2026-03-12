import QtQuick
import Quickshell
import Quickshell.Io
import Quickshell.Hyprland

PanelWindow {
    id: root
    anchors {
        top:true
        left:true
        right:true
    }
    implicitHeight: 30
    color: "#1d2021"

//clock
    SystemClock {
        id: clock
        precision: SystemClock.Minutes
    }    
    Text {
        id: showclock
        text: Qt.formatTime(clock.date, "hh : mm")
        anchors.right: parent.right
        anchors.margins: 15
        padding : 5
        color: "#d5c4a1"
    }
//hyprland-worksapce
    Text {
        id: hypr_worksapce
        anchors { left: parent.left; margins: 15}
        padding: 5
        color: "#d5c4a1"
        text: "help"
    }
}


