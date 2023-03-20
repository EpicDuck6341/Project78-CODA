import QtQuick 2.0
import QtQuick 6.2
import QtQuick.Window 6.2
import QtQuick.Controls 2.15


Page{

    function switchColour(){
        //Set Bright
        if(classA.getColourComponent(0)==="#3b3a4a"){
            classA.setColourComponent(0,"#9695ab")
            classA.setColourComponent(1,"#7070AC")
            classA.setColourComponent(2,".png")
        }
        //Set Dark
        else if(classA.getColourComponent(0)==="#9695ab"){
            classA.setColourComponent(0,"#3b3a4a")
            classA.setColourComponent(1,"#161626")
            classA.setColourComponent(2,"White.png")
        }
        switchPage("Settings.qml")
    }

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
        text: "Settings"
        font.pixelSize: 48
        horizontalAlignment: Text.AlignHCenter
    }
        Button {
                        id: button
                        anchors.horizontalCenter: parent.horizontalCenter
                        flat: true
                        y: 550
                        width: 150
                        height: 45
                        text: qsTr("Login")
                        display: AbstractButton.TextOnly
                        background: Rectangle {
                            color: "#a0a0a0"
                            border.width: 2
                            border.color: "#161626"
                            radius: 10
                        }
                        font.family: "Roboto"
                        font.pointSize: 12
                        font.bold: true
                        onClicked:switchColour()
                    }
    }
}



