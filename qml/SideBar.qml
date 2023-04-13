import QtQuick 2.0

Item{
  id: sideBar
  function logout(){
      switchPage("Login.qml")
      classA.logUserAction(classA.getCurrentUser(),"Logged out")
      classA.setCurrentUser("")
  }

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
    spacing: 40
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
            source: classA.getPath("../assets/user")
            width: 45
            height: 45
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    switchPage("User.qml")
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
