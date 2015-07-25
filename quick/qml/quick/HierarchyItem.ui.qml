import QtQuick 2.4

Rectangle {
    id: rectangle1
    width: 100
    height: 62
    color: "gray"
    border.color: "black"

    Text {
        id: text1
        x: 8
        y: 8
        text: modelData.content
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        font.pixelSize: 12
    }
}

