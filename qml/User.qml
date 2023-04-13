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


    Rectangle{
        anchors.centerIn: parent
        width: 1000
        height: 800
        color:classA.getColourComponent(1)
        border.color: classA.getColourComponent(3)
        antialiasing: true
        radius: 50
        Rectangle {
            x: 160
            width: 2
            height: 800
            color: classA.getColourComponent(3)


        }

        Text {
            id: loginText
            text: qsTr("User")
            font.pixelSize: 48
            x:500
            color :classA.getColourComponent(3)


        }
    Loader {
                id: sideBar
                source: "SideBar.qml"
            }

}
}
}

