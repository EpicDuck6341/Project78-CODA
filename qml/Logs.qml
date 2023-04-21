import QtQuick 2.0
import QtQuick 6.2
import QtQuick.Window 6.2
import QtQuick.Controls 2.15


Rectangle {
    id: page
    width: 1920
    height: 1080
    color: classA.getColourComponent(0)

    function searchUserAction(){
        if(searchUser.text!==""){
        classA.findUserAction(searchUser.text)

        if(classA.getUserAction(0,0)!==""){
            userActionLoader.active = true
            classA.setActionLoaderState(true)
        }
        else{
            userActionLoader.active = false
            classA.setActionLoaderState(false)

        }
        }
    }

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

         Rectangle{
            y:175
            x:175
             width:1000
             height: 600
             color: classA.getColourComponent(6)
             border.color: classA.getColourComponent(4)
             border.width:  1
             antialiasing: true
             radius: 50
         }

        Item{
            x:200
            y:225
            Text { text: "ID"; font.bold: true; y:-20;color:classA.getColourComponent(4)}
            Text { text: "Username"; font.bold: true;y:-20;x:30;color:classA.getColourComponent(4) }
            Text { text: "Action"; font.bold: true;y:-20;x:105;color:classA.getColourComponent(4) }
            Text { text: "Timestamp"; font.bold: true;y:-20;x:180;color:classA.getColourComponent(4) }
            Text { text: "ID"; font.bold: true; y:-20;x:493;color:classA.getColourComponent(4)}
            Text { text: "Username"; font.bold: true;y:-20;x:523;color:classA.getColourComponent(4) }
            Text { text: "Action"; font.bold: true;y:-20;x:597;color:classA.getColourComponent(4) }
            Text { text: "Timestamp"; font.bold: true;y:-20;x:673;color:classA.getColourComponent(4) }
        }



        Loader{
        id:userActionLoader
         active: classA.getActionLoaderState()
        sourceComponent:Item{
            x: 200
            y: 225



            Grid{
                rows: classA.userActionSize() + 1
                spacing: 10
                columns: 2
                columnSpacing: 20



                // Use a Repeater to create a row for each entry in the 2D array
                Repeater {
                    model: classA.userActionSize()
                    delegate: Grid{
                        columns:4

                        Text { text: classA.getUserAction(index,0)+".       " ;color:classA.getColourComponent(4)}
                        Text { text: classA.getUserAction(index,1)+"        ";color:classA.getColourComponent(4) }
                        Text { text: classA.getUserAction(index,2)+"   "  ;color:classA.getColourComponent(4)}
                        Text { text: classA.getUserAction(index,3)+" "  ;color:classA.getColourComponent(4)}
                        Rectangle{
                            color:classA.getColourComponent(5)
                            width:20
                            height:5
                        }
                    }
                }
            }
        }
    }







        TextField {
            id: searchUser
            anchors.horizontalCenter: parent.horizontalCenter
            y: 80
            width: 210
            height: 45
            opacity: 1
            placeholderText: "Search User"
            placeholderTextColor:classA.getColourComponent(4)
            hoverEnabled: true
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.family: "Roboto"
            font.pointSize: 12
            font.bold: true
            background: Rectangle {
                color: "#F5F5F5"
                border.width: 1
                border.color: "#B0BEC5"
                radius: 10
            }
        }

        Button {
            id: searchButton
            anchors.horizontalCenter: parent.horizontalCenter
            flat: false // set to false to show the button border and background
            y: 130
            width: 150
            height: 30
            text: qsTr("Search")
            display: AbstractButton.TextOnly
            background: Rectangle {
                color: classA.getColourComponent(5) // set the button background color to a muted blue-gray
                border.width: 2
                border.color: classA.getColourComponent(5)
                radius: 10
            }
            font.family: "Roboto"
            font.pointSize: 12
            font.bold: true
            onClicked: searchUserAction()
        }

        Row {
            anchors {
                top: parent.top
                horizontalCenter: parent.horizontalCenter
                margins: 30
            }

            Image {
                source:  classA.getPath("../assets/logs")
                width: 40
                height: 40
                opacity: 0.8
            }

            Text {
                text: "Logs"
                font.family: "Montserrat"
                font.pixelSize: 32
                color: classA.getColourComponent(4)
            }
        }


    }



}
