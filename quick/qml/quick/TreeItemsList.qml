import QtQuick 2.4

Column{
    Repeater{
        model: modelData.childItems
        delegate: Row{
            Text{
                width: 20
                height: 20
                text: modelData.hasChild? modelData.isOpen ? "-" : "+" : ""
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
}
