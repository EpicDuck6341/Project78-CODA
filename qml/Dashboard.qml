import QtQuick 2.0
import QtQuick 6.2
import QtQuick.Window 6.2
import QtQuick.Controls 2.15


Rectangle {
    id: page
    width: 1920
    height: 1080
    color: classA.getColourComponent(0)

    function newUser(){
        if(addUsername.text === "" || addPassword.text === ""){
            errorText.text = "One or more fields empty"
        }
        classA.addNewUser(addUsername.text,addPassword.text)
        addUsername.clear()
        addPassword.clear()
        errorText.text = "User inserted"
        classA.logUserAction(classA.getCurrentUser(),"Logged new user")
    }

    function newRocket(){
        if(addRocketName.text === "" || addCommandName.text === "" ||addCommandData.text === ""){
            errorText.text = "One or more fields empty"
        }
        classA.addNewRocket(addRocketName.text,addCommandName.text,addCommandData.text)
        addCommandName.clear()
        addCommandData.clear()
        errorText.text = "Rocket inserted"
        classA.logUserAction(classA.getCurrentUser(),"Added new rocket")
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

        Text{
            text: "Add new user to Database"
            font.family: "Montserrat"
            font.pixelSize: 26
            color: classA.getColourComponent(4)
            anchors.horizontalCenter: parent.horizontalCenter
            y:140
        }

        Text{
            id: errorText
            text: ""
            font.family: "Montserrat"
            font.pixelSize: 18
            color: classA.getColourComponent(4)
            anchors.horizontalCenter: parent.horizontalCenter
            y:90
        }

        TextField {
            id: addUsername
            x: 250
            y: 180
            width: 210
            height: 45
            opacity: 1
            placeholderText: "Username"
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

        TextField {
            id: addPassword
            anchors.horizontalCenter: parent.horizontalCenter
            y: 180
            width: 210
            height: 45
            opacity: 1
            placeholderText: "Password"
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
            id: generateUser
            flat: false // set to false to show the button border and background
            x: 750
            y: 180
            width: 250
            height: 45
            text: qsTr("Add new user")
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
            onClicked: newUser()
        }

        Text{
            text: "Add new rocket to Database"
            font.family: "Montserrat"
            font.pixelSize: 26
            color: classA.getColourComponent(4)
            anchors.horizontalCenter: parent.horizontalCenter
            y:300
        }

        TextField {
            id: addRocketName
            x: 250
            y: 340
            width: 210
            height: 45
            opacity: 1
            placeholderText: "Rocket Name"
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

        TextField {
            id: addCommandName
            anchors.horizontalCenter: parent.horizontalCenter
            y: 340
            width: 210
            height: 45
            opacity: 1
            placeholderText: "Command Name"
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

        TextField {
            id: addCommandData
            x: 750
            y: 340
            width: 210
            height: 45
            opacity: 1
            placeholderText: "Command Data"
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
            id: generateRocket
            flat: false // set to false to show the button border and background
            anchors.horizontalCenter: parent.horizontalCenter
            y: 410
            width: 250
            height: 45
            text: qsTr("Add new rocket")
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
            onClicked: newRocket()
        }

        Row {
            anchors {
                top: parent.top
                horizontalCenter: parent.horizontalCenter
                margins: 30
            }

            Image {
                source:  classA.getPath("../assets/dashboard")
                width: 40
                height: 40
                opacity: 0.8
            }

            Text {
                text: "Dashboard"
                font.family: "Montserrat"
                font.pixelSize: 32
                color: classA.getColourComponent(4)
            }
        }


    }
}


