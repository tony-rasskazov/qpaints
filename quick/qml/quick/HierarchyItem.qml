import QtQuick 2.4

Rectangle {
    id: rectangle1
    width: 100
    height: 62
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

    HierarchyItemChilds {
        model: modelData.childItems
        x: 8
        y: 29
        width: 84
        height: 20

    }
}

