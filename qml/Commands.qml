import QtQuick 2.0
import QtQuick 6.2
import QtQuick.Window 6.2
import QtQuick.Controls 2.15



Page{

    function getRocket(index){
        if(index===0) {
            classA.setButtonState(false)
            classA.findCommands("rocketA")
            switchPage("Commands.qml")
        }
        if(index===1) {
            classA.setButtonState(false)
            classA.findCommands("rocketB")
            switchPage("Commands.qml")
        }
        if(index===2) {
            classA.setButtonState(false)
            classA.findCommands("rocketC")
            switchPage("Commands.qml")
        }
    }

    Rectangle {
    id: page
    width: 1920
    height: 1080
    color: classA.getColourComponent(0)

    Loader {
                id: sideBar
                source: "SideBar.qml"
            }

    Text {
        id: loginText
        x: 900
        y: 450
        text: qsTr("Commands")
        font.pixelSize: 48
        horizontalAlignment: Text.AlignHCenter
    }


       ComboBox {
           Text {
               id: text
               text: qsTr("Choose Rocket")
               font.pixelSize: 24

               x: -200

           }
           y:50
           x:465
           width: 100
           height: 30

           textRole: "text"
           valueRole: "value"
           currentIndex: classA.getCurrentIndex()
           // When an item is selected, update the backend.
           onActivated: classA.setCurrentIndex(currentIndex), getRocket(currentIndex)



           model: [
               { value: 1, text: qsTr("       rocketA") },
               { value: 2, text: qsTr("       rocketB") },
               { value: 3, text: qsTr("       rocketC"), }
           ]
           background: Rectangle {

                     color: "white"
                      border.width: 1
                      border.color: "gray"
                      radius: 3
                  }
       }




    DelayButton {
        id: control
        text: qsTr("Activate")
        checked: classA.getButtonState()
        x:460
        y:150
        Text {
            id: text1
            text: classA.getCommandName(0)
            font.pixelSize: 24

            x: -200
            y:35

        }
        contentItem: Text {
            text: control.text
            font: control.font
            opacity: enabled ? 1.0 : 0.3
            color: "black"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
        }

        background: Rectangle {
            implicitWidth: 100
            implicitHeight: 100
            opacity: enabled ? 1 : 0.3
            color: control.down ? "grey" : "white"
            radius: size / 2

            readonly property real size: Math.min(control.width, control.height)
            width: size
            height: size
            anchors.centerIn: parent

            Canvas {
                id: canvas
                anchors.fill: parent

                Connections {
                    target: control
                    function onProgressChanged() { canvas.requestPaint(); }
                }

                onPaint: {
                    var ctx = getContext("2d")
                    ctx.clearRect(0, 0, width, height)
                    ctx.strokeStyle = "green"
                    ctx.lineWidth = parent.size / 8
                    ctx.beginPath()
                    var startAngle = Math.PI / 5 * 3
                    var endAngle = startAngle + control.progress * Math.PI / 5 * 9
                    ctx.arc(width / 2, height / 2, width / 2 - ctx.lineWidth / 2 - 2, startAngle, endAngle)
                    ctx.stroke()
                }
            }
        }
        onActivated: {
                        classA.setButtonState(true)
                    }
        onClicked:{
            console.log("dsds")
        }
    }
    DelayButton {
        id: control2
        text: qsTr("Activate")
        checked: classA.getButtonState()
        x: 460
        y: 300
        Text {
            id: tex2
            text: classA.getCommandName(1)
            font.pixelSize: 24

            x: -200
            y:35

        }
        contentItem: Text {
            text: control2.text
            font: control2.font
            opacity: enabled ? 1.0 : 0.3
            color: "black"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
        }

        background: Rectangle {
            implicitWidth: 100
            implicitHeight: 100
            opacity: enabled ? 1 : 0.3
            color: control2.down ? "grey" : "white"
            radius: size / 2

            readonly property real size: Math.min(control2.width, control2.height)
            width: size
            height: size
            anchors.centerIn: parent

            Canvas {
                id: canvas2
                anchors.fill: parent

                Connections {
                    target: control2
                    function onProgressChanged() { canvas2.requestPaint(); }
                }

                onPaint: {
                    var ctx = getContext("2d")
                    ctx.clearRect(0, 0, width, height)
                    ctx.strokeStyle = "green"
                    ctx.lineWidth = parent.size / 8
                    ctx.beginPath()
                    var startAngle = Math.PI / 5 * 3
                    var endAngle = startAngle + control2.progress * Math.PI / 5 * 9
                    ctx.arc(width / 2, height / 2, width / 2 - ctx.lineWidth / 2 - 2, startAngle, endAngle)
                    ctx.stroke()
                }
            }
        }
        onActivated: {
                        classA.setButtonState(true)
                    }
    }
    DelayButton {
        id: control3
        text: qsTr("Activate")
        checked: classA.getButtonState()
        x: 460
        y: 450
        Text {
            id: text3
            text:classA.getCommandName(2)
            font.pixelSize: 24
            x: -200
            y:35

        }
        contentItem: Text {
            text: control3.text
            font: control3.font
            opacity: enabled ? 1.0 : 0.3
            color: "black"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
        }

        background: Rectangle {
            implicitWidth: 100
            implicitHeight: 100
            opacity: enabled ? 1 : 0.3
            color: control3.down ? "grey" : "white"
            radius: size / 2

            readonly property real size: Math.min(control3.width, control3.height)
            width: size
            height: size
            anchors.centerIn: parent

            Canvas {
                id: canvas3
                anchors.fill: parent

                Connections {
                    target: control3
                    function onProgressChanged() { canvas3.requestPaint(); }
                }

                onPaint: {
                    var ctx = getContext("2d")
                    ctx.clearRect(0, 0, width, height)
                    ctx.strokeStyle = "green"
                    ctx.lineWidth = parent.size / 8
                    ctx.beginPath()
                    var startAngle = Math.PI / 5 * 3
                    var endAngle = startAngle + control3.progress * Math.PI / 5 * 9
                    ctx.arc(width / 2, height / 2, width / 2 - ctx.lineWidth / 2 - 2, startAngle, endAngle)
                    ctx.stroke()
                }
            }
        }
        onActivated: {
                        classA.setButtonState(true)
                    }
    }
    DelayButton {
        id: control4
        checked: classA.getButtonState()
        text: qsTr("Activate")
        x: 460
        y: 600
        Text {
            id: text4
            text: classA.getCommandName(3)
            font.pixelSize: 24

            x: -200
            y:35

        }
        contentItem: Text {
            text: control4.text
            font: control4.font
            opacity: enabled ? 1.0 : 0.3
            color: "black"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
        }

        background: Rectangle {
            implicitWidth: 100
            implicitHeight: 100
            opacity: enabled ? 1 : 0.3
            color: control4.down ? "grey" : "white"
            radius: size / 2

            readonly property real size: Math.min(control4.width, control4.height)
            width: size
            height: size
            anchors.centerIn: parent

            Canvas {
                id: canvas4
                anchors.fill: parent

                Connections {
                    target: control4
                    function onProgressChanged() { canvas4.requestPaint(); }
                }

                onPaint: {
                    var ctx = getContext("2d")
                    ctx.clearRect(0, 0, width, height)
                    ctx.strokeStyle = "green"
                    ctx.lineWidth = parent.size / 8
                    ctx.beginPath()
                    var startAngle = Math.PI / 5 * 3
                    var endAngle = startAngle + control4.progress * Math.PI / 5 * 9
                    ctx.arc(width / 2, height / 2, width / 2 - ctx.lineWidth / 2 - 2, startAngle, endAngle)
                    ctx.stroke()
                }
            }
        }
        onActivated: {
                        classA.setButtonState(true)
                    }
    }
    DelayButton {
        id: control5
        text: qsTr("Activate")
        checked: classA.getButtonState()
        x: 460
        y: 750
        Text {
            id: text5
            text:classA.getCommandName(4)
            font.pixelSize: 24

            x: -200
            y:35


        }
        contentItem: Text {
            text: control5.text
            font: control5.font
            opacity: enabled ? 1.0 : 0.3
            color: "black"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
        }

        background: Rectangle {
            implicitWidth: 100
            implicitHeight: 100
            opacity: enabled ? 1 : 0.3
            color: control5.down ? "grey" : "white"
            radius: size / 2

            readonly property real size: Math.min(control5.width, control5.height)
            width: size
            height: size
            anchors.centerIn: parent

            Canvas {
                id: canvas5
                anchors.fill: parent

                Connections {
                    target: control5
                    function onProgressChanged() { canvas5.requestPaint(); }
                }

                onPaint: {
                    var ctx = getContext("2d")
                    ctx.clearRect(0, 0, width, height)
                    ctx.strokeStyle = "green"
                    ctx.lineWidth = parent.size / 8
                    ctx.beginPath()
                    var startAngle = Math.PI / 5 * 3
                    var endAngle = startAngle + control5.progress * Math.PI / 5 * 9
                    ctx.arc(width / 2, height / 2, width / 2 - ctx.lineWidth / 2 - 2, startAngle, endAngle)
                    ctx.stroke()
                }
            }
        }
        onActivated: {
                        classA.setButtonState(true)
                    }
    }


}
}



