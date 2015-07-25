import QtQuick 2.4

Rectangle {
    id: rectangle1
    width: 200
    height: 30
    color: "gray"
    border.color: "black"

    Text {
        id: text1
        text: modelData.content
        anchors.top: parent.top
        anchors.topMargin: 1
        anchors.left: parent.left
        anchors.leftMargin: 1
        font.pixelSize: 12
    }

    Text {
        text: "2"
        anchors.fill: parent
    }


    /*
    HierarchyItemChilds {
        id: hierarchyItemChilds1
        model: modelData.childItems
        x: 8
        y: 22
    }
    */
}
