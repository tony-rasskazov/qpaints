import QtQuick 2.4

Rectangle {
    id: rectangle1
    width: 200
    height: 50
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

    /*
    HierarchyItemChilds {
        id: hierarchyItemChilds1
        model: modelData.childItems
        delegate: HierarchyItem { }

        anchors.top: parent.top
        anchors.topMargin: 22
        anchors.right: parent.right
        anchors.rightMargin: 8
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 8
        anchors.left: parent.left
        anchors.leftMargin: 8
    }
    */

}
