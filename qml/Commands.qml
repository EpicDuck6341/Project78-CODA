import QtQuick 2.0
import QtQuick 6.2
import QtQuick.Window 6.2
import QtQuick.Controls 2.0
import QtQuick.Controls 2.15


Rectangle {
    id: page
    width: 1920
    height: 1080
    color: classA.getColourComponent(0)

    function lockSequence(){
        if(classA.getButtonSequence()===true){
            classA.setButtonSequence(false)
            seq.text = "Button Sequence unlocked"
        }
        else{
            classA.setButtonSequence(true)
            seq.text = "Button Sequence locked"

        }
    }

    function lockCommands(){
        console.log(classA.getButtonLock())
        errorMessage.text = ""
        if(classA.getLoaderState()===true){
            if(classA.getButtonLock() === true && classA.getButtonState(0)===false){
                classA.setButtonLock(false)
                lock.text = "Unlocked"
                classA.setSearchBarVisible(true)
                classA.setSearchBarVisible(true)
                switchPage("Commands.qml")
            }
            else if(classA.getButtonLock() === true && classA.getButtonState(0)===true){
                errorMessage.text = "Buttons still switched on"
            }

            else{

            classA.setButtonLock(true)
            lock.text = "Locked"
            classA.setSearchBarVisible(false)
            classA.setSearchBarVisible(false)
            switchPage("Commands.qml")
            }
        }
        else{
            errorMessage.text = "No commands to lock in"
        }

    }

    function searchLaunchType(){
        classA.findCommands(launchType.text)
        classA.findCommandData(launchType.text)     

        if(classA.getCommandName(0)!=="error"){
            buttonLoader.active = true
            classA.setLoaderState(true)
            progressBar.value = 0
            switchPage("Commands.qml")
        }
        else{
             buttonLoader.active = false
            classA.setLoaderState(false)
            errorMessage.text = "Rocket not found"
            }
        }

    Image {
        id: imageBG
        anchors.horizontalCenter: parent.horizontalCenter
        width: 1920
        height: 1080
        source: classA.getPath("../assets/background")
    }

    Rectangle{
        anchors.centerIn: parent
        width: 1200
        height: 850
        color: classA.getColourComponent(1)
        radius: 50

        Loader {
            id: sideBar
            source: "SideBar.qml"
        }

        Loader {
            id: buttonLoader
            active: classA.getLoaderState()
            sourceComponent: Grid {
                id:gridLoader
                x: 180
                y: 225
                rows: 8
                columnSpacing: 50
                rowSpacing: 35

                Repeater {
                    id:repeater
                    model: classA.commandVecSize()
                    Switch {
                        id: control
                        checked: classA.getButtonState(index)
                        onToggled: {
                        if(classA.getButtonLock()===true){
                        if(classA.getButtonSequence()===true){
                            if (control.checked) {
                                if(index!==0){
                                    if(classA.getButtonState(index-1)===true){
                                        classA.getCommandData(index);
                                        progressBar.value = progressBar.value +(1.0/classA.commandVecSize())
                                        classA.setBarLevel(progressBar.value)
                                        classA.setButtonState(true,index)
                                        errorMessage.text = ""
                                        classA.logUserAction(classA.getCurrentUser(),"Activated Command: "+(index+1)+"."+" "+classA.getCommandName(index))                                        
                                    }
                                    else{
                                        errorMessage.text =  "Command " + index+ " not done"
                                        control.checked = false
                                    }
                                }
                                else{
                                    errorMessage.text = ""
                                    classA.setButtonState(true,index)
                                    classA.getCommandData(index)
                                    progressBar.value = progressBar.value +(1.0/classA.commandVecSize())
                                    classA.setBarLevel(progressBar.value)
                                    classA.logUserAction(classA.getCurrentUser(),"Activated Command: "+(index+1)+"."+" "+classA.getCommandName(index))
                                }
                            } else {
                                if(classA.commandVecSize() === index-1){
                                    classA.setButtonState(false,index)
                                    progressBar.value = progressBar.value -(1.0/classA.commandVecSize())
                                    classA.setBarLevel(progressBar.value)
                                    errorMessage.text = ""
                                    classA.logUserAction(classA.getCurrentUser(),"Deactivated Command: "+(index+1)+"."+" "+classA.getCommandName(index))
                                }
                                if(classA.getButtonState(index+1)===true){
                                    errorMessage.text =  "Command " + (index+2) + " already in progress"
                                    control.checked = true
                                }
                                else{
                                classA.setButtonState(false,index)
                                progressBar.value = progressBar.value -(1.0/classA.commandVecSize())
                                classA.setBarLevel(progressBar.value)
                                errorMessage.text = ""
                                classA.logUserAction(classA.getCurrentUser(),"Deactivated Command: "+(index+1)+"."+" "+classA.getCommandName(index))
                                }
                            }
                        }
                        else{
                            if(classA.getButtonState(index)===false){
                            classA.setButtonState(true,index)
                            progressBar.value = progressBar.value +(1.0/classA.commandVecSize())
                            }
                            else{
                                classA.setButtonState(false,index)
                                progressBar.value = progressBar.value -(1.0/classA.commandVecSize())
                            }
                        }
                        }
                        else{
                            control.checked = false
                            errorMessage.text = "Commands not locked in yet"
                        }
                    }
                        Text {
                            text: (index+1)+"."+" "+classA.getCommandName(index)
                            font.family: "Montserrat"
                            font.pixelSize: 12
                            color: classA.getColourComponent(4)
                            anchors.horizontalCenter: parent.horizontalCenter
                            y: -15
                        }

                        indicator: Rectangle {
                            implicitWidth: 90
                            implicitHeight: 30
                            x: control.width - width - control.rightPadding
                            y: parent.height / 2 - height / 2
                            radius: 20
                            color: control.checked ? "green" : "red"
                            border.color: "black"

                            Rectangle {
                                id: slideBall
                                x: control.checked ? parent.width - width : 0
                                width: 30
                                height: 30
                                radius: 20
                                border.color: "black"
                            }
                        }
                    }
                }
            }
        }

        Text {
            id: errorMessage
            anchors.horizontalCenter: parent.horizontalCenter
            y: 160
            color: "#FF0000"
            font.pixelSize: 18
        }




        ProgressBar {
            x:750
            anchors.verticalCenter: parent.verticalCenter
            id: progressBar
            value: classA.getBarLevel()
            width: 700
            height: 30
            transform: Rotation {
                   angle: -90
                   origin {
                       x: progressBar.width / 2
                       y: progressBar.height / 2
                   }
               }
        }








TextField {
    id: launchType
    anchors.horizontalCenter: parent.horizontalCenter
    y: 80
    width: 210
    height: 45
    opacity: 1
    placeholderText: "Search Launch Type"
    placeholderTextColor:classA.getColourComponent(4)
    hoverEnabled: true
    horizontalAlignment: Text.AlignHCenter
    verticalAlignment: Text.AlignVCenter
    font.family: "Roboto"
    font.pointSize: 12
    font.bold: true
    visible: classA.getSearchBarVisible()
    background: Rectangle {
        color: "#F5F5F5"
        border.width: 1
        border.color: "#B0BEC5"
        radius: 10
    }
}


Button {
    id: searchButton
    anchors.horizontalCenter: parent.horizontalCenter
    flat: false // set to false to show the button border and background
    y: 130
    width: 150
    height: 30
    text: qsTr("Search")
    display: AbstractButton.TextOnly
    background: Rectangle {
        color: classA.getColourComponent(5) // set the button background color to a muted blue-gray
        border.width: 2
        border.color: classA.getColourComponent(5)
        radius: 10
    }
    font.family: "Roboto"
    font.pointSize: 12
    font.bold: true
    onClicked: searchLaunchType()
    visible: classA.getSearchBarVisible()
}

Button {
    id: lockCommandsButton
    flat: false // set to false to show the button border and background
    y: 77
    x: 220
    width: 200
    height: 50
    text: qsTr("Lock in commands")
    display: AbstractButton.TextOnly
    background: Rectangle {
        color: classA.getColourComponent(5) // set the button background color to a muted blue-gray
        border.width: 2
        border.color: classA.getColourComponent(5)
        radius: 10
    }
    font.family: "Roboto"
    font.pointSize: 12
    font.bold: true
    onClicked: lockCommands()
    Text{
        id: lock
        anchors.horizontalCenter: parent.horizontalCenter
        y:-30
    }
}

Button {
    id: lockButtonSequence
    flat: false // set to false to show the button border and background
    y: 77
    x: 750
    width: 250
    height: 50
    text: qsTr("Change Button Sequence")
    display: AbstractButton.TextOnly
    background: Rectangle {
        color: classA.getColourComponent(5) // set the button background color to a muted blue-gray
        border.width: 2
        border.color: classA.getColourComponent(5)
        radius: 10
    }
    font.family: "Roboto"
    font.pointSize: 12
    font.bold: true
    onClicked: lockSequence()
    Text{
        id: seq
        anchors.horizontalCenter: parent.horizontalCenter
        y:-30
    }
}








        Row {
            anchors {
                top: parent.top
                horizontalCenter: parent.horizontalCenter
                margins: 30
            }

            Image {
                source:  classA.getPath("../assets/command")
                width: 40
                height: 40
                opacity: 0.8
            }

            Text {
                text: "Commands"
                font.family: "Montserrat"
                font.pixelSize: 32
                color: classA.getColourComponent(4)
            }
        }


    }
}



