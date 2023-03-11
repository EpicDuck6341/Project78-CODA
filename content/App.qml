import QtQuick 6.2
import QtQuick.Window 6.2
import QtQuick.Controls 2.15

Window {
    width: 1920
    height: 1080
    visible: true
    title: "Project78"

    // Voeg een StackView toe
    StackView {
        id: stackView
        initialItem: page1
        anchors.fill: parent

        // Definieer de eerste pagina
        Rectangle {
            id: page1
            width: 1920
            height: 1080
            color: "#06d3f5"

            Image {
                id: image
                x: 0
                y: 0
                width: 1937
                height: 1091
                source: "../../csm_TU Blauw_8b7e803723.jpg"
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
                //Function voor SubmitButton
                function submitButtonClicked() {
                    var username = loginFieldUser.readInput()
                    var password = loginFieldPass.readInput()

                    // Ga naar de tweede pagina
                    stackView.pop(page1)
                    stackView.push(page2)

                }
                onClicked: submitButtonClicked()
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

        // Definieer de tweede pagina
        Rectangle {
            id: page2
            color: "lightgreen"
            Text {
                text: "Dit is pagina 2"
//                anchors.centerIn: parent
            }
        }
    }







}
