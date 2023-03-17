import QtQuick 2.0

Item{
  id: sideBar
Row {
    x: 30
    y: 30
    Image {
        source: classA.getPath("../assets/Logo")
        width: 130
        height: 80
    }
}

Column {
    x: 45
    y: 220
    spacing: 52
    Row {
        Image {
            source:classA.getPath("../assets/dashboard")
            width: 60
            height: 60
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
            width: 60
            height: 60
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
            width: 60
            height: 60
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
            width: 60
            height: 60
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
            width: 60
            height: 60
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
            width: 60
            height: 60
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
            width: 60
            height: 60
            MouseArea {
                anchors.fill: parent
                onClicked: switchPage("Login.qml")
            }
        }
}
}
}
