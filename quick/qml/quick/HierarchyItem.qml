import QtQuick 2.4

Rectangle {
    id: rectangle1
    width: 200
    height: 200
    color: "gray"
    border.color: "black"

    Text {
        id: text1
        text: modelData.content
        anchors.top: parent.top
        anchors.topMargin: 8
        anchors.left: parent.left
        anchors.leftMargin: 8
        font.pixelSize: 12
    }

    Text {
        text: "1"
        anchors.fill: parent
    }

    Column{
        Text{ text: modelData.content }
        Loader{
            source: modelData.hasChild ? "HierarchyItemChilds.qml" : "Empty.qml"
        }
    }

    /*
    HierarchyItemChilds {
        model: modelData.childItems
        delegate: HierarchyItemChild { }
        x: 8
        y: 29
        width: 84
        height: 20

    }
    */

}

