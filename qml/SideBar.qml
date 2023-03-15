import QtQuick 2.0

Item{
  id: sideBar
Row {
    x: 30
    y: 30
    Image {
        source: "../assets/Logo.png"
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
            source: "../assets/dashboardWhite.png"
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
            source: "../assets/commandWhite.png"
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
            source: "../assets/logsWhite.png"
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
            source: "../assets/graphWhite.png"
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
            source: "../assets/userWhite.png"
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
            source: "../assets/settingsWhite.png"
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
            source: "../assets/exitWhite.png"
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
