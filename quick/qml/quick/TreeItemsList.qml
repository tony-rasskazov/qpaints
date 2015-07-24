import QtQuick 2.4

Column{
    Repeater{
        model: modelData.childItems
        delegate: Row{
            Text{
                width: 20
                height: 20
                text: modelData.hasChild? modelData.isOpen ? "1-" : "1+" : "1>"
                MouseArea{
                    anchors.fill: parent
                    onClicked: modelData.isOpen = !modelData.isOpen;
                }
            }
            Column{
                Text{ text: modelData.content }
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
