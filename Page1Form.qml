import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15

Page {
    id: page
    width: 600
    height: 400

    header: Rectangle {
        height: 40;  width: parent.width
        color: Material.background
        Label {
            text: "Page 2"
            font.pixelSize: Qt.application.font.pixelSize * 2
            padding: 10

        }
        Switch {
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            text: "Theme"
            checked: true
            onCheckedChanged: window.Material.theme = checked ? Material.Dark : Material.Light
        }
    }

    CharFonts { id: charFonts }
    FontLoader { id: iconFont; source: "MaterialIcons-Regular.ttf" }

//    Label {
//        text: qsTr("You are on Page 2.")
//        anchors.centerIn: parent
//    }

    GridView {
        id: grid
        anchors.fill: parent
        anchors.margins: 5
        anchors.leftMargin: 10
        cellHeight: 90
        cellWidth: 90

        model: charFonts.icons

        ScrollIndicator.vertical: ScrollIndicator { }

        currentIndex: -1
//        highlightFollowsCurrentItem: true
//        focus: false
//        highlight: Rectangle {
//             width: grid.cellWidth; height: grid.cellHeight
//             color: "lightsteelblue"; radius: 5
//             x: grid.currentItem.x
//             y: grid.currentItem.y
//             Behavior on x { SpringAnimation { spring: 3; damping: 0.2 } }
//             Behavior on y { SpringAnimation { spring: 3; damping: 0.2 } }
//        }

        delegate: ItemDelegate { // Rectangle {
            id: rect
            readonly property real _scale: 0.9
            height: grid.cellHeight * _scale; width: grid.cellWidth * _scale

            ToolTip.visible: _mouse.containsMouse
            ToolTip.delay: 1000
            ToolTip.text: model.icon



            MouseArea {
                id: _mouse
                anchors.fill: rect
                hoverEnabled: true

                // onEntered: { console.log("onEntered: " + model.icon); }
                // onExited:  { console.log("onExited:  " + model.icon); }
            }

//            Rectangle {
//                anchors.fill: parent
//                radius: 5
//                color: Qt.lighter("Grey")
//                //anchors.margins: 5
//            }

            Label { //Text {
                anchors.bottom: rect.bottom
                padding: 5
                font.pixelSize: 14
                //color: "DarkBlue"
                text: model.icon

                width: parent.width
                anchors.horizontalCenter: parent.horizontalCenter
                horizontalAlignment: Text.horizontalAlignment
                elide: Text.ElideRight
            }

            Label {
                id: _icon
                font.family: iconFont.name

                text: model.text
                color: "Teal"

                font.pixelSize: rect.width * 0.6
                height: rect.width * 0.6
                anchors.top: rect.top
                anchors.topMargin: 5
                anchors.horizontalCenter: parent.horizontalCenter
            }

        } // delegate

        //onWidthChanged: { grid.columns = grid.width / grid.cellWidth; }

    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.9}
}
##^##*/
