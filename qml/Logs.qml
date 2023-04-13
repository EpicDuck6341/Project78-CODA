import QtQuick 2.0
import QtQuick 6.2
import QtQuick.Window 6.2
import QtQuick.Controls 2.15


Page{
    Rectangle {
    id: page2
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
        text: qsTr("Logs")
        font.pixelSize: 48
        horizontalAlignment: Text.AlignHCenter
    }

    ListModel {
           id: users
           ListElement { name: "Users"; isExpanded: false; type: "parent"}
           ListElement { name: "user1"; isExpanded: false; type: "Users"}
           ListElement { name: "user2"; isExpanded: false; type: "Users"}
           ListElement { name: "user3"; isExpanded: false; type: "Users"}
       }

       ListView {
           id: listing
           x:1300
           y:300
           width: 181
           height: parent.height
           model: users

           delegate: listdelegate
       }

       Component {
           id: listdelegate

           Rectangle {
               id: menuItem
               width: 181
               height: type === "parent" ? 55 : 0
               color: type === "parent" ? "navajowhite" : "navajowhite"
               border.width: 1

               states: State {
                   name: "expanded"
                   when: isExpanded
                   PropertyChanges {
                       target: menuItem
                       height: 55
                   }
               }

               transitions:[
                   Transition {
                       from: ""
                       to: "expanded"
                       reversible: true
                       SequentialAnimation {
                           PropertyAnimation { property: "height"; duration: 200 }
                       }
                   }
               ]

               Text {
                   id: text
                   text: name
                   clip: true
                   anchors.fill: parent
                   font.family: "Roboto"
                   font.pointSize: 20
               }

               MouseArea {
                   function expand(isExpanded) {
                       for(var i = 0; i < users.count; ++i) {
                           var user = users.get(i)

                           if(user.type === name) {
                               user.isExpanded = isExpanded
                           }
                       }
                   }

                   anchors.fill: parent
                   onClicked: {
                       if (type == "Users"){
                           console.log(name)
                       }

                       if (type == "parent") {
                           if (isExpanded == false) {
                               // expand
                               expand(true)
                           }
                           else {
                               // collapse
                               expand(false)
                           }

                           isExpanded = !isExpanded
                       }
                   }
               }
           }
       }
}

}

