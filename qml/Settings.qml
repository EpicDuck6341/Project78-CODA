import QtQuick 2.0
import QtQuick 6.2
import QtQuick.Window 6.2
import QtQuick.Controls 2.15


Page{

    function switchColour(){
        //Set Bright
        if(classA.getColourComponent(0)==="#010105"){
            classA.setColourComponent(0,"#FEFEFA")
            classA.setColourComponent(1,"#ECEFF1")
            classA.setColourComponent(2,".png")
            classA.setColourComponent(3,"#B0BEC5")
            classA.setColourComponent(4,"#757575")
            classA.setColourComponent(5,"#B0BEC5")

        }
        //Set Dark
        else if(classA.getColourComponent(0)==="#FEFEFA"){
            classA.setColourComponent(0,"#010105")
            classA.setColourComponent(1,"#121212")
            classA.setColourComponent(2,"White.png")
            classA.setColourComponent(3,"#3b3b3b")
            classA.setColourComponent(4,"#B0BEC5")
            classA.setColourComponent(5,"#B0BEC5")
        }
        switchPage("Settings.qml")
    }

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
        width: 1000
        height: 800
        color:classA.getColourComponent(1)
        border.color:  classA.getColourComponent(3)
        antialiasing: true
        radius: 50
        Rectangle{
            x:160
            width:2
            height:800
             color: classA.getColourComponent(3)

        }

    Loader {
                id: sideBar
                source: "SideBar.qml"
            }

    Text {
        id: loginText
        x:500
        text: "Settings"
        font.pixelSize: 48
        horizontalAlignment: Text.AlignHCenter
        color: classA.getColourComponent(4)
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
}


