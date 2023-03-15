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
        id: rectangle
        width: 1920
        height: 1080
        color: "#3b3a4a"
        property alias roundedRectBordercolor: roundedRect.border.color


         Rectangle {
            id: roundedRect
            anchors.centerIn: parent
            width: 512
            height: 834
            color: "#161626"
            border.color: "#161626"
            antialiasing: true
            radius: 50


            Image {
                id: image
                anchors.horizontalCenter: parent.horizontalCenter
                y: 95
                width: 238
                height: 216
                source: "Logo.png"
                fillMode: Image.PreserveAspectFit
            }

            TextField {
                id: usernameInput
                anchors.horizontalCenter: parent.horizontalCenter
                y: 400
                width: 210
                height: 45
                opacity: 1
                placeholderText: "Username"
                placeholderTextColor: "#0d0d0d"
                hoverEnabled: true
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.family: "Roboto"
                font.pointSize: 12
                font.bold: true
                background: Rectangle {
                    color: "#d9d9d9"
                    border.width: 2
                    border.color: "#161626"
                    radius: 10
                }
            }

            TextField {
                id: passwordInput
                anchors.horizontalCenter: parent.horizontalCenter
                y: 460
                width: 210
                height: 45
                opacity: 1
                placeholderText: "Password"
                placeholderTextColor: "#0d0d0d"
                hoverEnabled: true
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.family: "Roboto"
                font.pointSize: 12
                font.bold: true
                background: Rectangle {
                    color: "#d9d9d9"
                    border.width: 2
                    border.color: "#161626"
                    radius: 10
                }
            }

            Button {
                            id: button
                            anchors.horizontalCenter: parent.horizontalCenter
                            flat: true
                            y: 550
                            width: 150
                            height: 45
                            text: qsTr("Login")
                            display: AbstractButton.TextOnly
                            background: Rectangle {
                                color: "#a0a0a0"
                                border.width: 2
                                border.color: "#161626"
                                radius: 10
                            }
                            font.family: "Roboto"
                            font.pointSize: 12
                            font.bold: true
                            onClicked: switchPage("Dashboard.qml")
                        }
        }
    }

}


