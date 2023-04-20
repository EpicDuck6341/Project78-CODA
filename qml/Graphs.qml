import QtQuick 2.0
import QtQuick 6.2
import QtQuick.Window 6.2
import QtQuick.Controls 2.15


Rectangle {
    id: page
    width: 1920
    height: 1080
    color: classA.getColourComponent(0)

    Image {
        id: imageBG
        anchors.horizontalCenter: parent.horizontalCenter
        width: 1920
        height: 1080
        source: classA.getPath("../assets/background")
    }

    Rectangle{
        anchors.centerIn: parent
        width: 1200
        height: 850
        color: classA.getColourComponent(1)
        radius: 50

        Loader {
            id: sideBar
            source: "SideBar.qml"
        }

        Row {
            anchors {
                top: parent.top
                horizontalCenter: parent.horizontalCenter
                margins: 30
            }

            Image {
                source:  classA.getPath("../assets/graph")
                width: 40
                height: 40
                opacity: 0.8
            }

            Text {
                text: "Graphs"
                font.family: "Montserrat"
                font.pixelSize: 32
                color: classA.getColourComponent(4)
            }
        }


    }
}


