import QtQuick 2.4

Column{
    Repeater{
        model: modelData.childItems
        delegate: Row{
            Rectangle {
                width: 20
                height: 20
                color: modelData.color
                Text{
                    width: 20
                    height: 20
                    verticalAlignment: Text.verticalAlignment
                    horizontalAlignment: Text.horizontalAlignment
                    anchors.fill: parent
                    text: modelData.hasChild? modelData.isOpen ? "1-" : "1+" : "1"
                }

                MouseArea{
                    anchors.fill: parent
                    onClicked: modelData.isOpen = !modelData.isOpen;
                }
            }

            Column{
                Text{
                    height: 20
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
