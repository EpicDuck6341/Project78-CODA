import QtQuick 2.0
import QtQuick.Controls 2.15

Page {
    function switchColour(){
         //Set Bright
         if(classA.getColourComponent(0)==="#010105"){
             classA.setColourComponent(0,"#FEFEFA")
             classA.setColourComponent(1,"#ECEFF1")
             classA.setColourComponent(2,".png")
             classA.setColourComponent(3,"#B0BEC5")
             classA.setColourComponent(4,"#757575")
             classA.setColourComponent(5,"#B0BEC5")
             classA.setColourComponent(6,"#d6d6d6")

         }
         //Set Dark
         else if(classA.getColourComponent(0)==="#FEFEFA"){
             classA.setColourComponent(0,"#010105")
             classA.setColourComponent(1,"#242124")
             classA.setColourComponent(2,"White.png")
             classA.setColourComponent(3,"#3b3b3b")
             classA.setColourComponent(4,"#B0BEC5")
             classA.setColourComponent(5,"#B0BEC5")
             classA.setColourComponent(6,"#100C08")
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
                    source:  classA.getPath("../assets/settings")
                    width: 40
                    height: 40
                    opacity: 0.8
                }

                Text {
                    text: "Settings"
                    font.family: "Montserrat"
                    font.pixelSize: 32
                    color: classA.getColourComponent(4)
                }
            }

            Button {
                id: button
                anchors {
                    horizontalCenter: parent.horizontalCenter
                    bottom: parent.bottom
                    margins: 30
                }
                flat: true
                width: 200
                height: 60
                text: qsTr("Login")
                font.family: "Open Sans"
                font.pixelSize: 18
                font.bold: true
                background: Rectangle {
                    color: "#0072c6"
                    radius: 30
                }
                onClicked: switchColour()
            }
        }
    }
}
