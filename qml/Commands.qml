import QtQuick 2.0
import QtQuick 6.2
import QtQuick.Window 6.2
import QtQuick.Controls 2.0


Rectangle {
    id: page
    width: 1920
    height: 1080
    color: classA.getColourComponent(0)

    function searchLaunchType(){


        if(launchType.text===""){
            return
        }
        else{
        classA.findCommands(launchType.text)
        console.log(classA.getCommandName(0))
        if(classA.getCommandName(0)!=="error"){
            console.log("hoi")
        }
        else{
            console.log("doei")
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

        Loader {
            id: buttonLoader
            active: false
            sourceComponent: Grid {
                x: 180
                y: 90
                rows: 8
                spacing: 35

                Repeater {
                    model: 30
                    Switch {
                        id: control
                        Text {
                            text: "Commands"
                            font.family: "Montserrat"
                            font.pixelSize: 12
                            color: classA.getColourComponent(4)
                            anchors.horizontalCenter: parent.horizontalCenter
                            y: -15
                        }

                        indicator: Rectangle {
                            implicitWidth: 90
                            implicitHeight: 30
                            x: control.width - width - control.rightPadding
                            y: parent.height / 2 - height / 2
                            radius: 20
                            color: control.checked ? "green" : "red"
                            border.color: "black"

                            Rectangle {
                                x: control.checked ? parent.width - width : 0
                                width: 30
                                height: 30
                                radius: 20
                                border.color: "black"
                            }
                        }
                    }
                }
            }
        }






TextField {
    id: launchType
    anchors.horizontalCenter: parent.horizontalCenter
    y: 340
    width: 210
    height: 45
    opacity: 1
    placeholderText: "Search Launch Type"
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
    y: 420
    width: 150
    height: 45
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
    onClicked: searchLaunchType()
}








        Row {
            anchors {
                top: parent.top
                horizontalCenter: parent.horizontalCenter
                margins: 30
            }

            Image {
                source:  classA.getPath("../assets/command")
                width: 40
                height: 40
                opacity: 0.8
            }

            Text {
                text: "Commands"
                font.family: "Montserrat"
                font.pixelSize: 32
                color: classA.getColourComponent(4)
            }
        }


    }
}



