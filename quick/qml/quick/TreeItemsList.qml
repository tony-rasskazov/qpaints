import QtQuick 2.4

Column{

    Repeater{
        model:  modelData.childItems

        delegate: Row {

            id: row
            focus: true

            /*
            MouseArea {
                anchors.fill: parent
                onClicked: modelData.selected = !modelData.selected;
                hoverEnabled: true

            }
            */

            Rectangle {
                width: 20
                height: 20
                border.color: modelData.color
                color: modelData.selected ? "blue" : "white"

                radius: 5
                Text {
                    anchors.fill: parent
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    text: modelData.hasChild? modelData.isOpen ? "-" : "+" : ""
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: modelData.isOpen = !modelData.isOpen;
                    hoverEnabled: true

                }
            }
            /*
            Text{
                height: 20
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                text: " " + modelData.level + " "
            }
            */
            Column {
                focus: true
                Text {
                    height: 20
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    text: modelData.content
                    MouseArea {
                        anchors.fill: parent
                        onClicked: modelData.selected = !modelData.selected;
                        hoverEnabled: true

                    }
                }

                Loader{
                    source: modelData.isOpen ? "TreeItemsList.qml" : "Empty.qml"
                }

            }
        }
    }

    /*
    Text {
        id: text1
        x: 40
        y: 31
        text: qsTr("Text")
        font.pixelSize: 12
    }
    */
}
