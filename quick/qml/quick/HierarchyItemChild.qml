import QtQuick 2.0

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
}
