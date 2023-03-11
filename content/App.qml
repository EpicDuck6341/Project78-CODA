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
        anchors.fill: parent

        // Definieer de eerste pagina
        Loader {
            id: pageLoader1
            source: "pages/Page1.qml"
        }
    }
}
