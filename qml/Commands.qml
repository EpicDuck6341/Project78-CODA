import QtQuick 2.0
import QtQuick 6.2
import QtQuick.Window 6.2
import QtQuick.Controls 2.15



Page{

    function getRocket(index){
        if(index===0) {
            for(var i=0;i<5;i++){
                classA.setButtonState(false,i)
            }
            classA.findCommands("rocketA")
            switchPage("Commands.qml")
        }
        if(index===1) {
            for(var i=0;i<5;i++){
                classA.setButtonState(false,i)
            }
            classA.findCommands("rocketB")
            switchPage("Commands.qml")
        }
        if(index===2) {
            for(var i=0;i<5;i++){
                classA.setButtonState(false,i)
            }

            classA.findCommands("rocketC")
            switchPage("Commands.qml")
        }
    }

    Rectangle {
    id: page
    width: 1920
    height: 1080
    color: classA.getColourComponent(0)
    Rectangle{
        anchors.centerIn: parent
        width: 1000
        height: 800
        color:classA.getColourComponent(1)
        border.color: classA.getColourComponent(3)
        antialiasing: true
        radius: 50
        Rectangle{
            x:160
            width:2
            height:800
            color: classA.getColourComponent(3)
        }


    Loader {
                id: sideBar
                source: "SideBar.qml"
            }


    Text {
        id: loginText
        x:500
        text: qsTr("Commands")
        font.pixelSize: 48
        horizontalAlignment: Text.AlignHCenter
        color :classA.getColourComponent(3)
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
           onActivated: classA.setCurrentIndex(currentIndex),getRocket(currentIndex)



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
           checked: classA.getButtonState(0)
           x:460
           y:125
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
               color: classA.getColourComponent(1)
               horizontalAlignment: Text.AlignHCenter
               verticalAlignment: Text.AlignVCenter
               elide: Text.ElideRight
           }

           background: Rectangle {
               implicitWidth: 65
               implicitHeight: 65
               opacity: enabled ? 1 : 0.3
               color: control.down ? "grey" : classA.getColourComponent(3)
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
           property var startTime: null

               onPressed: {
                   startTime = new Date();
               }

               onReleased: {
                   if (startTime !== null) {
                       var endTime = new Date();
                       var duration = endTime.getTime() - startTime.getTime();
                       if(duration >= 300){
                            classA.setButtonState(true,0)
                       }
                       else{
                            classA.setButtonState(false,0)
                       }

                       startTime = null;
                   }
               }
       }


    DelayButton {
        id: control2
        text: qsTr("Activate")
        checked: classA.getButtonState(1)
        x: 460
        y: 200
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
            color: classA.getColourComponent(1)
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
        }

        background: Rectangle {
            implicitWidth: 65
            implicitHeight: 65
            opacity: enabled ? 1 : 0.3
            color: control2.down ? "grey" : classA.getColourComponent(3)
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
        property var startTime: null

            onPressed: {
                startTime = new Date();
            }

            onReleased: {
                if (startTime !== null) {
                    var endTime = new Date();
                    var duration = endTime.getTime() - startTime.getTime();
                    if(duration >= 300){
                         classA.setButtonState(true,0)
                    }
                    else{
                         classA.setButtonState(false,0)
                    }

                    startTime = null;
                }
            }
    }
    DelayButton {
        id: control3
        text: qsTr("Activate")
        checked: classA.getButtonState(2)
        x: 460
        y: 275
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
            color: classA.getColourComponent(1)
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
        }

        background: Rectangle {
            implicitWidth: 65
            implicitHeight: 65
            opacity: enabled ? 1 : 0.3
            color: control3.down ? "grey" : classA.getColourComponent(3)
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
        property var startTime: null

            onPressed: {
                startTime = new Date();
            }

            onReleased: {
                if (startTime !== null) {
                    var endTime = new Date();
                    var duration = endTime.getTime() - startTime.getTime();
                    if(duration >= 300){
                         classA.setButtonState(true,0)
                    }
                    else{
                         classA.setButtonState(false,0)
                    }

                    startTime = null;
                }
            }
    }

    DelayButton {
        id: control4
        checked: classA.getButtonState(3)
        text: qsTr("Activate")
        x: 460
        y: 350
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
            color:classA.getColourComponent(1)
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
        }

        background: Rectangle {
            implicitWidth: 65
            implicitHeight: 65
            opacity: enabled ? 1 : 0.3
            color: control4.down ? "grey" : classA.getColourComponent(3)
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
        property var startTime: null

            onPressed: {
                startTime = new Date();
            }

            onReleased: {
                if (startTime !== null) {
                    var endTime = new Date();
                    var duration = endTime.getTime() - startTime.getTime();
                    if(duration >= 300){
                         classA.setButtonState(true,0)
                    }
                    else{
                         classA.setButtonState(false,0)
                    }

                    startTime = null;
                }
            }
    }
    DelayButton {
        id: control5
        text: qsTr("Activate")
        checked: classA.getButtonState(4)
        x: 460
        y:425
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
            color: classA.getColourComponent(1)
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
        }

        background: Rectangle {
            implicitWidth: 65
            implicitHeight: 65
            opacity: enabled ? 1 : 0.3
            color: control5.down ? "grey" :classA.getColourComponent(3)
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
        property var startTime: null

            onPressed: {
                startTime = new Date();
            }

            onReleased: {
                if (startTime !== null) {
                    var endTime = new Date();
                    var duration = endTime.getTime() - startTime.getTime();
                    if(duration >= 300){
                         classA.setButtonState(true,0)
                    }
                    else{
                         classA.setButtonState(false,0)
                    }

                    startTime = null;
                }
            }
    }
}

}
}




