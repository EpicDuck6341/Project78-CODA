import QtQuick 2.0

Item{
  id: sideBar
Row {
    x: 45
    y: 30
    Image {
        source: "xdd.png"
        width: 60
        height: 60
    }
}

Column {
    x: 45
    y: 220
    spacing: 52
    Row {
        Image {
            source: "dashboard.png"
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
            source: "command.png"
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
            source: "logs.png"
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
            source: "graph.png"
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
            source: "user.png"
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
            source: "settings.png"
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
            source: "exit.png"
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
