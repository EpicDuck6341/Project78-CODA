import QtQuick 2.0
import QtQuick 6.2
import QtQuick.Window 6.2
import QtQuick.Controls 2.15




Page{
    function switchPage(pageInput) {

        // Laad het object van een page in een variabele
        var pageObject = Qt.createComponent(pageInput)

        // Check of het object succesvol is gemaakt
        if (pageObject.status === Component.Ready) {
            // Haal het object op uit de creatiecomponent
            var page = pageObject.createObject(stackView)

            // Als het object succesvol is gemaakt, ga naar de tweede pagina
            if (page !== null) {
                stackView.push(page)
            } else {
                console.log("Error creating object from component")
            }
        } else {
            console.log("Error loading component:", pageObject.errorString())
        }
    }
    Rectangle {
        id: page1
        width: 1920
        height: 1080
        Image {
            id: image
            x: 0
            y: 0
            width: 1937
            height: 1091
            source: "blue.jpg"
            sourceSize.height: 1080
            sourceSize.width: 1920
            fillMode: Image.PreserveAspectFit
        }

        Text {
            id: loginText
            x: 900
            y: 450
            text: qsTr("Login")
            font.pixelSize: 48
            horizontalAlignment: Text.AlignHCenter
        }

        //Button voor Username en Password submitten
        Button {
            id: submitButton
            x: 920
            y: 645
            width: 80
            text: "Submit"
            onClicked: switchPage("Dashboard.qml")
        }

        //Connect with database and insert row
        Button {
            id: databaseButton
            x: 920
            y: 700
            width: 80
            text: "Connect"
            onClicked: classA.connectDB()
        }


        //Textfield voor de Username
        TextField {
            id: loginFieldUser
            x: 859
            y: 536
            width: 200
            height: 37
            placeholderText: qsTr("Username")

            function readInput() {
                var input = loginFieldUser.text
                loginFieldUser.clear()
                return input
            }
        }

        //Textfield voor de Password
        TextField {
            id: loginFieldPass
            x: 859
            y: 587
            width: 200
            height: 37
            horizontalAlignment: Text.AlignLeft
            placeholderText: qsTr("Password")

            function readInput() {
                var input = loginFieldPass.text
                loginFieldPass.clear()
                return input
            }
        }
    }
}


