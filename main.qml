import QtQuick 2.6
import QtQuick.Controls 2.0


ApplicationWindow {
    id: root
    width: 1920
    height: 1080
    visible: true

    Loader {
                id: pageLoader1
                source: "/LoginPage.qml"
            }
}
