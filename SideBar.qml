import QtQuick 2.0

Item{
  id: sideBar
Row {
    x: 30
    y: 30
    Image {
        source: "Logo.png"
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
            source: "dashboardWhite.png"
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
            source: "commandWhite.png"
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
            source: "logsWhite.png"
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
            source: "graphWhite.png"
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
            source: "userWhite.png"
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
            source: "settingsWhite.png"
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
            source: "exitWhite.png"
            width: 60
            height: 60
            MouseArea {
                anchors.fill: parent
                onClicked: switchPage("LoginWhite.qml")
            }
        }
}
}
}
