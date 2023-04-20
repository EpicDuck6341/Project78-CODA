import QtQuick 2.0

Item{
  id: sideBar
  function logout(){
      switchPage("Login.qml")
      classA.logUserAction(classA.getCurrentUser(),"Logged out")
      classA.setCurrentUser("")
  }
 Rectangle{

      width:150
      height: 850
      color: classA.getColourComponent(6)
      border.color: classA.getColourComponent(4)
      border.width:  1
      antialiasing: true
      radius: 50


Row {
    x: 30
    y: 30
    Image {
        source: classA.getPath("../assets/Logo")
        width: 100
        height: 60
    }
}

Column {
    x: 45
    y: 145
    spacing: 60
    Row {
        Image {
            source:classA.getPath("../assets/dashboard")
            width: 45
            height: 45
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    switchPage("Dashboard.qml")
                }
            }
        }
    }
    Row {
        Image {
            source: classA.getPath("../assets/command")
            width: 45
            height: 45
            MouseArea {
                anchors.fill: parent
                onClicked: {
                   switchPage("Commands.qml")
                }
            }
        }
    }
    Row {
        Image {
            source: classA.getPath("../assets/logs")
            width: 45
            height: 45
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    switchPage("Logs.qml")
                }
            }
        }
    }
    Row {
        Image {
            source: classA.getPath("../assets/graph")
            width: 45
            height: 45
            MouseArea {
                anchors.fill: parent
                onClicked: {
                   switchPage("Graphs.qml")
                }
            }
        }
    }
    Row {
        Image {
            source: classA.getPath("../assets/settings")
            width: 45
            height: 45
            MouseArea {
                anchors.fill: parent
                onClicked: {
                   switchPage("Settings.qml")
                }
            }
        }
}
    Row {
        Image {
            source: classA.getPath("../assets/exit")
            width: 45
            height: 45
            MouseArea {
                anchors.fill: parent
                onClicked: logout()
            }
        }
}
}
}
}

