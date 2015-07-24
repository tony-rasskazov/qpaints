import QtQuick 2.4

Column{

    Repeater{
        //model:  modelData.childItems
        model:  modelData.childItems

        delegate: Row {

            Rectangle {
                width: 20
                height: 20
                border.color: modelData.color
                color: "white"
                radius: 4
                Text{
                    anchors.fill: parent
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    text: modelData.hasChild? modelData.isOpen ? "-" : "+" : ""
                }

                MouseArea{
                    anchors.fill: parent
                    onClicked: modelData.isOpen = !modelData.isOpen;
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
                Text{
                    height: 20
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    text: modelData.content
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
