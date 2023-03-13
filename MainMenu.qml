import QtQuick 2.0
import QtQuick 6.2
import QtQuick.Window 6.2
import QtQuick.Controls 2.15


Page{
    Rectangle {
    id: page2
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
        text: qsTr("Pagina Twee")
        font.pixelSize: 48
        horizontalAlignment: Text.AlignHCenter
    }
    //Button om naar de inlog pagina te gaan
    Button {
        id: submitButton
        x: 920
        y: 645
        width: 80
        text: "Submit"

        //Function voor SubmitButton
        function submitButtonClicked() {

            // Laad het object van Page2.qml in een variabele
            var page1Object = Qt.createComponent("LoginPage.qml")

            // Check of het object succesvol is gemaakt
            if (page1Object.status === Component.Ready) {
                // Haal het object op uit de creatiecomponent
                var page1 = page1Object.createObject(stackView)

                // Als het object succesvol is gemaakt, ga naar de tweede pagina
                if (page1 !== null) {
                    stackView.push(page1)
                } else {
                    console.log("Error creating object from component")
                }
            } else {
                console.log("Error loading component:", page1Object.errorString())
            }
        }

        onClicked: submitButtonClicked()
    }
}
}

