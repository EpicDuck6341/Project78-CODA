import QtQuick 2.0
import QtQuick 6.2
import QtQuick.Window 6.2
import QtQuick.Controls 2.15


Page{
    Rectangle {
    id: page
    width: 1920
    height: 1080
    color: classA.getColourComponent(0)

    Loader {
                id: sideBar
                source: "SideBar.qml"
            }

    Text {
        id: loginText
        x: 900
        y: 450
        text: qsTr("Graphs")
        font.pixelSize: 48
        horizontalAlignment: Text.AlignHCenter
    }
}

}
