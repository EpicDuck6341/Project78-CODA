import QtQuick 2.0
import QtQuick 6.2
import QtQuick.Window 6.2
import QtQuick.Controls 2.15




Page{

    function switchPage(pageInput) { //Function for switching pages with path to .qml file as parameter
        // Laad het object van een page in een variabele
        var pageObject = Qt.createComponent(pageInput)


        // Check of het object succesvol is gemaakt
        if (pageObject.status === Component.Ready) {
            // Haal het object op uit de creatiecomponent
            var page = pageObject.createObject(stackView)

            // Als het object succesvol is gemaakt, ga naar de tweede pagina
            if (page !== null) {
                stackView.clear()
                stackView.push(page)
            } else {
                console.log("Error creating object from component")
            }
        } else {
            console.log("Error loading component:", pageObject.errorString())
        }
    }

    function checkLogin(){ //Checks if login is filled in, then checks if it matches in the database
        if(classA.getUserLogin(usernameInput.text,passwordInput.text)===true){
            switchPage("Dashboard.qml")
            classA.setCurrentUser(usernameInput.text)
            classA.logUserAction(classA.getCurrentUser(),"Logged in")
        }
        else{
        usernameInput.clear()
        passwordInput.clear()
        errorMessage.text = "Username and/or password are wrong"
    }
    }


    Rectangle {

        id: rectangle
        width: 1920
        height: 1080
        color: "#F5F5F5"
        property alias roundedRectBordercolor: roundedRect.border.color

        Image {
            id: imageBG
            anchors.horizontalCenter: parent.horizontalCenter
            width: 1920
            height: 1080
            source: classA.getPath("../assets/background")
        }


        Rectangle {
            id: roundedRect
            anchors.centerIn: parent
            width: 512
            height: 834
            color: classA.getColourComponent(1)
            border.color: classA.getColourComponent(3)
            border.width:  1
            antialiasing: true
            radius: 50


            Image {
                id: image
                anchors.horizontalCenter: parent.horizontalCenter
                y: 95
                width: 238
                height: 216
                source: classA.getPath("../assets/Logo")
                fillMode: Image.PreserveAspectFit
            }

            Text {
                id: errorMessage
                anchors.horizontalCenter: parent.horizontalCenter
                y: 350
                color: "#FF0000"
                font.pixelSize: 18
            }

            TextField {
                id: usernameInput
                onTextChanged: if (length > 15) remove(15, length);
                anchors.horizontalCenter: parent.horizontalCenter
                y: 400
                width: 210
                height: 45
                opacity: 1
                placeholderText: "Username"
                placeholderTextColor: classA.getColourComponent(4)
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
                id: passwordInput
                onTextChanged: if (length > 15) remove(15, length); //Max character limit of 15. Maybe useless
                anchors.horizontalCenter: parent.horizontalCenter
                echoMode: TextInput.Password
                y: 460
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
                id: button
                anchors.horizontalCenter: parent.horizontalCenter
                flat: false
                y: 550
                width: 150
                height: 45
                text: qsTr("Login")
                display: AbstractButton.TextOnly
                background: Rectangle {
                    color: classA.getColourComponent(5)
                    border.width: 2
                    border.color: classA.getColourComponent(5)
                    radius: 10
                }
                font.family: "Roboto"
                font.pointSize: 12
                font.bold: true
                onClicked: checkLogin()
            }
        }
    }
}

