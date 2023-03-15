import QtQuick 2.0
import QtQuick 6.2
import QtQuick.Window 6.2
import QtQuick.Controls 2.15


Page{
    //Function voor wisselen van page
    function switchPage(page) {

        // Laad het object van een page in een variabele
        var pageObject = Qt.createComponent(page)

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
            console.log("Error loading component:", page1Object.errorString())
        }
    }
    Rectangle {
    id: page2
    width: 1920
    height: 1080
    color: "#e5e6eb"

    Loader {
                id: sideBar
                source: "SideBar.qml"
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
        onClicked: switchPage("LoginPage.qml")
    }
}

}

